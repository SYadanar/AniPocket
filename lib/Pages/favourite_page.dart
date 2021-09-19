import 'package:anime_app/Models/For_Anime_Detail/detail_response.dart';
import 'package:anime_app/Models/For_Category/category_list_response.dart';
import 'package:anime_app/colors.dart';
import 'package:anime_app/router/router.gr.dart';
import 'package:anime_app/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:anime_app/Widgets/anime_detail.dart';
import 'package:anime_app/main.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({
    Key? key,
  }) : super(key: key);

  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  void initState() {
    super.initState();
    animeBox = Hive.box(animeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ValueListenableBuilder(
            valueListenable: animeBox.listenable(),
            builder: (context, Box anime, _) {
              return ListView.separated(
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
                              return SizedBox(
                                  child: Center(
                                child: const CircularProgressIndicator(),
                              ));
                            default:
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(snapshot.error.toString()),
                                );
                              } else {
                                if (snapshot
                                        .data!.data.attributes.averageRating !=
                                    null)
                                  rating = snapshot
                                      .data!.data.attributes.averageRating!;

                                if (snapshot
                                        .data!.data.attributes.canonicalTitle !=
                                    null)
                                  title = snapshot
                                      .data!.data.attributes.canonicalTitle!;

                                if (snapshot
                                        .data!.data.attributes.posterImage !=
                                    null)
                                  posterImage = snapshot.data!.data.attributes
                                      .posterImage!.original;

                                return InkWell(
                                  onLongPress: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) {
                                          return Dialog(
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              child: Container(
                                                  height: 200,
                                                  padding: EdgeInsets.all(10),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        'Do you want to unsave ${title}',
                                                        textAlign:
                                                            TextAlign.justify,
                                                      ),
                                                      SizedBox(
                                                        height: 12,
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          animeBox.delete(key);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text('Yes'),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                primary:
                                                                    myPrimaryColor,
                                                                onPrimary:
                                                                    Colors
                                                                        .white),
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                          );
                                        });
                                  },
                                  onTap: () {
                                    AutoRouter.of(context).push(
                                      AnimeDetailRoute(
                                          clickedUrl:
                                              snapshot.data!.data.links.self),
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 156,
                                    child: Card(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 110,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.25),
                                                    spreadRadius: 0,
                                                    blurRadius: 10,
                                                    offset: Offset(3, 0),
                                                  ),
                                                ],
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  bottomLeft:
                                                      Radius.circular(15),
                                                ),
                                                child:
                                                    Image.network(posterImage),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    child: Text(
                                                      title,
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            165,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.stars_rounded,
                                                        color: Color.fromRGBO(
                                                            255, 195, 0, 1),
                                                        size: 16,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 5),
                                                        child: Text(
                                                          rating,
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  FutureBuilder<
                                                      CategoryListResponse>(
                                                    future: ApiService()
                                                        .getRelatedCategoryList(
                                                            snapshot
                                                                .data!
                                                                .data
                                                                .relationships
                                                                .categories
                                                                .links
                                                                .related,
                                                            1,
                                                            0),
                                                    builder:
                                                        (context, snapshot) {
                                                      switch (snapshot
                                                          .connectionState) {
                                                        case ConnectionState
                                                            .waiting:
                                                          return Wrap(
                                                            children: [
                                                              SizedBox(
                                                                child:
                                                                    const CircularProgressIndicator(),
                                                                width: 10,
                                                                height: 10,
                                                              ),
                                                            ],
                                                          );
                                                        default:
                                                          if (snapshot
                                                              .hasError) {
                                                            return Center(
                                                              child: Text(snapshot
                                                                  .error
                                                                  .toString()),
                                                            );
                                                          } else {
                                                            return SizedBox(
                                                              width: 150,
                                                              child: Text(
                                                                snapshot
                                                                    .data!
                                                                    .data
                                                                    .first
                                                                    .attributes
                                                                    .title,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0.65),
                                                                ),
                                                                overflow:
                                                                    TextOverflow
                                                                        .fade,
                                                                maxLines: 2,
                                                                softWrap: true,
                                                              ),
                                                            );
                                                          }
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                          }
                        });
                  },
                  separatorBuilder: (_, index) => Divider(),
                  itemCount: anime.keys.toList().length);
            },
          )),
        ],
      ),
    );
  }
}
/*Column(
        children: <Widget>[
          Expanded(
              child: ValueListenableBuilder(
            valueListenable: friendsBox.listenable(),
            builder: (context, Box friends, _) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    final key = friends.keys.toList()[index];
                    final value = friends.get(key);

                    return ListTile(
                      title: Text(
                        value!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      subtitle: Text(key,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    );
                  },
                  separatorBuilder: (_, index) => Divider(),
                  itemCount: friends.keys.toList().length);
            },
          )),
        ],
      ),*/

      /*ListTile(
                      title: Text(
                        value,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      subtitle: Text(key,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      trailing: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          animeBox.delete(key);
                        },
                      ),
                    );*/