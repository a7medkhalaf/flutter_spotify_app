import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_app/core/usecase/usecase.dart';
import 'package:flutter_spotify_app/features/home/domain/repository/song_repository.dart';

class GetPlaylistUsecase implements UseCase<Either, NoParams> {
  final SongRepository _songRepository;
  const GetPlaylistUsecase(this._songRepository);

  @override
  Future<Either> call(NoParams params) async {
    try {
      final songs = await _songRepository.getPlaylist();
      log('songs: $songs');
      return Right(songs);
    } catch (e) {
      log('error: $e');
      return Left(e.toString());
    }
  }
}
