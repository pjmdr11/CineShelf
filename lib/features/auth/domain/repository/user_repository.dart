import 'package:cine_shelf/domain/entiities/data_state.dart';
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
  Future<DataState<User>> getSessionStatus();
}
