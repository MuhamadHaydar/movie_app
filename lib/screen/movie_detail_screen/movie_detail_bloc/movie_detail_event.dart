part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();
}

class LoadMovieDetail extends MovieDetailEvent {
  String movieId;

  LoadMovieDetail({required this.movieId});

  @override
  List<Object> get props => [];
}
