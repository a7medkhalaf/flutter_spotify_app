import 'package:flutter_spotify_app/features/home/data/sources/song_firebase.dart';
import 'package:flutter_spotify_app/features/home/domain/entities/song_entity.dart';
import 'package:flutter_spotify_app/features/home/domain/repository/song_repository.dart';

class SongRepositoryImpl implements SongRepository {
  final SongFirebaseService _songFirebaseService;
  const SongRepositoryImpl(this._songFirebaseService);

  @override
  Future<List<SongEntity>> getNewsSong() async {
    return await _songFirebaseService.getNewsSong();
  }

  @override
  Future<List<SongEntity>> getPlaylist() async {
    return await _songFirebaseService.getPlaylist();
  }
}
