import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cineapp/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cineapp/infrastructure/repositories/movie_repository_impl.dart';

//Provider de solo lectura- Es inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl((MoviedbDatasource()));
});
