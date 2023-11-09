import 'package:flutter/material.dart';
import 'package:movie_app/constants/color_constants.dart';

class MovieDetailScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.darkPurpleColor,
        title: Text(currentMovieTitle),
        titleTextStyle: TextStyle(color: Colors.white),
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorConstants.lightPurple,
        child: Icon(
          Icons.favorite,
          color: Colors.white,
        ),
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
                      image: NetworkImage(currentMoviePosterPath),
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
              Text(currentMovieTitle)
            ],
          ),
        ),
      ),
    );
  }
}
