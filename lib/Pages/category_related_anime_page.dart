import 'package:anime_app/Models/For_Anime_Card/related_anime_response.dart';
import 'package:anime_app/Widgets/anime_card_for_genres.dart';
import 'package:anime_app/router/router.gr.dart';
import 'package:anime_app/service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CategoryRelatedAnimePage extends StatefulWidget {
  final String clickedUrl;
  final String clickedGenreName;
  const CategoryRelatedAnimePage(
      {Key? key, required this.clickedUrl, required this.clickedGenreName})
      : super(key: key);

  @override
  _CategoryRelatedAnimePageState createState() =>
      _CategoryRelatedAnimePageState();
}

class _CategoryRelatedAnimePageState extends State<CategoryRelatedAnimePage> {
  final PagingController<int, RelatedAnimeList> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    // ApiService()
    //     .getRelatedAnimeList(widget.clickedUrl, 0)
    //     .then((value) => print(value.toString()));

    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final response =
          await ApiService().getRelatedAnimeList(widget.clickedUrl, pageKey);

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
        title: Text(widget.clickedGenreName),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: PagedListView<int, RelatedAnimeList>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<RelatedAnimeList>(
              itemBuilder: (context, relatedAnimeList, index) {
            String rating;
            if (relatedAnimeList.attributes.averageRating != null) {
              rating = relatedAnimeList.attributes.averageRating!;
            } else {
              rating = "N/A";
            }
            return InkWell(
              onTap: () {
                AutoRouter.of(context).push(
                  AnimeDetailRoute(clickedUrl: relatedAnimeList.links.self),
                );
              },
              child: AnimeCardForGenres(
                imageUrl: relatedAnimeList.attributes.posterImage.original,
                // rating: relatedAnimeList.attributes.averageRating,
                rating: rating,
                category:
                    relatedAnimeList.relationships.categories.links.related,
                animeName: relatedAnimeList.attributes.canonicalTitle,
              ),
            );
          }),
        ),
      ),
    );
  }
}
