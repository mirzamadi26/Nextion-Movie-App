import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../interface/utils/constants/api_constants.dart';
import '../models/movie_model.dart';

class MovieService {
  Map<String, String> headers = {
    "accept": "application/json",
    "Authorization": "Bearer ${ApiConstants.bearer}"
  };



  Future<List<MovieModel>> fetchPopularMovies() async {
    List<MovieModel> popularMovies = [];

    try {
      http.Response res =
          await http.get(ApiConstants.popularMovies, headers: headers);
      var moviesJson = jsonDecode(res.body)['results'];

      for (var movie in moviesJson) {
        popularMovies.add(MovieModel.fromJson(movie));
      }
    } catch (e) {
      // Handle errors, e.g., log or return an empty list
      print("Error fetching popular movies: $e");
    }

    print("Fetched popular movies: $popularMovies");
    return popularMovies;
  }

  Future<MovieModel?> getMovieDetails(String movieId) async {
    try {
      final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$movieId?api_key=${ApiConstants.apikey}',
      ));

      if (response.statusCode == 200) {
        final Map<String, dynamic>? data = json.decode(response.body);

        if (data != null) {
          return MovieModel.fromJson(data);
        } else {
          print(
              'Error: API response is null or not in the expected format for movie ID $movieId.');
          return null;
        }
      } else {
        print(
            'Error: Failed to load movie details. Status code: ${response.statusCode} for movie ID $movieId');
        return null;
      }
    } catch (e) {
      print('Error: $e for movie ID $movieId');
      return null;
    }
  }
}
