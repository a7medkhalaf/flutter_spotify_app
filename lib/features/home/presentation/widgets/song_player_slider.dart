import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_app/common/utils/show_snackbar.dart';
import 'package:flutter_spotify_app/features/home/presentation/cubit/song_player_cubit.dart';

class SongSlider extends StatelessWidget {
  const SongSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SongPlayerCubit, SongPlayerState>(
      listener: (context, state) {
        if (state is SongPlayerFailure) {
          showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is SongPlayerLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SongPlayerLoaded) {
          return Column(
            children: [
              Slider(
                min: 0,
                max: context
                    .read<SongPlayerCubit>()
                    .songDuration
                    .inSeconds
                    .toDouble(),
                value: context
                    .read<SongPlayerCubit>()
                    .songPosition
                    .inSeconds
                    .toDouble(),
                onChanged: (value) {},
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${context.read<SongPlayerCubit>().songPosition.inMinutes}:${context.read<SongPlayerCubit>().songPosition.inSeconds.remainder(60)}',
                    ),
                    Text(
                      '${context.read<SongPlayerCubit>().songDuration.inMinutes}:${context.read<SongPlayerCubit>().songDuration.inSeconds.remainder(60)}',
                    ),
                  ],
                ),
              )
            ],
          );
        }
        return const SizedBox();
      },
    );
  }

  String formatDuration(Duration duration) {
    return '${duration.inMinutes}:${duration.inSeconds.remainder(60)}';
  }
}
