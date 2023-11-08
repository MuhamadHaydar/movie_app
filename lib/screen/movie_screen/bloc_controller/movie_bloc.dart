import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/movie.dart';
import '../../../repository/movie_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository _movieRepository;

  MovieBloc(this._movieRepository) : super(MovieLoadingState()) {
    on<LoadPopularMovies>((event, emit) async {
      // Start with loading state
      emit(MovieLoadingState());
      try {
        List<Movie> currentLoadedMovies =
            await _movieRepository.getPopularMovies();
        emit(MovieLoadedState(currentLoadedMovies));
      } catch (e) {
        emit(MovieErrorState(e.toString()));
      }
    });
  }
}
