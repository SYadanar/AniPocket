// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../Pages/pages.dart' as _i3;

class MyAppRouter extends _i1.RootStackRouter {
  MyAppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.SplashScreenPage();
        }),
    HomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.HomePage();
        }),
    AnimeDetailRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<AnimeDetailRouteArgs>();
          return _i3.AnimeDetailPage(
              key: args.key, clickedUrl: args.clickedUrl);
        }),
    CharacterListRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<CharacterListRouteArgs>();
          return _i3.CharacterListPage(
              key: args.key, animeId: args.animeId, animeName: args.animeName);
        }),
    CharacterDetailRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<CharacterDetailRouteArgs>();
          return _i3.CharacterDetailPage(
              key: args.key, characterId: args.characterId);
        }),
    FavouriteRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.FavouritePage();
        }),
    ReleasesRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.ReleasesPage();
        }),
    CategoryListRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.CategoryListPage();
        }),
    CategoryRelatedAnimeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<CategoryRelatedAnimeRouteArgs>();
          return _i3.CategoryRelatedAnimePage(
              key: args.key,
              clickedUrl: args.clickedUrl,
              clickedGenreName: args.clickedGenreName);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i1.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i1.RouteConfig(AnimeDetailRoute.name, path: '/anime-detail-page'),
        _i1.RouteConfig(CharacterListRoute.name, path: '/character-list-page'),
        _i1.RouteConfig(CharacterDetailRoute.name,
            path: '/character-detail-page'),
        _i1.RouteConfig(FavouriteRoute.name, path: '/favourite-page'),
        _i1.RouteConfig(ReleasesRoute.name, path: '/releases-page'),
        _i1.RouteConfig(CategoryListRoute.name, path: '/category-list-page'),
        _i1.RouteConfig(CategoryRelatedAnimeRoute.name,
            path: '/category-related-anime-page')
      ];
}

class SplashScreenRoute extends _i1.PageRouteInfo {
  const SplashScreenRoute() : super(name, path: '/');

  static const String name = 'SplashScreenRoute';
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/home-page');

  static const String name = 'HomeRoute';
}

class AnimeDetailRoute extends _i1.PageRouteInfo<AnimeDetailRouteArgs> {
  AnimeDetailRoute({_i2.Key? key, required String clickedUrl})
      : super(name,
            path: '/anime-detail-page',
            args: AnimeDetailRouteArgs(key: key, clickedUrl: clickedUrl));

  static const String name = 'AnimeDetailRoute';
}

class AnimeDetailRouteArgs {
  const AnimeDetailRouteArgs({this.key, required this.clickedUrl});

  final _i2.Key? key;

  final String clickedUrl;
}

class CharacterListRoute extends _i1.PageRouteInfo<CharacterListRouteArgs> {
  CharacterListRoute(
      {_i2.Key? key, required String animeId, required String animeName})
      : super(name,
            path: '/character-list-page',
            args: CharacterListRouteArgs(
                key: key, animeId: animeId, animeName: animeName));

  static const String name = 'CharacterListRoute';
}

class CharacterListRouteArgs {
  const CharacterListRouteArgs(
      {this.key, required this.animeId, required this.animeName});

  final _i2.Key? key;

  final String animeId;

  final String animeName;
}

class CharacterDetailRoute extends _i1.PageRouteInfo<CharacterDetailRouteArgs> {
  CharacterDetailRoute({_i2.Key? key, required String characterId})
      : super(name,
            path: '/character-detail-page',
            args: CharacterDetailRouteArgs(key: key, characterId: characterId));

  static const String name = 'CharacterDetailRoute';
}

class CharacterDetailRouteArgs {
  const CharacterDetailRouteArgs({this.key, required this.characterId});

  final _i2.Key? key;

  final String characterId;
}

class FavouriteRoute extends _i1.PageRouteInfo {
  const FavouriteRoute() : super(name, path: '/favourite-page');

  static const String name = 'FavouriteRoute';
}

class ReleasesRoute extends _i1.PageRouteInfo {
  const ReleasesRoute() : super(name, path: '/releases-page');

  static const String name = 'ReleasesRoute';
}

class CategoryListRoute extends _i1.PageRouteInfo {
  const CategoryListRoute() : super(name, path: '/category-list-page');

  static const String name = 'CategoryListRoute';
}

class CategoryRelatedAnimeRoute
    extends _i1.PageRouteInfo<CategoryRelatedAnimeRouteArgs> {
  CategoryRelatedAnimeRoute(
      {_i2.Key? key,
      required String clickedUrl,
      required String clickedGenreName})
      : super(name,
            path: '/category-related-anime-page',
            args: CategoryRelatedAnimeRouteArgs(
                key: key,
                clickedUrl: clickedUrl,
                clickedGenreName: clickedGenreName));

  static const String name = 'CategoryRelatedAnimeRoute';
}

class CategoryRelatedAnimeRouteArgs {
  const CategoryRelatedAnimeRouteArgs(
      {this.key, required this.clickedUrl, required this.clickedGenreName});

  final _i2.Key? key;

  final String clickedUrl;

  final String clickedGenreName;
}
