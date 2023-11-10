part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class LoadFavoriteMovies extends FavoriteEvent {
  @override
  List<Object> get props => [];
}
