import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_app/common/cubit/user_cubit.dart';
import 'package:flutter_spotify_app/core/usecase/usecase.dart';
import 'package:flutter_spotify_app/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_spotify_app/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:flutter_spotify_app/features/auth/domain/usecases/signin_usecase.dart';
import 'package:flutter_spotify_app/features/auth/domain/usecases/signup_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUsecase _signInUsecase;
  final SignUpUsecase _signUpUsecase;
  final GetCurrentUserUsecase _getCurrentUserUsecase;
  final UserCubit _userCubit;

  AuthBloc(
    this._signInUsecase,
    this._signUpUsecase,
    this._getCurrentUserUsecase,
    this._userCubit,
  ) : super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignIn>(_onAuthSignIn);
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthGetCurrentUser>(_onGetCurrentUser);
  }

  void _onAuthSignIn(
    AuthSignIn event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _signInUsecase.call(
      SignInParams(
        email: event.email,
        password: event.password,
      ),
    );
    res.fold(
      (l) => emit(AuthFailure(l)),
      (r) {
        _userCubit.updateUser(r);
        emit(AuthSuccess(r));
      },
    );
  }

  void _onAuthSignUp(
    AuthSignUp event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _signUpUsecase.call(
      SingUpParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );
    res.fold(
      (l) => emit(AuthFailure(l)),
      (r) {
        _userCubit.updateUser(r);
        emit(AuthSuccess(r));
      },
    );
  }

  void _onGetCurrentUser(
    AuthGetCurrentUser event,
    Emitter<AuthState> emit,
  ) async {
    final user = await _getCurrentUserUsecase.call(NoParams());
    if (user == null) {
      emit(AuthInitial());
    } else {
      _userCubit.updateUser(user);
      emit(AuthSuccess(user));
    }
  }
}
