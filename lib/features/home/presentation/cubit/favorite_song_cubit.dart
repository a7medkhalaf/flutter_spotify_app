import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_app/features/home/domain/usecases/add_or_remove_fav_song_usecase.dart';

part 'favorite_song_state.dart';

class FavoriteSongCubit extends Cubit<FavoriteSongState> {
  final AddOrRemoteFavoriteSongUsecase _addOrRemoteFavoriteSong;
  FavoriteSongCubit(this._addOrRemoteFavoriteSong)
      : super(FavoriteSongInitial());

  void addOrRemoveFavorite(String songId) async {
    final res = await _addOrRemoteFavoriteSong(songId);
    res.fold(
      (l) => emit(FavoriteSongFailure(l)),
      (r) => emit(FavoriteSongUpdated(r)),
    );
  }
}
