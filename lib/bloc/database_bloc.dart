import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../service/database_service.dart';

part 'database_event.dart';
part 'database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  DatabaseBloc() : super(DatabaseInitial()) {
    on<AddMovieToDatabase>((event, emit) async {
      emit(DatabaseUpdating());
      await DatabaseHelper()
          .addItemToDatabase(event.currentMovie.id, event.currentMovie.path);
      emit(MovieAddedToDatabase());
      emit(DatabaseUpdated());
    });


    on<DeleteMovieFromDatabase>((event, emit) async {
      emit(DatabaseUpdating());
      await DatabaseHelper().deleteItemById(
        event.movieId,
      );
      emit(MovieRemovedFromDatabase());
      emit(DatabaseUpdated());
    });
  }
}
