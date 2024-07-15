import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_app/init_dependencies.dart';
import 'package:just_audio/just_audio.dart';

part 'song_player_state.dart';

class SongPlayerCubit extends Cubit<SongPlayerState> {
  final audioPlayer = serviceLocator<AudioPlayer>();
  var songPosition = serviceLocator<AudioPlayer>().position;
  var songDuration = serviceLocator<AudioPlayer>().duration ?? Duration.zero;

  SongPlayerCubit() : super(SongPlayerLoading()) {
    audioPlayer.positionStream.listen((position) {
      songPosition = position;
      log('position: $position');
      emit(SongPlayerLoaded());
    });
    audioPlayer.durationStream.listen((duration) {
      songDuration = duration!;
      log('duration: $duration');
      emit(SongPlayerLoaded());
    });
  }

  Future<void> loadSong(String url) async {
    log('url: $url');
    try {
      await audioPlayer.setUrl(url);
      emit(SongPlayerLoaded());
    } catch (e) {
      emit(SongPlayerFailure(e.toString()));
    }
  }

  void playOrPause() async {
    if (audioPlayer.playing) {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }
    emit(SongPlayerLoaded());
  }

  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
