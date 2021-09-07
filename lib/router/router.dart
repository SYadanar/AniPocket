import 'package:anime_app/Pages/category_list_page.dart';
import 'package:auto_route/annotations.dart';
import 'package:anime_app/Pages/pages.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: AnimeDetailPage),
    AutoRoute(page: WelcomePage),
    AutoRoute(page: CharactersPage),
    AutoRoute(page: FavouritePage),
    AutoRoute(page: PasswordPage),
    AutoRoute(page: ReleasesPage),
    AutoRoute(page: UserProfilePage),
    AutoRoute(page: UserSignInPage),
    AutoRoute(page: UserSignUpPage),
    AutoRoute(page: CategoryListPage),
    AutoRoute(page: CategoryRelatedAnimePage),
  ],
)
class $MyAppRouter {}
