import 'package:flutter/material.dart';
import 'package:flutter_spotify_app/common/utils/is_dark_mode.dart';
import 'package:flutter_spotify_app/common/utils/to_camel_case.dart';
import 'package:flutter_spotify_app/core/config/theme/app_colors.dart';
import 'package:flutter_spotify_app/core/constants/app_urls.dart';
import 'package:flutter_spotify_app/features/home/domain/entities/song_entity.dart';
import 'package:flutter_spotify_app/features/home/presentation/pages/song_player_page.dart';

class NewsListItem extends StatelessWidget {
  final SongEntity song;
  const NewsListItem({
    super.key,
    required this.song,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(SongPlayerPage.route(song));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: NetworkImage(
                        '${AppURLs.coverFireStorage}${song.artist}.jpg${AppURLs.mediaAlt}'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Align(
                  alignment: Alignment.bottomRight,
                  child: PlaySongWidget(),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              song.title.toCamelCase(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              song.artist.toCamelCase(),
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.gray,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlaySongWidget extends StatelessWidget {
  const PlaySongWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      transform: Matrix4.translationValues(10, 10, 0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.isDarkMode ? AppColors.dartGray : AppColors.gray,
      ),
      child: Icon(
        Icons.play_arrow,
        color: context.isDarkMode ? AppColors.gray : AppColors.dartGray,
      ),
    );
  }
}
