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
    HomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.HomePage();
        }),
    AnimeDetailRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.AnimeDetailPage();
        }),
    WelcomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.WelcomePage();
        }),
    CharactersRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.CharactersPage();
        }),
    FavouriteRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.FavouritePage();
        }),
    GenreRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.GenrePage();
        }),
    PasswordRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.PasswordPage();
        }),
    ReleasesRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.ReleasesPage();
        }),
    UserProfileRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.UserProfilePage();
        }),
    UserSignInRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.UserSignInPage();
        }),
    UserSignUpRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.UserSignUpPage();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomeRoute.name, path: '/'),
        _i1.RouteConfig(AnimeDetailRoute.name, path: '/anime-detail-page'),
        _i1.RouteConfig(WelcomeRoute.name, path: '/welcome-page'),
        _i1.RouteConfig(CharactersRoute.name, path: '/characters-page'),
        _i1.RouteConfig(FavouriteRoute.name, path: '/favourite-page'),
        _i1.RouteConfig(GenreRoute.name, path: '/genre-page'),
        _i1.RouteConfig(PasswordRoute.name, path: '/password-page'),
        _i1.RouteConfig(ReleasesRoute.name, path: '/releases-page'),
        _i1.RouteConfig(UserProfileRoute.name, path: '/user-profile-page'),
        _i1.RouteConfig(UserSignInRoute.name, path: '/user-sign-in-page'),
        _i1.RouteConfig(UserSignUpRoute.name, path: '/user-sign-up-page')
      ];
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/');

  static const String name = 'HomeRoute';
}

class AnimeDetailRoute extends _i1.PageRouteInfo {
  const AnimeDetailRoute() : super(name, path: '/anime-detail-page');

  static const String name = 'AnimeDetailRoute';
}

class WelcomeRoute extends _i1.PageRouteInfo {
  const WelcomeRoute() : super(name, path: '/welcome-page');

  static const String name = 'WelcomeRoute';
}

class CharactersRoute extends _i1.PageRouteInfo {
  const CharactersRoute() : super(name, path: '/characters-page');

  static const String name = 'CharactersRoute';
}

class FavouriteRoute extends _i1.PageRouteInfo {
  const FavouriteRoute() : super(name, path: '/favourite-page');

  static const String name = 'FavouriteRoute';
}

class GenreRoute extends _i1.PageRouteInfo {
  const GenreRoute() : super(name, path: '/genre-page');

  static const String name = 'GenreRoute';
}

class PasswordRoute extends _i1.PageRouteInfo {
  const PasswordRoute() : super(name, path: '/password-page');

  static const String name = 'PasswordRoute';
}

class ReleasesRoute extends _i1.PageRouteInfo {
  const ReleasesRoute() : super(name, path: '/releases-page');

  static const String name = 'ReleasesRoute';
}

class UserProfileRoute extends _i1.PageRouteInfo {
  const UserProfileRoute() : super(name, path: '/user-profile-page');

  static const String name = 'UserProfileRoute';
}

class UserSignInRoute extends _i1.PageRouteInfo {
  const UserSignInRoute() : super(name, path: '/user-sign-in-page');

  static const String name = 'UserSignInRoute';
}

class UserSignUpRoute extends _i1.PageRouteInfo {
  const UserSignUpRoute() : super(name, path: '/user-sign-up-page');

  static const String name = 'UserSignUpRoute';
}
