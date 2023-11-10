import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/constants/color_constants.dart';
import 'package:movie_app/screen/movie_detail_screen/movie_detail_bloc/movie_detail_bloc.dart';
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

  static Widget create(
      {required BuildContext context,
      required String loadedMoviePosterPath,
      required String loadedMovieId,
      required String loadedMovieTitle}) {
    return BlocProvider(
      create: (context) => MovieDetailBloc(),
      child: MovieDetailScreen(
        currentMoviePosterPath: loadedMoviePosterPath,
        currentMovieId: loadedMovieId,
        currentMovieTitle: loadedMovieTitle,
      ),
    );
  }
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailBloc movieDetailBloc;
  late DatabaseBloc databaseBloc;

  @override
  void initState() {
    super.initState();

    movieDetailBloc = BlocProvider.of<MovieDetailBloc>(context);
    databaseBloc = BlocProvider.of<DatabaseBloc>(context);

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => movieDetailBloc.add(
        LoadMovieDetail(
          movieId: widget.currentMovieId,
          isLoadingMovieAvailability: true,
          isLoadingMovieDetail: true,
        ),
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
      floatingActionButton: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () {
              if (state is MovieDetailLoaded) {
                if (!state.isMovieAvailable) {
                  databaseBloc.add(
                    AddMovieToDatabase(
                      currentMovie: MovieLocalData(
                          id: widget.currentMovieId,
                          path: widget.currentMoviePosterPath),
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          AppLocalizations.of(context)!.add_movie_favorite),
                    ),
                  );

                  movieDetailBloc.add(LoadMovieDetail(
                    movieId: widget.currentMovieId,
                    isLoadingMovieAvailability: true,
                    isLoadingMovieDetail: false,
                  ));
                } else {
                  databaseBloc.add(
                      DeleteMovieFromDatabase(movieId: widget.currentMovieId));

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          AppLocalizations.of(context)!.delete_movie_favorite),
                    ),
                  );

                  movieDetailBloc.add(LoadMovieDetail(
                    movieId: widget.currentMovieId,
                    isLoadingMovieAvailability: true,
                    isLoadingMovieDetail: false,
                  ));
                }
              }
            },
            backgroundColor: ColorConstants.lightPurple,
            child: Icon(
              state is MovieDetailLoaded
                  ? (state.isMovieAvailable
                      ? Icons.favorite
                      : Icons.favorite_border)
                  : Icons.downloading,
              color: Colors.white,
            ),
          );
        },
      ),
      body: SafeArea(
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
    );
  }
}
