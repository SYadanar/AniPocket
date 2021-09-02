import 'dart:convert';

import 'package:anime_app/Models/For_Genre/genre_list_response.dart';
import 'package:anime_app/Models/For_Anime_Card/anime_response.dart';
import 'package:dio/dio.dart';

class ApiService {
  //final String api_key = "d442b4d9-2667-479e-bfb0-5e7ef694664e";
  final String route =
      "https://kitsu.io/api/edge/anime?page%5Blimit%5D=10&page%5Boffset%5D=10";
  Future<AnimeResponse> getAnime(int page) async {
    try {
      final Response response =
          await Dio().get('https://kitsu.io/api/edge/trending/anime');
      //print("The response is $response");
      //print("The data is ${response.data}");

      return AnimeResponse.fromJson(response.data);
    } on DioError catch (e) {
      print("The res is " + e.toString());
      throw Exception("The error code is ${e.response?.statusCode}");
    }
  }

  // ------ For Genres List ------
  // https://kitsu.io/api/edge/genres?fields%5Bgenres%5D=name&page%5Blimit%5D=10&page%5Boffset%5D=0
  // Future<GenreListResponse> getGenreList(int page) async {
  //   try {
  //     final Response response =
  //         await Dio().get('https://kitsu.io/api/edge/genres', queryParameters: {
  //       'fields[genres]': "name",
  //       'page[limit]': 10,
  //       'page[offset]': page,
  //     });
  //     print("Genre List Response is ..... $response");
  //     print("Genre List Date is ..... ${response.data}");
  //     return GenreListResponse.fromJson(response.data);
  //   } on DioError catch (e) {
  //     print("The response is ... ${e.toString()}");
  //     throw Exception("The ERROR Code is ... ${e.response?.statusCode}");
  //   }
  // }

  String encodedFields = Uri.encodeQueryComponent("fields[genres]");
  String encodedPageLimit = Uri.encodeQueryComponent("page[limit]");
  String encodedPageOffset = Uri.encodeQueryComponent("page[offset]");
  Future<GenreListResponse> getGenreList(int page) async {
    try {
      // final Response response =
      //     await Dio().get('https://kitsu.io/api/edge/genres', queryParameters: {
      //   encodedFields: "name",
      //   encodedPageLimit: "5",
      //   encodedPageOffset: page,
      // });
      final Response response =
          await Dio().get('https://kitsu.io/api/edge/genres', queryParameters: {
        // encodedFields: "name",
        // encodedPageLimit: "5",
        // encodedPageOffset: page,
        'fields[genres]': "name",
        'page[limit]': 10,
        'page[offset]': page,
      });
      // print("Genre List Response is ..... $response");
      print("Genre List Data is ..... ${response.realUri}");
      // return GenreListResponse.fromJson(response.data);
      return GenreListResponse.fromJson(jsonDecode(response.data));
    } on DioError catch (e) {
      print("The response is ... ${e.toString()}");
      throw Exception("The ERROR Code is ... ${e.response?.statusCode}");
    }
  }
}
