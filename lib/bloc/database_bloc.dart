import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../service/database_service.dart';

part 'database_event.dart';
part 'database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  DatabaseBloc() : super(DatabaseInitial()) {
    on<AddMovieToDatabase>((event, emit) async {
      await DatabaseHelper()
          .addItemToDatabase(event.currentMovie.id, event.currentMovie.path);
      emit(MovieAddedToDatabase());
    });

    on<CheckMovieAvailability>((event, emit) async {
      bool isMovieAvailable =
          await DatabaseHelper().checkItemAvailability(event.movieId);

      if (isMovieAvailable) {
        emit(MovieAvailableFromDatabase());
      } else {
        emit(MovieNotAvailableFromDatabase());
      }
    });

    on<DeleteMovieFromDatabase>((event, emit) async {
      await DatabaseHelper().deleteItemById(
        event.movieId,
      );
      emit(MovieRemovedFromDatabase());
    });
  }
}
