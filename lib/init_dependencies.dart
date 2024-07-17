import 'package:flutter_spotify_app/common/cubit/user_cubit.dart';
import 'package:flutter_spotify_app/features/auth/data/repository/auth_repository.dart';
import 'package:flutter_spotify_app/features/auth/data/sources/auth_firebase.dart';
import 'package:flutter_spotify_app/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_spotify_app/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:flutter_spotify_app/features/auth/domain/usecases/signin_usecase.dart';
import 'package:flutter_spotify_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:flutter_spotify_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_spotify_app/features/home/data/repository/song_repository_impl.dart';
import 'package:flutter_spotify_app/features/home/data/sources/song_firebase.dart';
import 'package:flutter_spotify_app/features/home/domain/repository/song_repository.dart';
import 'package:flutter_spotify_app/features/home/domain/usecases/add_or_remove_fav_song_usecase.dart';
import 'package:flutter_spotify_app/features/home/domain/usecases/get_news_usecase.dart';
import 'package:flutter_spotify_app/features/home/domain/usecases/get_playlist_usecase.dart';
import 'package:flutter_spotify_app/features/home/domain/usecases/is_favorite_song_usecase.dart';
import 'package:flutter_spotify_app/features/home/presentation/cubit/favorite_song_cubit.dart';
import 'package:flutter_spotify_app/features/home/presentation/cubit/playlist_cubit.dart';
import 'package:flutter_spotify_app/features/home/presentation/cubit/song_cubit.dart';
import 'package:flutter_spotify_app/features/home/presentation/cubit/song_player_cubit.dart';
import 'package:flutter_spotify_app/features/intro/presentation/cubit/theme_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // Auth
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

  // Home
  serviceLocator
    ..registerLazySingleton<SongFirebaseService>(
      () => SongFirebaseServiceImpl(),
    )
    ..registerLazySingleton<SongRepository>(
      () => SongRepositoryImpl(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => GetNewsUsecase(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => GetPlaylistUsecase(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => PlaylistCubit(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => SongCubit(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => AudioPlayer(),
    )
    ..registerLazySingleton(
      () => SongPlayerCubit(),
    )
    ..registerLazySingleton(
      () => AddOrRemoteFavoriteSongUsecase(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => IsFavoriteSongUseCase(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => FavoriteSongCubit(
        serviceLocator(),
      ),
    );
}
