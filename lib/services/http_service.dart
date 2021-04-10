import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:signematic/models/movie.dart';

class HttpService {
  final String apiKey = '832cf7e097f8aecb960e8a779c17d258';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<List> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print('sukses');
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print('fail');
      return null;
    }
  }
}
