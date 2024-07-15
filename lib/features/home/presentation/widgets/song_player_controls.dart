import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_app/core/config/theme/app_colors.dart';
import 'package:flutter_spotify_app/features/home/presentation/cubit/song_player_cubit.dart';

class SongPlayerControls extends StatelessWidget {
  const SongPlayerControls({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<SongPlayerCubit>().playOrPause();
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: AppColors.primary),
        child: Icon(
          context.watch<SongPlayerCubit>().audioPlayer.playing
              ? Icons.pause
              : Icons.play_arrow,
        ),
      ),
    );
  }
}
