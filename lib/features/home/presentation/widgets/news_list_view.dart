import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_app/common/utils/show_snackbar.dart';
import 'package:flutter_spotify_app/features/home/presentation/cubit/song_cubit.dart';
import 'package:flutter_spotify_app/features/home/presentation/widgets/news_list_view_item.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SongCubit, SongState>(
      listener: (context, state) {
        if (state is SongFailure) {
          showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return BlocBuilder<SongCubit, SongState>(
          builder: (context, state) {
            if (state is SongLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SongLoaded) {
              return ListView.builder(
                itemCount: state.songs.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return NewsListItem(song: state.songs.elementAt(index));
                },
              );
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}
