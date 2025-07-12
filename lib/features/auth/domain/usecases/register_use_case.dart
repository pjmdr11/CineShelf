import 'package:cine_shelf/domain/entiities/data_state.dart';
import 'package:cine_shelf/features/auth/domain/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RegisterUseCase {
  final UserRepository userRepo;

  RegisterUseCase({required this.userRepo});

  Future<DataState<User>> registerUser(
    String email,
    String password,
    String fullname,
    String phone,
    String address,
  ) async {
    return await userRepo.createUser(email, password, phone, fullname, address);
  }
}
