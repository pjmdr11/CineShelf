import 'package:cine_shelf/domain/entities/data_state.dart';
import 'package:cine_shelf/features/auth/domain/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginUseCase {
  final UserRepository userRepo;

  LoginUseCase({required this.userRepo});

  Future<DataState<User>> loginUser(String email, String password) async {
    return await userRepo.loginUser(email, password);
  }
}
