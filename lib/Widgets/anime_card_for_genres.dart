import 'package:anime_app/Models/For_Category/category_list_response.dart';
import 'package:anime_app/service/api_service.dart';
import 'package:flutter/material.dart';

class AnimeCardForGenres extends StatefulWidget {
  final String imageUrl;
  final String rating;
  final String animeName;
  final String category;
  const AnimeCardForGenres(
      {Key? key,
      required this.imageUrl,
      required this.rating,
      required this.animeName,
      required this.category})
      : super(key: key);

  @override
  _AnimeCardForGenresState createState() => _AnimeCardForGenresState();
}

class _AnimeCardForGenresState extends State<AnimeCardForGenres> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      height: 190,
      child: Stack(
        children: [
          Positioned(
            bottom: 15,
            right: 16,
            child: Container(
              padding: EdgeInsets.only(left: 130, top: 10, bottom: 10),
              height: 140,
              width: MediaQuery.of(context).size.width - 32,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ------ Anime Name Start ------
                  SizedBox(
                    child: Text(
                      widget.animeName,
                      style: TextStyle(fontSize: 18),
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                      softWrap: true,
                    ),
                    width: MediaQuery.of(context).size.width - 178,
                  ),
                  // ------ Anime Name End ------
                  SizedBox(
                    height: 10,
                  ),
                  // ------ Anime Rating Start ------
                  Row(
                    children: [
                      Icon(
                        Icons.stars_rounded,
                        color: Color.fromRGBO(255, 195, 0, 1),
                        size: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          widget.rating,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // ------ Anime Rating End ------
                  SizedBox(
                    height: 10,
                  ),
                  // ------ Anime Category Start ------
                  FutureBuilder<CategoryListResponse>(
                    future: ApiService()
                        .getRelatedCategoryList(widget.category, 1, 0),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Wrap(
                            children: [
                              SizedBox(
                                child: const CircularProgressIndicator(),
                                width: 10,
                                height: 10,
                              ),
                            ],
                          );
                        default:
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          } else {
                            return SizedBox(
                              child: Text(
                                snapshot.data!.data.first.attributes.title,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(0, 0, 0, 0.65),
                                ),
                                overflow: TextOverflow.fade,
                                maxLines: 2,
                                softWrap: true,
                              ),
                              width: MediaQuery.of(context).size.width - 178,
                            );
                          }
                      }
                    },
                  ),
                  // ------ Anime Category End ------
                ],
              ),
            ),
          ),
          // ------ Anime Poster Start ------
          Positioned(
            bottom: 15,
            child: Container(
              width: 115,
              height: 160,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(3, 0),
                  ),
                ],
              ),
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          )
          // ------ Anime Poster End ------
        ],
      ),
      //),
    );
  }
}
