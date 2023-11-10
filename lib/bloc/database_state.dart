part of 'database_bloc.dart';

abstract class DatabaseState extends Equatable {
  const DatabaseState();
}

class DatabaseInitial extends DatabaseState {
  @override
  List<Object> get props => [];
}

class DatabaseUpdating extends DatabaseState {
  @override
  List<Object> get props => [];
}

class MovieAddedToDatabase extends DatabaseState {
  @override
  List<Object> get props => [];
}

class MovieRemovedFromDatabase extends DatabaseState {
  @override
  List<Object> get props => [];
}

class DatabaseUpdated extends DatabaseState {
  @override
  List<Object> get props => [];
}
