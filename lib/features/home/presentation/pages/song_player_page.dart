import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_app/common/widgets/app_bar.dart';
import 'package:flutter_spotify_app/core/constants/app_urls.dart';
import 'package:flutter_spotify_app/features/home/domain/entities/song_entity.dart';
import 'package:flutter_spotify_app/features/home/presentation/cubit/song_player_cubit.dart';
import 'package:flutter_spotify_app/features/home/presentation/widgets/song_player_controls.dart';
import 'package:flutter_spotify_app/features/home/presentation/widgets/song_player_cover.dart';
import 'package:flutter_spotify_app/features/home/presentation/widgets/song_player_details.dart';
import 'package:flutter_spotify_app/features/home/presentation/widgets/song_player_slider.dart';

class SongPlayerPage extends StatefulWidget {
  final SongEntity song;
  static route(SongEntity song) {
    return MaterialPageRoute(
      builder: (context) => SongPlayerPage(song),
    );
  }

  const SongPlayerPage(this.song, {super.key});

  @override
  State<SongPlayerPage> createState() => _SongPlayerPageState();
}

class _SongPlayerPageState extends State<SongPlayerPage> {
  @override
  void initState() {
    context.read<SongPlayerCubit>().loadSong(
        '${AppURLs.songFireStorage}${widget.song.artist}_${widget.song.title}.mp3${AppURLs.mediaAlt}');
    super.initState();
  }

  @override
  void dispose() {
    // serviceLocator<AudioPlayer>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Now Playing'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SongCover(song: widget.song),
            SongDetails(song: widget.song),
            const SongSlider(),
            const SongPlayerControls(),
          ],
        ),
      ),
    );
  }
}
