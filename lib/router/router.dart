import 'package:auto_route/annotations.dart';
import 'package:anime_app/Pages/pages.dart';
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage),
    AutoRoute(page: AnimeDetailPage),
    AutoRoute(page: WelcomePage,initial: true),
    AutoRoute(page: CharactersPage),
    AutoRoute(page: FavouritePage),
    AutoRoute(page: GenrePage),
    AutoRoute(page: PasswordPage),
    AutoRoute(page: ReleasesPage),
    AutoRoute(page: UserProfilePage),
    AutoRoute(page: UserSignInPage),
    AutoRoute(page: UserSignUpPage),
  ],
)
class $MyAppRouter {}