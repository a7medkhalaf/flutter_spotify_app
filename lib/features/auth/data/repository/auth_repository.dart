import 'package:flutter_spotify_app/features/auth/data/models/user_model.dart';
import 'package:flutter_spotify_app/features/auth/data/sources/auth_firebase.dart';
import 'package:flutter_spotify_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthFirebaseService _authFirebaseService;
  AuthRepositoryImpl(this._authFirebaseService);

  @override
  UserModel? get getCurrentUser => _authFirebaseService.getCurrentUser;

  @override
  Future<UserModel> singIn({
    required String email,
    required String password,
  }) async {
    return await _authFirebaseService.singIn(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserModel> singUp({
    required String name,
    required String email,
    required String password,
  }) async {
    return await _authFirebaseService.singUp(
      name: name,
      email: email,
      password: password,
    );
  }
}
