import 'package:flutter_spotify_app/features/home/domain/entities/song_entity.dart';

abstract interface class SongRepository {
  Future<List<SongEntity>> getNewsSong();
  Future<List<SongEntity>> getPlaylist();
  Future<bool> addOrRemoveFavoriteSong(String songId);
  Future<bool> isFavoriteSong(String songId);
}
