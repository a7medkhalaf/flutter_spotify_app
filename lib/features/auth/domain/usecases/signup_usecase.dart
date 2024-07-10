import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spotify_app/core/usecase/usecase.dart';
import 'package:flutter_spotify_app/features/auth/domain/repository/auth_repository.dart';

class SignUpUsecase implements UseCase<Either, SingUpParams> {
  final AuthRepository _authRepository;
  SignUpUsecase(this._authRepository);

  @override
  Future<Either> call(SingUpParams params) async {
    try {
      final user = await _authRepository.singUp(
        name: params.name,
        email: params.email,
        password: params.password,
      );
      return Right(user);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return const Left('Email already in use');
        case 'invalid-email':
          return const Left('Invalid email');
        case 'operation-not-allowed':
          return const Left('Operation not allowed');
        case 'weak-password':
          return const Left('Weak password');
        default:
          return Left(e.toString());
      }
    }
  }
}

class SingUpParams {
  final String name;
  final String email;
  final String password;

  SingUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
