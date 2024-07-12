import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spotify_app/features/home/data/models/song_model.dart';

abstract interface class SongFirebaseService {
  Future<List<SongModel>> getNewsSong();
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
      songs.add(SongModel.fromMap(element.data()));
    }

    return songs;
  }
}
