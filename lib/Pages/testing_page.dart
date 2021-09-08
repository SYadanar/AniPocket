import 'package:anime_app/Models/For_Anime_Card/anime_response.dart';
import 'package:anime_app/router/router.gr.dart';
import 'package:anime_app/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class TestintPage extends StatelessWidget {
  const TestintPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('This is testing page'),
        ),
        body: Center(
            child: FutureBuilder<AnimeResponse>(
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
                        return CustomScrollView(
                          slivers: <Widget>[
                            //SliverPadding(
                            //padding: EdgeInsets.all(13),
                            //sliver:
                            SliverAppBar(
                                expandedHeight: 300,
                                backgroundColor: Colors.white,
                                flexibleSpace: FlexibleSpaceBar(
                                  title: Container(
                                    height: 140,
                                    width: 140,
                                    child: Image.asset(
                                      'assets/images/LogoSample.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  background: Image.asset(
                                    'assets/images/BackGroundSample.png',
                                    fit: BoxFit.fill,
                                  ),
                                )),
                            //),
                            SliverList(
                                delegate: SliverChildBuilderDelegate(
                              (_, int index) {
                                return Container(
                                  padding: EdgeInsets.only(left: 20),
                                  height: 30,
                                  child: Text(
                                    "Recommended",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey[700]),
                                  ),
                                );
                              },
                              childCount: 1,
                            )),
                            SliverList(
                                delegate: SliverChildBuilderDelegate(
                              (_, int index) {
                                return Container(
                                    width: double.infinity,
                                    height: 270,
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(
                                            width: 20,
                                          );
                                        },
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20),
                                        itemCount:
                                            snapshot.data!.animeData.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          String rating;
                                          if (snapshot.data!.animeData[index]
                                                  .attributes.averageRating !=
                                              null) {
                                            rating = snapshot
                                                .data!
                                                .animeData[index]
                                                .attributes
                                                .averageRating!;
                                          } else {
                                            rating = "N/A";
                                          }
                                          return GestureDetector(
                                              onTap: () {
                                                AutoRouter.of(context).push(
                                                  AnimeDetailRoute(
                                                      clickedUrl:
                                                          "https://kitsu.io/api/edge${snapshot.data!.animeData[index].links.self}"),
                                                );
                                              },
                                              child: Container(
                                                  child: Column(
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Container(
                                                        width: 150,
                                                        height: 194,
                                                        decoration:
                                                            BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.25),
                                                              spreadRadius: 0,
                                                              blurRadius: 10,
                                                              offset:
                                                                  Offset(3, 3),
                                                            ),
                                                          ],
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(15),
                                                          ),
                                                          child: Image.network(
                                                            snapshot
                                                                .data!
                                                                .animeData[
                                                                    index]
                                                                .attributes
                                                                .posterImage
                                                                .original,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        bottom: 0,
                                                        left: (150 - 65) / 2,
                                                        child: Container(
                                                          transform: Matrix4
                                                              .translationValues(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                          width: 65,
                                                          height: 22,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      5),
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                Color.fromRGBO(
                                                                    255,
                                                                    243,
                                                                    58,
                                                                    1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  15),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .stars_rounded,
                                                                // color: Color.fromRGBO(255, 195, 0, 1),
                                                                size: 15,
                                                              ),
                                                              Text(
                                                                rating,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0.65),
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
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.65),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 150,
                                                    child: Text(
                                                      snapshot
                                                          .data!
                                                          .animeData[index]
                                                          .attributes
                                                          .canonicalTitle,
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      overflow:
                                                          TextOverflow.fade,
                                                      maxLines: 2,
                                                      softWrap: true,
                                                    ),
                                                  ),
                                                ],
                                              )));
                                        }));
                              },
                              childCount: 1,
                            )),

                            SliverList(
                                delegate: SliverChildBuilderDelegate(
                              (_, int index) {
                                return Container(
                                  width: double.infinity,
                                  height: 20,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                       
                                        child: Text(
                                          "All Anime",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey[700]),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                              childCount: 1,
                            )),
                            SliverList(
                                delegate: SliverChildBuilderDelegate(
                              (_, int index) {
                                return Container(
                                  padding: EdgeInsets.only(left: 10),
                                  height: 250,
                                  width: 300,
                                  color: Colors.white,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                  width: 5,
                                                  color: Colors.white),
                                              bottom: BorderSide(
                                                  width: 8,
                                                  color: Colors.white),
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 140,
                                                height: 180,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/sample_poster.jpg',
                                                    fit: BoxFit.fill,
                                                    // height: 184,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                width: 140,
                                                child: Text(
                                                  "CHARACTER NAME",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                  width: 5,
                                                  color: Colors.white),
                                              bottom: BorderSide(
                                                  width: 8,
                                                  color: Colors.white),
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 140,
                                                height: 180,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/sample_poster.jpg',
                                                    fit: BoxFit.fill,
                                                    // height: 184,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                width: 140,
                                                child: Text(
                                                  "CHARACTER NAME",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                  width: 5,
                                                  color: Colors.white),
                                              bottom: BorderSide(
                                                  width: 8,
                                                  color: Colors.white),
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 140,
                                                height: 180,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/sample_poster.jpg',
                                                    fit: BoxFit.fill,
                                                    // height: 184,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                width: 140,
                                                child: Text(
                                                  "CHARACTER NAME",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              childCount: 1,
                            )),
                          ],
                        );
                      }
                  }
                })));
  }
}
