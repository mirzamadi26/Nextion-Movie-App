class ApiConstants {
  static String bearer =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MmQ4ZGE0NjgzMmRmOTg2ZjE3YThjZTcwYWRkY2YyYSIsInN1YiI6IjYxNmZjYWZlMTYwZTczMDA2MTg2NWYxYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.beJRM4c3Yr_wbyFYyAahU0PcWELMTVV5MKRrYO0sDqE';
  static String apikey = '62d8da46832df986f17a8ce70addcf2a';

  static Uri popularMovies =
      Uri.parse('https://api.themoviedb.org/3/movie/popular');

  static String imageEndPoint = 'https://image.tmdb.org/t/p/w500';

  static String movieDetailsEndPoint =
      'https://api.themoviedb.org/3/movie/{movie_id}?api_key=$apikey';
}
