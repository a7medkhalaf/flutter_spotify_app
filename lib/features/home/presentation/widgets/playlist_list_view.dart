import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_app/common/utils/show_snackbar.dart';
import 'package:flutter_spotify_app/features/home/presentation/cubit/playlist_cubit.dart';
import 'package:flutter_spotify_app/features/home/presentation/widgets/playlist_list_item.dart';

class PlaylistWidget extends StatelessWidget {
  final bool isFavorites;
  const PlaylistWidget({
    super.key,
    this.isFavorites = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlaylistCubit, PlaylistState>(
      listener: (context, state) {
        if (state is PlaylistFailure) {
          showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is PlaylistLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PlaylistLoaded) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.songs.length,
            itemBuilder: (context, index) {
              final song = state.songs.elementAt(index);
              if (isFavorites) {
                if (song.isFavorite ?? false) {
                  return PlaylistItem(song);
                } else {
                  return const SizedBox();
                }
              }
              return PlaylistItem(song);
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
