import 'package:anime_app/Models/For_Anime_Card/all_anime_response.dart';
import 'package:anime_app/Models/For_Anime_Card/anime_response.dart';
import 'package:anime_app/Models/For_search_bar/search_.dart';
import 'package:anime_app/Widgets/anime_card_for_general.dart';
import 'package:anime_app/Widgets/drawer_list.dart';
import 'package:anime_app/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:anime_app/service/api_service.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:anime_app/Widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PagingController<int, AllAnimeData> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      print("the page key is $pageKey");
      _fetchPage(pageKey);
    });
    //ApiService().getPassengers(1).then((value) => print(value.toString()));
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final response = await ApiService().getAll(pageKey);

      final bool isLastPage = response.meta.count == pageKey;
      if (isLastPage) {
        _pagingController.appendLastPage(response.animeData);
      } else {
        final int nextPageKey = pageKey + 10;
        _pagingController.appendPage(response.animeData, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: ToDoSearchDelegate());
              },
              icon: Icon(Icons.search))
        ],
      ),
      drawer: Drawer(
        child: DrawerList(),
      ),
      body: ListView(
        children: [
          // ----- Recommended List Start -----
          Container(
            width: double.infinity,
            height: 20,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Recommended",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          ),
          Container(
            width: double.infinity,
            height: 270,
            margin: const EdgeInsets.only(top: 10),
            child: Center(
              child: FutureBuilder<AnimeResponse>(
                future: ApiService().getAnime(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Wrap(
                        children: [
                          const CircularProgressIndicator(),
                        ],
                      );
                    default:
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 20,
                            );
                          },
                          padding: EdgeInsets.only(left: 16, right: 16),
                          itemCount: snapshot.data!.animeData.length,
                          itemBuilder: (BuildContext context, int index) {
                            String rating;
                            if (snapshot.data!.animeData[index].attributes
                                    .averageRating !=
                                null) {
                              rating = snapshot.data!.animeData[index]
                                  .attributes.averageRating!;
                            } else {
                              rating = "N/A";
                            }
                            return InkWell(
                              onTap: () {
                                AutoRouter.of(context).push(
                                  AnimeDetailRoute(
                                      clickedUrl:
                                          "https://kitsu.io/api/edge${snapshot.data!.animeData[index].links.self}"),
                                );
                              },
                              child: AnimeCardForGeneral(
                                imageUrl: snapshot.data!.animeData[index]
                                    .attributes.posterImage.original,
                                rating: rating,
                                animeName: snapshot.data!.animeData[index]
                                    .attributes.canonicalTitle,
                                category:
                                    "https://kitsu.io/api/edge${snapshot.data!.animeData[index].relationships.categories.links.related}",
                              ),
                            );
                          },
                        );
                      }
                  }
                },
              ),
            ),
          ),
          // ----- Recommended List End -----
          SizedBox(height: 10),
          // ----- All Anime List Start -----
          Container(
            width: double.infinity,
            height: 20,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "All Anime",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          ),
          Container(
            height: 630,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10),
            child: PagedGridView<int, AllAnimeData>(
              //physics: new NeverScrollableScrollPhysics(),
              //shrinkWrap: true,
              scrollDirection: Axis.vertical,
              pagingController: _pagingController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 19 / 35,
                mainAxisSpacing: 5,
                crossAxisSpacing: 10,
              ),
              builderDelegate: PagedChildBuilderDelegate<AllAnimeData>(
                itemBuilder: (context, allanime, index) {
                  String rating;
                  if (allanime.attributes.averageRating != null) {
                    rating = allanime.attributes.averageRating!;
                  } else {
                    rating = "N/A";
                  }
                  return InkWell(
                    onTap: () {
                      AutoRouter.of(context).push(
                        AnimeDetailRoute(clickedUrl: allanime.links.self),
                      );
                    },
                    child: AnimeCardForGeneral(
                      imageUrl: allanime.attributes.posterImage.original,
                      rating: rating,
                      animeName: allanime.attributes.canonicalTitle,
                      category: allanime.relationships.categories.links.related,
                    ),
                  );
                },
              ),
            ),
          ),
          // ----- All Anime List Start -----
        ],
      ),
    );
  }
}
