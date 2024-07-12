import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_app/core/usecase/usecase.dart';
import 'package:flutter_spotify_app/features/home/domain/entities/song_entity.dart';
import 'package:flutter_spotify_app/features/home/domain/usecases/get_news_usecase.dart';

part 'song_state.dart';

class SongCubit extends Cubit<SongState> {
  final GetNewsUsecase _getNewsUsecase;
  SongCubit(this._getNewsUsecase) : super(SongLoading());

  Future<void> getNewsSongs() async {
    final res = await _getNewsUsecase.call(NoParams());
    res.fold(
      (l) => emit(SongFailure(message: l)),
      (r) => emit(SongLoaded(songs: r)),
    );
  }
}
