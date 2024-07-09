import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_app/core/config/theme/app_themes.dart';
import 'package:flutter_spotify_app/presentation/choose_mode/cubit/theme_cubit.dart';
import 'package:flutter_spotify_app/presentation/splash/pages/splash_page.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            // ignore: deprecated_member_use
            useInheritedMediaQuery: true,
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            title: 'Spotify Demo',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state,
            home: const SplashPage(),
          );
        },
      ),
    );
  }
}
