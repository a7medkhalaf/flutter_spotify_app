import 'package:flutter/material.dart';
import 'package:flutter_spotify_app/common/utils/is_dark_mode.dart';
import 'package:flutter_spotify_app/common/utils/to_camel_case.dart';
import 'package:flutter_spotify_app/core/config/theme/app_colors.dart';
import 'package:flutter_spotify_app/features/home/domain/entities/song_entity.dart';
import 'package:flutter_spotify_app/features/home/presentation/pages/song_player_page.dart';

class PlaylistItem extends StatelessWidget {
  final SongEntity song;
  const PlaylistItem(this.song, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(SongPlayerPage.route(song));
      },
      contentPadding: const EdgeInsets.all(0.0),
      title: Text(song.title.toCamelCase()),
      subtitle: Text(song.artist.toCamelCase()),
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.isDarkMode ? AppColors.dartGray : AppColors.gray,
        ),
        child: Icon(
          Icons.play_arrow,
          color: context.isDarkMode ? AppColors.gray : AppColors.dartGray,
        ),
      ),
      trailing: Container(
        alignment: Alignment.center,
        width: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(song.duration.toStringAsFixed(2)),
            const Icon(Icons.favorite_border),
          ],
        ),
      ),
    );
  }
}
