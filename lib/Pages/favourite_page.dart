import 'package:anime_app/Models/For_Anime_Detail/detail_response.dart';
import 'package:anime_app/Widgets/anime_card_for_favourites.dart';
import 'package:anime_app/Widgets/drawer_list.dart';
import 'package:anime_app/router/router.gr.dart';
import 'package:anime_app/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({
    Key? key,
  }) : super(key: key);

  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  late Box animeBox;

  @override
  void initState() {
    super.initState();
    animeBox = Hive.box("anime");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
      ),
      drawer: Drawer(
        child: DrawerList(),
      ),
      body: ValueListenableBuilder(
        valueListenable: animeBox.listenable(),
        builder: (context, Box anime, _) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemBuilder: (context, index) {
              final key = anime.keys.toList()[index];
              final value = anime.get(key);

              return FutureBuilder<AnimeDetailResponse>(
                future: ApiService().getAnimeDetail(value),
                builder: (context, snapshot) {
                  String title = "N/A";
                  String posterImage = "N/A";
                  String rating = "N/A";

                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(
                        child: const CircularProgressIndicator(),
                      );
                    default:
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else {
                        if (snapshot.data!.data.attributes.averageRating !=
                            null)
                          rating =
                              snapshot.data!.data.attributes.averageRating!;

                        if (snapshot.data!.data.attributes.canonicalTitle !=
                            null)
                          title =
                              snapshot.data!.data.attributes.canonicalTitle!;

                        if (snapshot.data!.data.attributes.posterImage != null)
                          posterImage = snapshot
                              .data!.data.attributes.posterImage!.original;

                        return InkWell(
                          onLongPress: () {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return Dialog(
                                  insetPadding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Container(
                                    height: 160,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Are you sure you want to remove\n"$title"\nfrom your favourite list?',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'No',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                animeBox.delete(key);
                                                Navigator.pop(context);
                                                // Show message with SnackBar
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        "Removed from your favourite list!"),
                                                    action: SnackBarAction(
                                                      label: 'Undo',
                                                      onPressed: () {
                                                        animeBox.put(
                                                            key, value);
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                'Yes',
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          onTap: () {
                            AutoRouter.of(context).push(
                              AnimeDetailRoute(
                                  clickedUrl: snapshot.data!.data.links.self),
                            );
                          },
                          child: FavouriteAnimeCards(
                            imageUrl: posterImage,
                            animeName: title,
                            rating: rating,
                            category: snapshot.data!.data.relationships
                                .categories.links.related,
                          ),
                        );
                      }
                  }
                },
              );
            },
            separatorBuilder: (_, index) => SizedBox(height: 15),
            itemCount: anime.keys.toList().length,
          );
        },
      ),
    );
  }
}
