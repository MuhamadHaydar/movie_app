import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/models/movie_video.dart';

import '../../../repository/movie_repository.dart';
import '../../../service/database_service.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieRepository movieRepository;

  MovieDetailBloc(this.movieRepository) : super(MovieDetailInitial()) {
    // Store movie to local movie table
    on<LoadMovieDetail>((event, emit) async {
      emit(MovieDetailLoading(
        isLoadingMovieDetail: event.isLoadingMovieDetail,
        isLoadingMovieAvailability: event.isLoadingMovieAvailability,
      ));

      // if(event.isLoadingMovieAvailability && event.isLoadingMovieDetail){

      List<MovieVideoDetail> currentMovieVideoDetail =
          await movieRepository.getMovieVideos(currentMovieId: event.movieId);

      bool isMovieAvailable =
          await DatabaseHelper().checkItemAvailability(event.movieId);

      emit(MovieDetailLoaded(
          isMovieAvailable: isMovieAvailable,
          currentMovieVideo: currentMovieVideoDetail.first));
      // }
    });
  }
}
