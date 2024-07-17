import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_app/core/usecase/usecase.dart';
import 'package:flutter_spotify_app/features/home/domain/repository/song_repository.dart';

class AddOrRemoteFavoriteSongUsecase implements UseCase<Either, String> {
  final SongRepository _songRepository;

  const AddOrRemoteFavoriteSongUsecase(this._songRepository);

  @override
  Future<Either> call(String songId) async {
    try {
      final isFav = await _songRepository.addOrRemoveFavoriteSong(songId);
      return Right(isFav);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
