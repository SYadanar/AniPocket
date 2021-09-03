import 'dart:ui';

import 'package:anime_app/Models/For_Anime_Card/anime_response.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:anime_app/service/api_service.dart';

class HomePage extends StatefulWidget {
  final int id;
  const HomePage({
    Key? key,
    required this.id,
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
        body: ListView(
          children: [
            FutureBuilder<AnimeResponse>(
              //future: ApiService().getAnime("MM", "2020"),
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
                      return ListView.builder(
                          itemCount: snapshot.data?.animeData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: double.infinity,
                              height: 156,
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
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
                                            bottomLeft: Radius.circular(15),
                                          ),
                                          child: Image.network(
                                            snapshot.data!.animeData[index].attributes.posterImage.original,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              child: Text(
                                                "Hi",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  165,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            SizedBox(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Icon(
                                                    Icons.stars_rounded,
                                                    color: Color.fromRGBO(
                                                        255, 195, 0, 1),
                                                    size: 16,
                                                  ),
                                                  Text(
                                                    "83.1",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                              width: 50,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            SizedBox(
                                              child: Text(
                                                "Adventure fiction, Dark fantasy, Martial Arts, Action",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.65),
                                                ),
                                              ),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  165,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                }
              },
            ),
          ],
        ));
  }
}
