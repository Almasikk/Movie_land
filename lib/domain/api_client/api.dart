import 'package:dio/dio.dart';
import '../../config/consts/consts.dart';
import '../entity/movie.dart';
import '../entity/movie_service.dart';

class ApiClient {
  final MovieService _movieService;

  ApiClient(Dio dio) : _movieService = MovieService(dio);

  Future<List<Movie>> getTrendingMovies() async {
    try {
      return await _movieService.getTrendingMovies(Constants.apiKey);
    } catch (e) {
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    try {
      return await _movieService.getTopRatedMovies(Constants.apiKey);
    } catch (e) {
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    try {
      return await _movieService.getUpcomingMovies(Constants.apiKey);
    } catch (e) {
      throw Exception('Something happened');
    }
  }
}