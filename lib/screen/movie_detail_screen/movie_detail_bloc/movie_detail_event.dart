part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();
}

class LoadMovieDetail extends MovieDetailEvent {
  final String movieId;
  final bool isLoadingMovieAvailability;
  final bool isLoadingMovieDetail;

  LoadMovieDetail({
    required this.movieId,
    required this.isLoadingMovieAvailability,
    required this.isLoadingMovieDetail,
  });

  @override
  List<Object> get props => [];
}
