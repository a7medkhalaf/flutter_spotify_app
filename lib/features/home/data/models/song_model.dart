import 'package:flutter_spotify_app/features/home/domain/entities/song_entity.dart';

class SongModel extends SongEntity {
  SongModel({
    required super.title,
    required super.artist,
    required super.duration,
    required super.releaseDate,
    super.songId,
    super.isFavorite,
  });

  factory SongModel.fromMap(Map<String, dynamic> map) {
    return SongModel(
      title: map['surah'] as String,
      artist: map['shikh'] as String,
      duration: map['duration'] as num,
      releaseDate: map['releaseDate'],
    );
  }
}
