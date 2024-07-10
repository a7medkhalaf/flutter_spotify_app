import 'package:flutter_spotify_app/common/cubit/user_cubit.dart';
import 'package:flutter_spotify_app/features/auth/data/repository/auth_repository.dart';
import 'package:flutter_spotify_app/features/auth/data/sources/auth_firebase.dart';
import 'package:flutter_spotify_app/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_spotify_app/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:flutter_spotify_app/features/auth/domain/usecases/signin_usecase.dart';
import 'package:flutter_spotify_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:flutter_spotify_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_spotify_app/features/intro/presentation/cubit/theme_cubit.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  serviceLocator
    ..registerLazySingleton(
      () => ThemeCubit(),
    )
    ..registerLazySingleton<AuthFirebaseService>(
      () => AuthFirebaseServiceImpl(),
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator()),
    )
    ..registerLazySingleton(
      () => SignInUsecase(serviceLocator()),
    )
    ..registerLazySingleton(
      () => SignUpUsecase(serviceLocator()),
    )
    ..registerLazySingleton(
      () => GetCurrentUserUsecase(serviceLocator()),
    )
    ..registerLazySingleton(
      () => UserCubit(),
    )
    ..registerLazySingleton(
      () => AuthBloc(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ),
    );
}
