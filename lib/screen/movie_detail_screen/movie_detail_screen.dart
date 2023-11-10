import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/constants/color_constants.dart';
import 'package:movie_app/service/database_service.dart';

import '../../bloc/database_bloc.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({
    super.key,
    required this.currentMovieId,
    required this.currentMoviePosterPath,
    required this.currentMovieTitle,
  });

  // We got movie details from past screen.
  final String currentMovieTitle;
  final String currentMoviePosterPath;
  final String currentMovieId;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late DatabaseBloc databaseBloc;

  @override
  void initState() {
    super.initState();

    databaseBloc = BlocProvider.of<DatabaseBloc>(context);

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => databaseBloc.add(
        CheckMovieAvailability(movieId: widget.currentMovieId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.darkPurpleColor,
        title: Text(widget.currentMovieTitle),
        titleTextStyle: TextStyle(color: Colors.white),
        foregroundColor: Colors.white,
      ),
      floatingActionButton: BlocBuilder<DatabaseBloc, DatabaseState>(
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () {
              if (state is MovieNotAvailableFromDatabase) {
                databaseBloc.add(AddMovieToDatabase(
                    currentMovie: MovieLocalData(
                        id: widget.currentMovieId,
                        path: widget.currentMoviePosterPath)));
              } else if (state is MovieAvailableFromDatabase) {
                databaseBloc.add(
                    DeleteMovieFromDatabase(movieId: widget.currentMovieId));
              }

              // Here we have to check availability in order to update ui.
              databaseBloc
                  .add(CheckMovieAvailability(movieId: widget.currentMovieId));
            },
            backgroundColor: ColorConstants.lightPurple,
            child: Icon(
              state is MovieAvailableFromDatabase
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.white,
            ),
          );
        },
      ),
      body: BlocListener<DatabaseBloc, DatabaseState>(
        listener: (context, state) {
          if (state is MovieAddedToDatabase) {
            // Show that movie added to database.
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppLocalizations.of(context)!.add_movie_favorite),
              ),
            );
          } else if (state is MovieRemovedFromDatabase) {
            // Show that movie removed from database
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text(AppLocalizations.of(context)!.delete_movie_favorite),
              ),
            );
          }
        },
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(widget.currentMoviePosterPath),
                        fit: BoxFit.cover,
                      )),
                  child: Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.play_circle,
                        size: 80,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(widget.currentMovieTitle)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
