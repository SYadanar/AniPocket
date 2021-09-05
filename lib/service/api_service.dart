import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:anime_app/Models/For_Anime_Card/related_anime_response.dart';
import 'package:anime_app/Models/For_Category/category_list_response.dart';
import 'package:anime_app/Models/For_Genre/genre_list_response.dart';
import 'package:anime_app/Models/For_Anime_Card/anime_response.dart';
import 'package:auto_route/annotations.dart';
import 'package:dio/dio.dart';

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
      print("The res is" + e.toString());
      throw Exception("The error code is ${e.response?.statusCode}");
    }
  }

  // ------ For Genres List ------
  // https://kitsu.io/api/edge/genres?fields%5Bgenres%5D=name&page%5Blimit%5D=10&page%5Boffset%5D=0
  Future<GenreListResponse> getGenreList(int page) async {
    try {
      final Response response =
          await Dio().get('https://kitsu.io/api/edge/genres', queryParameters: {
        'fields[genres]': "name",
        'page[limit]': 10,
        'page[offset]': page,
      });
      // print("Genre List Response is ..... $response");
      // print("Genre List Data is ..... ${response.realUri}");
      // return GenreListResponse.fromJson(response.data);
      return GenreListResponse.fromJson(jsonDecode(response.data));
    } on DioError catch (e) {
      print("The response is ... ${e.toString()}");
      throw Exception("The ERROR Code is ... ${e.response?.statusCode}");
    }
  }

  // ------ For Category List ------
  // https://kitsu.io/api/edge/categories?page%5Blimit%5D=10&page%5Boffset%5D=0
  // https://kitsu.io/api/edge/categories?page%5Blimit%5D=10&page%5Boffset%5D=0&sort=title
  Future<CategoryListResponse> getCategoryList(int page) async {
    try {
      final Response response = await Dio()
          .get('https://kitsu.io/api/edge/categories', queryParameters: {
        'page[limit]': 10,
        'page[offset]': page,
        'sort': "title",
      });
      // print("Category List Response is ..... $response");
      // print("Category List Data is ..... ${response.realUri}");
      return CategoryListResponse.fromJson(jsonDecode(response.data));
    } on DioError catch (e) {
      print("The response is ... ${e.toString()}");
      throw Exception("The ERROR Code is ... ${e.response?.statusCode}");
    }
  }

  // Get Category List in String
  Future<CategoryListResponse> getAnimeCategoryListInString(
      String baseUrl, int page) async {
    try {
      final Response response = await Dio().get(baseUrl, queryParameters: {
        'page[limit]': 10,
        'page[offset]': page,
      });
      // print("Category List Response is ..... $response");
      // print("Category List Data is ..... ${response.realUri}");
      return CategoryListResponse.fromJson(jsonDecode(response.data));
    } on DioError catch (e) {
      print("The response is ... ${e.toString()}");
      throw Exception("The ERROR Code is ... ${e.response?.statusCode}");
    }
  }

  // ------ For getting related Anime List with Category ------
  // https://kitsu.io/api/edge/categories/<<CATEGORY_ID>>/anime?page[limit]=10&page[offset]=0
  Future<RelatedAnimeResponse> getRelatedAnimeList(
      String baseUrl, int page) async {
    try {
      final Response response = await Dio().get(baseUrl, queryParameters: {
        'page[limit]': 10,
        'page[offset]': page,
      });
      // print("Related Anime List Response is ..... $response");
      // print("Related Anime List Data is ..... ${response.realUri}");
      return RelatedAnimeResponse.fromJson(jsonDecode(response.data));
    } on DioError catch (e) {
      print("The response is ... ${e.toString()}");
      throw Exception("The ERROR Code is ... ${e.response?.statusCode}");
    }
  }

  // ------ For [Current Year] Releases ------
  // https://kitsu.io/api/edge/anime?filter[seasonYear]=<<CURRENT_YEAR>>
  static final currentYear = DateTime.now().year; // Getting Current Year
  Future<RelatedAnimeResponse> getCurrentYearReleaseAnimeList(int page) async {
    try {
      final Response response =
          await Dio().get('https://kitsu.io/api/edge/anime', queryParameters: {
        'filter[seasonYear]': currentYear,
        'page[limit]': 10,
        'page[offset]': page,
      });
      // print("Anime List Response is ..... $response");
      // print("URL is ..... ${response.realUri}");
      return RelatedAnimeResponse.fromJson(jsonDecode(response.data));
    } on DioError catch (e) {
      print("The response is ... ${e.toString()}");
      throw Exception("The ERROR Code is ... ${e.response?.statusCode}");
    }
  }
}
