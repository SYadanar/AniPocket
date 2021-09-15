import 'package:anime_app/Models/For_Category/category_list_response.dart';
import 'package:anime_app/Widgets/drawer_list.dart';
import 'package:anime_app/router/router.gr.dart';
import 'package:anime_app/service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CategoryListPage extends StatefulWidget {
  const CategoryListPage({Key? key}) : super(key: key);

  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
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
      final response = await ApiService().getCategoryList(pageKey);

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
        title: Text('Genres'),
      ),
      drawer: Drawer(
        child: DrawerList(),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: PagedGridView<int, CategoryList>(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.8,
            mainAxisSpacing: 5,
            crossAxisSpacing: 10,
          ),
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<CategoryList>(
            itemBuilder: (context, categoryList, index) {
              return InkWell(
                onTap: () {
                  AutoRouter.of(context).push(CategoryRelatedAnimeRoute(
                      clickedUrl:
                          categoryList.relationships.anime.links.related,
                      clickedGenreName: categoryList.attributes.title));
                },
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(4),
                      bottomLeft: Radius.circular(4),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    child: Center(
                      child: Text(
                        categoryList.attributes.title,textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          // color: Color.fromRGBO(0, 0, 0, 0.65),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
