import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spotify_app/core/usecase/usecase.dart';
import 'package:flutter_spotify_app/features/auth/domain/repository/auth_repository.dart';

class SignInUsecase implements UseCase<Either, SignInParams> {
  final AuthRepository _authRepository;
  SignInUsecase(this._authRepository);

  @override
  Future<Either> call(SignInParams params) async {
    try {
      final user = await _authRepository.singIn(
        email: params.email,
        password: params.password,
      );
      return Right(user);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email:':
          return const Left('Invalid email');
        case 'user-disabled:':
          return const Left('User disabled');
        case 'user-not-found:':
          return const Left('User not found');
        case 'wrong-password:':
          return const Left('Wrong password');
        default:
      }
      return Left(e.toString());
    }
  }
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({
    required this.email,
    required this.password,
  });
}
