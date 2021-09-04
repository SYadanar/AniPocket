import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:anime_app/Models/For_Anime_Card/anime_response.dart';


class ApiService {
  //final String api_key = "d442b4d9-2667-479e-bfb0-5e7ef694664e";
  final String route =
      "https://kitsu.io/api/edge/anime?page%5Blimit%5D=10&page%5Boffset%5D=10";
  Future<AnimeResponse> getAnime() async {
    try {
      final Response response =
          await Dio().get('https://kitsu.io/api/edge/trending/anime');
      //print("The response is $response");
      //print("The data is ${response.data}");

      return AnimeResponse.fromJson(jsonDecode(response.data));
    } on DioError catch (e) {
      print("The res is " + e.toString());
      throw Exception("The error code is ${e.response?.statusCode}");
    }
  }
}
