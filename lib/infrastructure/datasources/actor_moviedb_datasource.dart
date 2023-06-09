import 'package:dio/dio.dart';
import 'package:cineapp/constants/environment.dart';
import 'package:cineapp/domain/datasources/actors_datasource.dart';
import 'package:cineapp/domain/entities/actor.dart';
import 'package:cineapp/infrastructure/mappers/actor_mapper.dart';
import 'package:cineapp/infrastructure/models/moviedb/credits_response.dart';

class ActorMovieDbDataSource extends ActorsDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDbKey,
        'language': 'es-NI'
      }));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();
    return actors;
  }
}
