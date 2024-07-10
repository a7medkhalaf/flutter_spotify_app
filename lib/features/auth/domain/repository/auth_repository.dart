import 'package:flutter_spotify_app/features/auth/domain/entities/user_entity.dart';

abstract interface class AuthRepository {
  UserEntity? get getCurrentUser;
  Future<UserEntity> singIn({
    required String email,
    required String password,
  });
  Future<UserEntity> singUp({
    required String name,
    required String email,
    required String password,
  });
}
