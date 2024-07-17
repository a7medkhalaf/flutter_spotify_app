import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spotify_app/features/home/data/models/song_model.dart';

abstract interface class SongFirebaseService {
  Future<List<SongModel>> getNewsSong();
  Future<List<SongModel>> getPlaylist();
  Future<bool> addOrRemoveFavoriteSong(String songId);
  Future<bool> isFavoriteSong(String songId);
}

class SongFirebaseServiceImpl implements SongFirebaseService {
  @override
  Future<List<SongModel>> getNewsSong() async {
    final List<SongModel> songs = [];

    final data = await FirebaseFirestore.instance
        .collection('songs')
        .orderBy('releaseDate', descending: true)
        .limit(3)
        .get();
    for (var element in data.docs) {
      final song = SongModel.fromMap(element.data());
      final isFav = await isFavoriteSong(element.reference.id);
      song.songId = element.reference.id;
      song.isFavorite = isFav;
      songs.add(song);
    }

    return songs;
  }

  @override
  Future<List<SongModel>> getPlaylist() async {
    final List<SongModel> songs = [];

    final data = await FirebaseFirestore.instance
        .collection('songs')
        .orderBy('releaseDate', descending: true)
        .get();
    for (var element in data.docs) {
      final song = SongModel.fromMap(element.data());
      final isFav = await isFavoriteSong(element.reference.id);
      song.songId = element.reference.id;
      song.isFavorite = isFav;
      songs.add(song);

      log('songId: ${song.songId}');
      log('isFav: ${song.isFavorite}\n');
    }

    return songs;
  }

  @override
  Future<bool> addOrRemoveFavoriteSong(String songId) async {
    late final bool isFavorite;
    final userId = FirebaseAuth.instance.currentUser!.uid;

    final songs = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .where('songId', isEqualTo: songId)
        .get();

    if (songs.docs.isNotEmpty) {
      log('Deleting fav song.');
      isFavorite = false;
      await songs.docs.first.reference.delete();
    } else {
      log('Adding fav song.');
      isFavorite = true;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('favorites')
          .add(
        {
          'songId': songId,
          'addedTime': DateTime.now(),
        },
      );
    }

    return isFavorite;
  }

  @override
  Future<bool> isFavoriteSong(String songId) async {
    late final bool isFavorite;
    final userId = FirebaseAuth.instance.currentUser!.uid;

    final songs = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .where('songId', isEqualTo: songId)
        .get();

    if (songs.docs.isNotEmpty) {
      isFavorite = true;
    } else {
      isFavorite = false;
    }

    return isFavorite;
  }
}
