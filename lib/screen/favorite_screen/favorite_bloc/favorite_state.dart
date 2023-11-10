part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();
}

class FavoriteInitial extends FavoriteState {
  @override
  List<Object> get props => [];
}

class AllFavoriteLoading extends FavoriteState {
  @override
  List<Object> get props => [];
}

class AllFavoriteMovies extends FavoriteState {
  final List<MovieLocalData> currentStoredMovies;

  AllFavoriteMovies({required this.currentStoredMovies});

  @override
  List<Object> get props => [currentStoredMovies];
}
