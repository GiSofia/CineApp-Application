import 'package:cineapp/domain/datasources/actors_datasource.dart';
import 'package:cineapp/domain/entities/actor.dart';
import 'package:cineapp/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  final ActorsDataSource datasource;
  ActorRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }
}
