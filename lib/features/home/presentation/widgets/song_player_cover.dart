import 'package:flutter/material.dart';
import 'package:flutter_spotify_app/core/constants/app_urls.dart';
import 'package:flutter_spotify_app/features/home/domain/entities/song_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SongCover extends StatelessWidget {
  const SongCover({
    super.key,
    required this.song,
  });

  final SongEntity song;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            '${AppURLs.coverFireStorage}${song.artist}.jpg${AppURLs.mediaAlt}',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
