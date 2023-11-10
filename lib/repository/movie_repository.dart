import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/models/movie_video.dart';
import 'package:movie_app/service/app_urls.dart';

class MovieRepository {
  // Method used to get popular Movies.
  Future<List<Movie>> getPopularMovies() async {
    Response response = await get(
        Uri.parse(
            "${AppUrls.baseMovieUrl}/movie/popular?language=en-US&page=1"),
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer ${AppUrls.accessAPiKey}'
        });
    if (response.statusCode == 200) {
      return List<Movie>.from(
        jsonDecode(response.body)['results'].map(
          (x) => Movie.fromJson(x),
        ),
      );
    } else {
      throw Exception(response.body.toString());
    }
  }

  Future<List<MovieVideoDetail>> getMovieVideos(
      {required String currentMovieId}) async {
    Response response = await get(
        Uri.parse(
            "${AppUrls.baseMovieUrl}/movie/$currentMovieId/videos?language=en-US"),
        headers: {
          'accept': 'application/json',
          'Authorization': 'Bearer ${AppUrls.accessAPiKey}'
        });
    if (response.statusCode == 200) {
      return List<MovieVideoDetail>.from(
        jsonDecode(response.body)['results'].map(
          (x) => MovieVideoDetail.fromJson(x),
        ),
      );
    } else {
      throw Exception(response.body.toString());
    }
  }
}
