import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_app/common/utils/is_dark_mode.dart';
import 'package:flutter_spotify_app/core/config/theme/app_colors.dart';
import 'package:flutter_spotify_app/features/home/domain/entities/song_entity.dart';
import 'package:flutter_spotify_app/features/home/presentation/cubit/favorite_song_cubit.dart';

class FavoriteWidget extends StatefulWidget {
  final SongEntity song;
  const FavoriteWidget(this.song, {super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  @override
  Widget build(BuildContext context) {
    bool isFav = widget.song.isFavorite ?? false;
    final songId = widget.song.songId!;
    return GestureDetector(
      onTap: () {
        context.read<FavoriteSongCubit>().addOrRemoveFavorite(songId);
        widget.song.isFavorite = !isFav;
        setState(() {});
      },
      child: Icon(
        isFav ? Icons.favorite : Icons.favorite_border,
        color: context.isDarkMode ? AppColors.gray : AppColors.dartGray,
      ),
    );
  }
}
