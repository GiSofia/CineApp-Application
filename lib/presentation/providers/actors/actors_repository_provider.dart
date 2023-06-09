import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cineapp/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:cineapp/infrastructure/repositories/actor_repository_impl.dart';

//Provider de solo lectura- Es inmutable
final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl((ActorMovieDbDataSource()));
});
