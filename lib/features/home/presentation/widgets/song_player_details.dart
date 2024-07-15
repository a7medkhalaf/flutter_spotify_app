import 'package:flutter/material.dart';
import 'package:flutter_spotify_app/common/utils/is_dark_mode.dart';
import 'package:flutter_spotify_app/common/utils/to_camel_case.dart';
import 'package:flutter_spotify_app/core/config/theme/app_colors.dart';
import 'package:flutter_spotify_app/features/home/domain/entities/song_entity.dart';

class SongDetails extends StatelessWidget {
  const SongDetails({
    super.key,
    required this.song,
  });

  final SongEntity song;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              song.title.toCamelCase(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              song.artist.toCamelCase(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: context.isDarkMode ? AppColors.gray : AppColors.dartGray,
              ),
            ),
          ],
        ),
        const Icon(Icons.favorite_border),
      ],
    );
  }
}
