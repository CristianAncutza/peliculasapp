import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculasapp/models/movie.dart';
import 'package:peliculasapp/models/now_playing_response.dart';

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '5e635d377dad417977806ce39591a9a4';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    print('movies provider');
    this.getPopularMovies();
    this.getOnDisplayMovies();
  }
  getOnDisplayMovies() async {}

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    var response = await http.get(url);

    //_popularPage++;
    //final jsonData = await this._getJsonData('3/movie/popular');
    final popularResponse = NowPlayingResponse.fromJson(response.body);

    popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners();
  }
}

class _getJsonData {}
