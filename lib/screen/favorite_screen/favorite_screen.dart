import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/database_bloc.dart';
import 'package:movie_app/screen/favorite_screen/favorite_bloc/favorite_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();

  static Widget create(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteBloc(),
      child: FavoriteScreen(),
    );
  }
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late FavoriteBloc favoriteBloc;

  @override
  void initState() {
    super.initState();

    favoriteBloc = BlocProvider.of<FavoriteBloc>(context);

    WidgetsBinding.instance
        .addPostFrameCallback((_) => favoriteBloc.add(LoadFavoriteMovies()));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SizedBox(
        height: height,
        width: width,
        child: BlocListener<DatabaseBloc, DatabaseState>(
          listener: (context, state) {
            print('database changed ');
            if (state is DatabaseUpdated) {
              print('favorite bloc called');
              favoriteBloc.add(LoadFavoriteMovies());
            }
          },
          child: BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
              if (state is AllFavoriteLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is AllFavoriteMovies) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    itemCount: state.currentStoredMovies.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 220,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                    state.currentStoredMovies[index].path),
                                fit: BoxFit.cover)),
                      );
                    },
                  ),
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
