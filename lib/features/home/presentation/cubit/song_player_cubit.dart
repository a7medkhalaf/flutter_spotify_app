import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_app/init_dependencies.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_cache/just_audio_cache.dart';

part 'song_player_state.dart';

class SongPlayerCubit extends Cubit<SongPlayerState> {
  final audioPlayer = serviceLocator<AudioPlayer>();
  var songPosition = serviceLocator<AudioPlayer>().position;
  var songDuration = serviceLocator<AudioPlayer>().duration ?? Duration.zero;

  String? currentUrl;

  SongPlayerCubit() : super(SongPlayerLoading()) {
    audioPlayer.positionStream.listen((position) {
      songPosition = position;
      emit(SongPlayerLoaded());
    });
    audioPlayer.durationStream.listen((duration) {
      songDuration = duration!;
      emit(SongPlayerLoaded());
    });
    audioPlayer.processingStateStream.listen((state) {
      if (state == ProcessingState.completed) {
        stopPlayer();
      }
    });
  }

  Future<void> loadSong(String url) async {
    log('url: $url');
    if (currentUrl == url) {
      log('The song is already playing.');
      return;
    }
    try {
      currentUrl = url;
      await audioPlayer.dynamicSet(url: url);
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

  void stopPlayer() {
    audioPlayer.stop();
    audioPlayer.seek(Duration.zero);
    currentUrl = null;
    emit(SongPlayerInitial());
  }

  @override
  Future<void> close() async {
    await audioPlayer.dispose();
    return super.close();
  }
}
