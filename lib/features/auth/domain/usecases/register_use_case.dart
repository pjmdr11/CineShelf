import 'package:cine_shelf/core/constants/id_constants.dart';
import 'package:cine_shelf/domain/entities/data_state.dart';
import 'package:cine_shelf/features/auth/domain/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RegisterUseCase {
  final UserRepository userRepo;

  RegisterUseCase({required this.userRepo});

  Future<DataState<User>> registerUser(Map<String, dynamic> formData) async {
    final email = formData[idRegistrationEmail];
    final password = formData[idLoginPassword];
    final phone = formData[idRegistrationPhone] ?? "";
    final fullName = formData[idRegistrationName] ?? "";
    final address = formData[idRegistrationAddress] ?? "";
    return await userRepo.createUser(email, password, phone, fullName, address);
  }
}
