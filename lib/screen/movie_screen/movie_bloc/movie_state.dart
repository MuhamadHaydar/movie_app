part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();
}

class MovieLoadingState extends MovieState {
  @override
  List<Object> get props => [];
}

class MovieLoadedState extends MovieState {
  final List<Movie> currentMovies;

  const MovieLoadedState(this.currentMovies);

  @override
  List<Object> get props => [currentMovies];
}

class MovieErrorState extends MovieState {
  final String errorMessage;

  const MovieErrorState(this.errorMessage);

  @override
  List<Object> get props => [];
}
