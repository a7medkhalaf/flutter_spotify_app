import 'package:dartz/dartz.dart';
import 'package:flutter_spotify_app/core/usecase/usecase.dart';
import 'package:flutter_spotify_app/features/home/domain/repository/song_repository.dart';

class GetNewsUsecase implements UseCase<Either, NoParams> {
  final SongRepository _songRepository;
  const GetNewsUsecase(this._songRepository);

  @override
  Future<Either> call(NoParams params) async {
    try {
      final songs = await _songRepository.getNewsSong();
      return Right(songs);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
