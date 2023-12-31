part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();
}

class MovieDetailInitial extends MovieDetailState {
  @override
  List<Object> get props => [];
}

class MovieDetailLoading extends MovieDetailState {
  final bool isLoadingMovieDetail;
  final bool isLoadingMovieAvailability;

  MovieDetailLoading(
      {required this.isLoadingMovieDetail,
      required this.isLoadingMovieAvailability});

  @override
  List<Object> get props => [];
}

class MovieDetailLoaded extends MovieDetailState {
  // Load Movie Detail
  final bool isMovieAvailable;
  final MovieVideoDetail currentMovieVideo;

  MovieDetailLoaded({
    required this.isMovieAvailable,
    required this.currentMovieVideo,
  });

  @override
  List<Object> get props => [isMovieAvailable, currentMovieVideo];
}

class MovieDetailError extends MovieDetailState {
  @override
  List<Object> get props => [];
}
