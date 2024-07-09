import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_app/core/config/assets/app_vectors.dart';
import 'package:flutter_spotify_app/presentation/choose_mode/cubit/theme_cubit.dart';
import 'package:flutter_spotify_app/presentation/choose_mode/widgets/mode_widget.dart';

class ChooseModeWidget extends StatefulWidget {
  const ChooseModeWidget({super.key});

  @override
  State<ChooseModeWidget> createState() => _ChooseModeWidgetState();
}

class _ChooseModeWidgetState extends State<ChooseModeWidget> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = context.read<ThemeCubit>().state == ThemeMode.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
            setState(() {
              isDarkMode = true;
            });
          },
          child: ModeWidget(
            modeAsset: AppVectors.moon,
            modeText: 'Dark Mode',
            isSelected: isDarkMode,
          ),
        ),
        const SizedBox(width: 30),
        GestureDetector(
          onTap: () {
            context.read<ThemeCubit>().updateTheme(ThemeMode.light);
            setState(() {
              isDarkMode = false;
            });
          },
          child: ModeWidget(
            modeAsset: AppVectors.sun,
            modeText: 'Light Mode',
            isSelected: !isDarkMode,
          ),
        ),
      ],
    );
  }
}
