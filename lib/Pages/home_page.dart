import 'dart:ui';
import 'package:anime_app/Models/For_Anime_Card/anime_response.dart';
import 'package:anime_app/Models/For_Anime_Card/all_anime_response.dart';
import 'package:flutter/material.dart';
import 'package:anime_app/service/api_service.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
//import 'package:anime_app/Models/For_Anime_Card/related_anime_response.dart';

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
      print("is last $isLastPage");
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
          title: Text('This is home page'),
        ),
        body:
            /*(
            //padding: const EdgeInsets.symmetric(horizontal: 16),
            child:*/
            Center(
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
                            return Scaffold(
                                body: Column(children: [
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                width: double.infinity,
                                height: 20,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: Text(
                                        "Recommended",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey[700]),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
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
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
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
                                                            color: Colors.black
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
                                                              .animeData[index]
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
                                                                0.0, 10.0, 0.0),
                                                        width: 65,
                                                        height: 22,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 5),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              255, 243, 58, 1),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(15),
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
                                                              style: TextStyle(
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
                                                    overflow: TextOverflow.fade,
                                                    maxLines: 2,
                                                    softWrap: true,
                                                  ),
                                                ),
                                              ],
                                            )));
                                      })),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
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
                              ),
                              Container(
                                  width: double.infinity,
                                  height: 300,
                                  child: PagedGridView<int, AllAnimeData>(
                                      pagingController: _pagingController,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              childAspectRatio: 19 / 38,
                                              mainAxisSpacing: 15,
                                              crossAxisSpacing: 20,
                                              crossAxisCount: 2),
                                      padding: EdgeInsets.only(
                                          top: 20,
                                          bottom: 10,
                                          left: 20,
                                          right: 20),
                                      builderDelegate:
                                          PagedChildBuilderDelegate<
                                                  AllAnimeData>(
                                              itemBuilder:
                                                  (context, allanime, index) {
                                        String rating;
                                        if (allanime.attributes.averageRating !=
                                            null) {
                                          rating = allanime
                                              .attributes.averageRating!;
                                        } else {
                                          rating = "N/A";
                                        }
                                        return InkWell(
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
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.25),
                                                          spreadRadius: 0,
                                                          blurRadius: 10,
                                                          offset: Offset(3, 3),
                                                        ),
                                                      ],
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(15),
                                                      ),
                                                      child: Image.network(
                                                        allanime
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
                                                              0.0, 10.0, 0.0),
                                                      width: 65,
                                                      height: 22,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            255, 243, 58, 1),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(15),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Icon(
                                                            Icons.stars_rounded,
                                                            // color: Color.fromRGBO(255, 195, 0, 1),
                                                            size: 15,
                                                          ),
                                                          Text(
                                                            rating,
                                                            style: TextStyle(
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
                                                    fontWeight: FontWeight.w400,
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.65),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 150,
                                                child: Text(
                                                  allanime.attributes
                                                      .canonicalTitle,
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  overflow: TextOverflow.fade,
                                                  maxLines: 2,
                                                  softWrap: true,
                                                ),
                                              ),
                                            ],
                                          )),
                                        );
                                      }))),
                            ]));
                          }
                      }
                    })));
  }
}
                              /*SizedBox(
                                height: 5,
                              ),
                              Container(
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
                              ),*/
                       
                      /*Container(
                        width: double.infinity,
                        height: 300,
                        child: PagedGridView<int, AllAnimeData>(
                          pagingController: _pagingController,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 19 / 38,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 20,
                                  crossAxisCount: 2),
                          padding: EdgeInsets.only(top: 20, bottom: 10,left: 20,right: 20),
                          builderDelegate:
                              PagedChildBuilderDelegate<AllAnimeData>(
                                  itemBuilder: (context, allanime, index) {
                            String rating;
                            if (allanime.attributes.averageRating != null) {
                              rating = allanime.attributes.averageRating!;
                            } else {
                              rating = "N/A";
                            }
                            return InkWell(
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
                                              color: Colors.black
                                                  .withOpacity(0.25),
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
                                            allanime.attributes.posterImage
                                                .original,
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5),
                                          decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(255, 243, 58, 1),
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
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.65),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    
                                ]),
                                ]),
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
                                      allanime.attributes.canonicalTitle,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              )),
                            );
                          }),
                        ),*/
                      
                    
                  
                
                                  
                            
       
/*),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    snapshot.data!.animeData[index].attributes
                                        .canonicalTitle,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400),
                                    overflow: TextOverflow.fade,
                                    maxLines: 2,
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            )));
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 9 / 10,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 10,
                          crossAxisCount: 2),
                      padding: EdgeInsets.only(top: 20, bottom: 10),
                    );*/
                  //}
              //}

/*snapshot.data!.animeData[index].attributes
                                          .posterImage.original*/
                                          /*snapshot.data!.animeData[index]
                                              .attributes.titles.en_jp*/
                                              /*snapshot.data!.animeData[index]
                                                  .attributes.averageRating*/