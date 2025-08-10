import 'package:cine_shelf/core/constants/app_constants.dart';
import 'package:cine_shelf/domain/entities/app_exception_model.dart';
import 'package:cine_shelf/domain/entities/data_state.dart';
import 'package:cine_shelf/features/auth/domain/repository/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepository, order: -1)
class UserRepositoryImpl extends UserRepository {
  @override
  Future<DataState<User>> createUser(
    String email,
    String password,
    String phone,
    String fullname,
    String address,
  ) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final userId = userCredential.user?.uid;
      await userCredential.user?.updateDisplayName(fullname);
      await FirebaseFirestore.instance
          .collection(storeCollectionUsers)
          .doc(userId)
          .set({
            "username": fullname,
            "phone": phone,
            "address": address,
            "email": email,
            "createdAt": FieldValue.serverTimestamp(),
          });
      final user = FirebaseAuth.instance.currentUser;
      return ResultSuccess(user!);
    } on FirebaseAuthException catch (fe) {
      var errMessage = "error.task_failed".tr();
      if (fe.code == "weak-password") {
        errMessage = "error.text_weak_password".tr();
      } else if (fe.code == "email-already-in-use") {
        errMessage = "error.email_used".tr();
      } else {
        errMessage = fe.message ?? "error.task_failed".tr();
      }
      return ResultFailure(AppException(code: "400", message: errMessage));
    } catch (exception) {
      return ResultFailure(AppException(message: exception.toString()));
    }
  }

  @override
  Future<bool> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<DataState<User>> loginUser(String email, String password) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return ResultSuccess(userCredential.user!);
    } on FirebaseAuthException catch (fe) {
      return ResultFailure(AppException(message: fe.message));
    } catch (e) {
      return ResultFailure(AppException(message: e.toString()));
    }
  }

  @override
  Future<DataState<User>> getSessionStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return ResultFailure(AppException());
    } else {
      return ResultSuccess(currentUser);
    }
  }

  @override
  Stream<DataState<User>> watchSessionStatus() {
    return FirebaseAuth.instance.authStateChanges().map((user) {
      if (user == null) {
        return ResultFailure(AppException());
      } else {
        return ResultSuccess(user);
      }
    });
  }
}
