part of 'database_bloc.dart';

abstract class DatabaseEvent extends Equatable {
  const DatabaseEvent();
}

class AddMovieToDatabase extends DatabaseEvent {
  MovieLocalData currentMovie;

  AddMovieToDatabase({required this.currentMovie});

  @override
  List<Object> get props => [];
}

class CheckMovieAvailability extends DatabaseEvent {
  String movieId;

  CheckMovieAvailability({required this.movieId});

  @override
  List<Object> get props => [];
}

class DeleteMovieFromDatabase extends DatabaseEvent {
  String movieId;

  DeleteMovieFromDatabase({required this.movieId});

  @override
  List<Object> get props => [];
}
