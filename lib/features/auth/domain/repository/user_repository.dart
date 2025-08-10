import 'package:cine_shelf/domain/entities/data_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  Future<DataState<User>> createUser(
    String email,
    String password,
    String phone,
    String fullname,
    String address,
  );
  Future<DataState<User>> loginUser(String email, String password);
  Future<bool> logOut();
  Future<DataState<User>> getSessionStatus();
  Stream<DataState<User>> watchSessionStatus();
}
