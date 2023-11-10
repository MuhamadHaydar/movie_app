part of 'database_bloc.dart';

abstract class DatabaseEvent extends Equatable {
  const DatabaseEvent();
}

class AddMovieToDatabase extends DatabaseEvent {
  final MovieLocalData currentMovie;

  AddMovieToDatabase({required this.currentMovie});

  @override
  List<Object> get props => [currentMovie];
}

class CheckMovieAvailability extends DatabaseEvent {
  final String movieId;

  CheckMovieAvailability({required this.movieId});

  @override
  List<Object> get props => [movieId];
}

class DeleteMovieFromDatabase extends DatabaseEvent {
  final String movieId;

  DeleteMovieFromDatabase({required this.movieId});

  @override
  List<Object> get props => [movieId];
}

