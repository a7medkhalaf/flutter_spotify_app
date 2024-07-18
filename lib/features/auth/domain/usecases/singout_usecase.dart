import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_app/core/usecase/usecase.dart';
import 'package:flutter_spotify_app/features/auth/domain/repository/auth_repository.dart';

class SignOutUsecase implements UseCase<Either, NoParams> {
  final AuthRepository _authRepository;
  const SignOutUsecase(this._authRepository);

  @override
  Future<Either> call(NoParams params) async {
    try {
      await _authRepository.signOut();
      log('SignOutUsecase: success');
      return const Right(null);
    } catch (e) {
      log('SignOutUsecase: $e');
      return Left(e.toString());
    }
  }
}
