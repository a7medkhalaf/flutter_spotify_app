import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_app/core/usecase/usecase.dart';
import 'package:flutter_spotify_app/features/home/domain/entities/song_entity.dart';
import 'package:flutter_spotify_app/features/home/domain/usecases/get_playlist_usecase.dart';

part 'playlist_state.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  final GetPlaylistUsecase _getPlaylist;
  PlaylistCubit(this._getPlaylist) : super(PlaylistLoading());

  Future<void> getPlaylist() async {
    final res = await _getPlaylist.call(NoParams());
    res.fold(
      (l) => emit(PlaylistFailure(message: l)),
      (r) => emit(PlaylistLoaded(songs: r)),
    );
  }
}
