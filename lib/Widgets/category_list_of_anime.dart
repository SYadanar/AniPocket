import 'package:anime_app/Models/For_Category/category_list_response.dart';
import 'package:anime_app/router/router.gr.dart';
import 'package:anime_app/service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CategoryListOfAnime extends StatefulWidget {
  final String url;
  const CategoryListOfAnime({Key? key, required this.url}) : super(key: key);

  @override
  _CategoryListOfAnimeState createState() => _CategoryListOfAnimeState();
}

class _CategoryListOfAnimeState extends State<CategoryListOfAnime> {
  final PagingController<int, CategoryList> _pagingController =
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
          await ApiService().getRelatedCategoryList(widget.url, 10, pageKey);

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
    return Container(
      width: double.infinity,
      height: 40,
      child: PagedListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 10,
          );
        },
        padding: EdgeInsets.only(left: 16, right: 16),
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<CategoryList>(
            itemBuilder: (context, categoryList, index) {
          return InkWell(
            onTap: () {
              AutoRouter.of(context).push(CategoryRelatedAnimeRoute(
                  clickedUrl: categoryList.relationships.anime.links.related,
                  clickedGenreName: categoryList.attributes.title));
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      categoryList.attributes.title,
                      textAlign: TextAlign.center,
                      // style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
