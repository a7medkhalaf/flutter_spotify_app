part of 'song_cubit.dart';

@immutable
sealed class SongState {}

final class SongInitial extends SongState {}

final class SongLoading extends SongState {}

final class SongLoaded extends SongState {
  final List<SongEntity> songs;
  SongLoaded({required this.songs});
}

final class SongFailure extends SongState {
  final String message;
  SongFailure({required this.message});
}
