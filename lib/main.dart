import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_app/common/cubit/user_cubit.dart';
import 'package:flutter_spotify_app/core/config/theme/app_themes.dart';
import 'package:flutter_spotify_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_spotify_app/features/home/presentation/cubit/playlist_cubit.dart';
import 'package:flutter_spotify_app/features/home/presentation/cubit/song_cubit.dart';
import 'package:flutter_spotify_app/features/intro/presentation/cubit/theme_cubit.dart';
import 'package:flutter_spotify_app/features/intro/presentation/pages/splash_page.dart';
import 'package:flutter_spotify_app/firebase_options.dart';
import 'package:flutter_spotify_app/init_dependencies.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initDependencies();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => serviceLocator<ThemeCubit>()),
          BlocProvider(create: (context) => serviceLocator<UserCubit>()),
          BlocProvider(create: (context) => serviceLocator<AuthBloc>()),
          BlocProvider(create: (context) => serviceLocator<SongCubit>()),
          BlocProvider(create: (context) => serviceLocator<PlaylistCubit>()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    context.read<AuthBloc>().add(AuthGetCurrentUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, mode) {
        return MaterialApp(
          // ignore: deprecated_member_use
          useInheritedMediaQuery: true,
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          title: 'Spotify Demo',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,
          // home: HomePage(),
          home: BlocSelector<UserCubit, UserState, bool>(
            selector: (state) {
              return state is UserLoggedIn;
            },
            builder: (context, isLoggedIn) {
              return SplashPage(isLoggedIn: isLoggedIn);
            },
          ),
        );
      },
    );
  }
}
