import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/screen/movie_detail_screen/movie_detail_screen.dart';
import 'package:movie_app/service/app_urls.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'movie_bloc/movie_bloc.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => MovieBloc(
        RepositoryProvider.of(context),
      )..add(LoadPopularMovies()),
      child: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              if (state is MovieLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is MovieLoadedState) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    itemCount: state.currentMovies.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 220,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: MovieDetailScreen.create(
                              context: context,
                              loadedMovieId:
                                  state.currentMovies[index].id.toString(),
                              loadedMoviePosterPath:
                                  (AppUrls.basePosterImageUrl +
                                      "/" +
                                      state.currentMovies[index].posterPath),
                              loadedMovieTitle:
                                  state.currentMovies[index].title,
                            ),
                            withNavBar: false,
                            // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(AppUrls
                                            .basePosterImageUrl +
                                        "/" +
                                        state.currentMovies[index].posterPath),
                                    fit: BoxFit.cover)),
                            child:
                                Text(state.currentMovies[index].originalTitle)),
                      );
                    },
                  ),
                );
              } else if (state is MovieErrorState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else {
                return Center(
                  child: Text("an Expected Error Occured"),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
