part of 'favorite_song_cubit.dart';

@immutable
sealed class FavoriteSongState {}

final class FavoriteSongInitial extends FavoriteSongState {}

final class FavoriteSongFailure extends FavoriteSongState {
  final String message;
  FavoriteSongFailure(this.message);
}

final class FavoriteSongUpdated extends FavoriteSongState {
  final bool isFavorite;
  FavoriteSongUpdated(this.isFavorite);
}
