import 'package:flutter_spotify_app/core/usecase/usecase.dart';
import 'package:flutter_spotify_app/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_spotify_app/features/auth/domain/repository/auth_repository.dart';

class GetCurrentUserUsecase implements UseCase<UserEntity?, NoParams> {
  final AuthRepository _authRepository;
  GetCurrentUserUsecase(this._authRepository);

  @override
  Future<UserEntity?> call(NoParams params) {
    return Future.value(_authRepository.getCurrentUser);
  }
}
