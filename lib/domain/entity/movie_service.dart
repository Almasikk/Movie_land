import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../entity/movie.dart';

part 'movie_service.g.dart';

@RestApi(baseUrl: 'https://api.themoviedb.org/3')
abstract class MovieService {
  factory MovieService(Dio dio, {String baseUrl}) = _MovieService;

  @GET('/trending/movie/day')
  Future<List<Movie>> getTrendingMovies(@Query('api_key') String apiKey);

  @GET('/movie/top_rated')
  Future<List<Movie>> getTopRatedMovies(@Query('api_key') String apiKey);

  @GET('/movie/upcoming')
  Future<List<Movie>> getUpcomingMovies(@Query('api_key') String apiKey);
}