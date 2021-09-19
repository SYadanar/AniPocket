import 'dart:convert';

import 'package:anime_app/Models/For_Anime_Card/all_anime_response.dart';
import 'package:anime_app/Models/For_Anime_Character/character_detail_response.dart';
import 'package:anime_app/Models/For_Anime_Character/character_response.dart';
import 'package:anime_app/Models/For_Anime_Detail/detail_response.dart';
import 'package:anime_app/Models/For_search_bar/search_.dart';
import 'package:dio/dio.dart';
import 'package:anime_app/Models/For_Anime_Card/related_anime_response.dart';
import 'package:anime_app/Models/For_Category/category_list_response.dart';
import 'package:anime_app/Models/For_Anime_Card/anime_response.dart';

class ApiService {
  //final String api_key = "d442b4d9-2667-479e-bfb0-5e7ef694664e";
  final String route =
      "https://kitsu.io/api/edge/anime?page%5Blimit%5D=10&page%5Boffset%5D=10";

//for favourite

//for search bar
  Future<AnimeName> getname({String? query}) async {
    try {
      final Response response = await Dio()
          .get('https://kitsu.io/api/edge/anime?filter[text]=$query&page[limit]=20');
      //print("The response is $response");
      //print("The data is ${response.data}");

      return AnimeName.fromJson(jsonDecode(response.data));
    } on DioError catch (e) {
      print("The res is" + e.toString());
      throw Exception("The error code is ${e.response?.statusCode}");
    }
  }

  //for homepage
  Future<AllAnime> getAll(int page) async {
    try {
      final Response response =
          await Dio().get('https://kitsu.io/api/edge/anime', queryParameters: {
        'page[offset]': page,
        'page[limit]': 10,
        'sort': "-averageRating",
      });
      //print("The response is $response");
      //print("The data is ${response.data}");

      return AllAnime.fromJson(jsonDecode(response.data));
    } on DioError catch (e) {
      print("The res is" + e.toString());
      throw Exception("The error code is ${e.response?.statusCode}");
    }
  }

  //for homepage
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

  // ------ For Category List of Selected Anime ------
  // https://kitsu.io/api/edge/anime/<<ANIME_ID>>/categories?page[limit]=10&page[offset]=0=0
  Future<CategoryListResponse> getRelatedCategoryList(
      String baseUrl, int limit, int page) async {
    try {
      final Response response = await Dio().get(baseUrl, queryParameters: {
        'page[limit]': limit,
        'page[offset]': page,
      });
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

  // ------ For Anime Detail ------
  // https://kitsu.io/api/edge/anime/<<ANIME_ID>>
  Future<AnimeDetailResponse> getAnimeDetail(String baseUrl) async {
    try {
      final Response response = await Dio().get(baseUrl);
      return AnimeDetailResponse.fromJson(jsonDecode(response.data));
    } on DioError catch (e) {
      print("The response is ... ${e.toString()}");
      throw Exception("The ERROR Code is ... ${e.response?.statusCode}");
    }
  }

  // ------ For Anime Character List ------
  // https://kitsu.io/api/edge/anime/<<ANIME_ID>>/characters?page[limit]=10&page[offset]=0
  Future<CharacterResponse> getAnimeCharacterList(
      String animeId, int limit, int page) async {
    try {
      final Response response = await Dio().get(
          'https://kitsu.io/api/edge/anime/$animeId/characters',
          queryParameters: {
            'page[limit]': limit,
            'page[offset]': page,
          });
      // print("Url...${response.realUri}");
      // print("API response ... ${response.data}");
      return CharacterResponse.fromJson(jsonDecode(response.data));
    } on DioError catch (e) {
      print("The response is ... ${e.toString()}");
      throw Exception("The ERROR Code is ... ${e.response?.statusCode}");
    }
  }

  // ------ For Anime Character Detail ------
  // https://kitsu.io/api/edge/media-characters/<<ANIME_CHARACTER_ID>>/character
  // https://kitsu.io/api/edge/characters/<<ANIME_CHARACTER_ID>>
  Future<CharacterDetailResponse> getCharacterDetail(String characterId) async {
    try {
      final Response response = await Dio().get(
          'https://kitsu.io/api/edge/media-characters/$characterId/character');
      return CharacterDetailResponse.fromJson(jsonDecode(response.data));
    } on DioError catch (e) {
      print("The response is ... ${e.toString()}");
      throw Exception("The ERROR Code is ... ${e.response?.statusCode}");
    }
  }
}
