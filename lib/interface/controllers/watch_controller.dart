import 'package:get/get.dart';

import '../../data/models/movie_model.dart';
import '../../data/services/movie_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WatchViewController extends GetxController {
  Rx<bool> isLoading = Rx(false);

  final MovieService _movieService = MovieService();

  // CachePrefs cachePrefs = CachePrefs();
  final RxList<MovieModel> popularMovies = <MovieModel>[].obs;
  RxList<String> favoriteMovies = <String>[].obs;

  @override
  void onReady() async {
    super.onReady();

    getFavoriteMovieIds();
  }

  Future<void> getPopularMovies() async {
    try {
      isLoading(true);

      // Call the MovieService function to fetch popular movies
      List<MovieModel> movies = await MovieService().fetchPopularMovies();

      print("Fetched popular movies in WatchViewController: $movies");

      popularMovies.assignAll(movies);
    } catch (e) {
      Get.snackbar("Error Occured", "$e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> addToFavorites(MovieModel movie) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> favoriteMovieIds = prefs.getStringList('favorites') ?? [];

    if (!favoriteMovieIds.contains(movie.id.toString())) {
      favoriteMovieIds.add(movie.id.toString());
      prefs.setStringList('favorites', favoriteMovieIds);
      Get.snackbar(
        'Added to Favorites',
        'The movie has been added to your favorites.',
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> removeFromFavorites(String movieId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> favoriteMovieIds = prefs.getStringList('favorites') ?? [];

    favoriteMovieIds.remove(movieId);
    prefs.setStringList('favorites', favoriteMovieIds);
    Get.snackbar(
      'Removed to Favorites',
      'The movie has been removed from your favorites.',
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  Future<List<MovieModel>> getFavoriteMovies() async {
    List<String>? favoriteMovieIds = await getFavoriteMovieIds();

    if (favoriteMovieIds == null) {
      // Handle the case where favoriteMovieIds is null
      print('Error: Failed to get favorite movie IDs.');
      return [];
    }

    List<MovieModel> favoriteMovies = [];

    for (String movieId in favoriteMovieIds) {
      try {
        MovieModel? movie = await _movieService.getMovieDetails(movieId);
        if (movie != null) {
          favoriteMovies.add(movie);
        } else {
          print('Error: Movie details are null for movie with ID $movieId');
        }
      } catch (e) {
        print('Error fetching details for movie with ID $movieId: $e');
      }
    }

    return favoriteMovies;
  }

  Future<List<String>> getFavoriteMovieIds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteIds = prefs.getStringList('favorites') ?? [];
    favoriteMovies.value = favoriteIds;
    return favoriteIds;
  }
}
