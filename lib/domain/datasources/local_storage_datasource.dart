import 'package:cineapp/domain/entities/movie.dart';

abstract class LocalStorageDataSource {
  Future<void> toogleFavorite(Movie movie);

  Future<bool> isMovieFavorite(int movieId);

  Future<List<Movie>> loadMovies({int limit = 10, offset = 0});
}
