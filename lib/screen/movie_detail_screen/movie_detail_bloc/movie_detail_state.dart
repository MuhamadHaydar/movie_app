part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();
}

class MovieDetailInitial extends MovieDetailState {
  @override
  List<Object> get props => [];
}

class MovieDetailLoaded extends MovieDetailState {
  @override
  List<Object> get props => [];
}

class MovieDetailError extends MovieDetailState {
  @override
  List<Object> get props => [];
}
