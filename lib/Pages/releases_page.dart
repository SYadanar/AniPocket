import 'package:anime_app/Models/For_Anime_Card/related_anime_response.dart';
import 'package:anime_app/Widgets/anime_card_for_general.dart';
import 'package:anime_app/Widgets/drawer_list.dart';
import 'package:anime_app/router/router.gr.dart';
import 'package:anime_app/service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ReleasesPage extends StatefulWidget {
  const ReleasesPage({
    Key? key,
  }) : super(key: key);

  // Getting Current Year
  static final currentYear = DateTime.now().year;

  @override
  _ReleasesPageState createState() => _ReleasesPageState();
}

class _ReleasesPageState extends State<ReleasesPage> {
  final PagingController<int, RelatedAnimeList> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final response =
          await ApiService().getCurrentYearReleaseAnimeList(pageKey);

      final bool isLastPage = response.meta.count <= pageKey;
      if (isLastPage) {
        _pagingController.appendLastPage(response.data);
      } else {
        final int nextPageKey = pageKey + 10;
        _pagingController.appendPage(response.data, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${ReleasesPage.currentYear} Releases'),
      ),
      drawer: Drawer(
        child: DrawerList(),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: PagedGridView<int, RelatedAnimeList>(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.7,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<RelatedAnimeList>(
            itemBuilder: (context, currentYearReleasesAnimeList, index) {
              String rating;
              if (currentYearReleasesAnimeList.attributes.averageRating !=
                  null) {
                rating = currentYearReleasesAnimeList.attributes.averageRating!;
              } else {
                rating = "N/A";
              }
              return InkWell(
                onTap: () {
                  AutoRouter.of(context).push(
                    AnimeDetailRoute(
                        clickedUrl: currentYearReleasesAnimeList.links.self),
                  );
                },
                child: AnimeCardForGeneral(
                  imageUrl: currentYearReleasesAnimeList
                      .attributes.posterImage.original,
                  rating: rating,
                  animeName:
                      currentYearReleasesAnimeList.attributes.canonicalTitle,
                  category: currentYearReleasesAnimeList
                      .relationships.categories.links.related,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
