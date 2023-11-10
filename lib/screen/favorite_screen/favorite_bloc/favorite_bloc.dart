import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../service/database_service.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<LoadFavoriteMovies>((event, emit) async {
      print("favorite is loaded ");
      emit(AllFavoriteLoading());
      dynamic currentLoadedMoviesResponse =
          await DatabaseHelper().getAllItemsFromDatabase();
      List<MovieLocalData> currentFavoriteMovies =
          List<dynamic>.from(currentLoadedMoviesResponse)
              .map((movieData) =>
                  MovieLocalData(id: movieData["id"], path: movieData["path"]))
              .toList();
      emit(AllFavoriteMovies(currentStoredMovies: currentFavoriteMovies));
    });
  }
}
