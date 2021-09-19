import 'package:anime_app/Models/For_Category/category_list_response.dart';
import 'package:anime_app/service/api_service.dart';
import 'package:flutter/material.dart';

class FavouriteAnimeCards extends StatelessWidget {
  final String imageUrl;
  final String animeName;
  final String rating;
  final String category;
  const FavouriteAnimeCards({
    Key? key,
    required this.imageUrl,
    required this.animeName,
    required this.rating,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 156,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ------ Poster Image Start ------
              Container(
                width: 110,
                height: double.infinity,
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
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              // ------ Poster Image End ------
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ------ Anime Name Start ------
                    SizedBox(
                      child: Text(
                        animeName,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.stars_rounded,
                          color: Color.fromRGBO(255, 195, 0, 1),
                          size: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            rating,
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
                      future:
                          ApiService().getRelatedCategoryList(category, 1, 0),
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
            ],
          ),
        ),
      ),
    );
  }
}
