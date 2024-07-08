import 'package:flutter/material.dart';
import 'package:flutter_spotify_app/core/config/theme/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Demo',
      theme: AppTheme.darkTheme,
      home: const Placeholder(),
    );
  }
}
