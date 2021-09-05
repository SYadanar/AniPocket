import 'dart:ui';
import 'package:anime_app/Models/For_Anime_Card/anime_attributes.dart';
import 'package:anime_app/Models/For_Anime_Card/anime_response.dart';
import 'package:anime_app/Models/For_Anime_Card/anime_relationship.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:anime_app/service/api_service.dart';
//import 'package:anime_app/Models/For_Anime_Card/related_anime_response.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is home page'),
      ),
      body: FutureBuilder<AnimeResponse>(
        future: ApiService().getAnime(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();

            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return GridView.builder(
                  itemCount: snapshot.data?.animeData.length,
                  itemBuilder: (BuildContext context, int index) {
                    String rating;
                    if (snapshot
                            .data!.animeData[index].attributes.averageRating !=
                        null) {
                      rating = snapshot
                          .data!.animeData[index].attributes.averageRating!;
                    } else {
                      rating = "N/A";
                    }
                    return GestureDetector(
                        onTap: () {},
                        child: Container(
                            child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 150,
                                  height: 194,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        spreadRadius: 0,
                                        blurRadius: 10,
                                        offset: Offset(3, 3),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    child: Image.network(
                                      snapshot.data!.animeData[index].attributes
                                          .posterImage.original,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: (150 - 58) / 2,
                                  child: Container(
                                    transform: Matrix4.translationValues(
                                        0.0, 10.0, 0.0),
                                    width: 58,
                                    height: 22,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 243, 58, 1),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.stars_rounded,
                                          // color: Color.fromRGBO(255, 195, 0, 1),
                                          size: 15,
                                        ),
                                        Text(
                                          rating,
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.65),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                "Action",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(0, 0, 0, 0.65),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                snapshot.data!.animeData[index].attributes
                                    .canonicalTitle,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        )));
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 19 / 30,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2),
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                );
              }
          }
        },
      ),
      //],
    );
  }
}
/*snapshot.data!.animeData[index].attributes
                                          .posterImage.original*/
                                          /*snapshot.data!.animeData[index]
                                              .attributes.titles.en_jp*/
                                              /*snapshot.data!.animeData[index]
                                                  .attributes.averageRating*/