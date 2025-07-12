import 'package:cine_shelf/domain/entiities/data_state.dart';
import 'package:cine_shelf/features/auth/domain/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetSessionUseCase {
  final UserRepository userRepo;

  GetSessionUseCase({required this.userRepo});

  Future<DataState<User>> isUserLoggedIn(String email) async {
    return await userRepo.getSessionStatus();
  }
}
