import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_app/features/auth/domain/entities/user_entity.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void updateUser(UserEntity? user) {
    if (user == null) {
      emit(UserInitial());
    } else {
      emit(UserLoggedIn(user));
    }
  }
}
