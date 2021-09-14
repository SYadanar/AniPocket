import 'package:anime_app/Models/For_Category/category_list_response.dart';
import 'package:anime_app/service/api_service.dart';
import 'package:flutter/material.dart';

class AnimeCardForGeneral extends StatelessWidget {
  final String imageUrl;
  final String? rating;
  final String animeName;
  final String category;

  const AnimeCardForGeneral(
      {Key? key,
      required this.imageUrl,
      required this.rating,
      required this.animeName,
      required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: (150 - 65) / 2,
                child: Container(
                  transform: Matrix4.translationValues(0.0, 10.0, 0.0),
                  width: 65,
                  height: 22,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 243, 58, 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.stars_rounded,
                        // color: Color.fromRGBO(255, 195, 0, 1),
                        size: 15,
                      ),
                      Text(
                        // "83.1",
                        rating!,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 0.65),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 14,
          ),
          FutureBuilder<CategoryListResponse>(
            future: ApiService().getRelatedCategoryList(category, 1, 0),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Wrap(
                    children: [
                      SizedBox(
                        child: const CircularProgressIndicator(),
                        width: 20,
                        height: 20,
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
                      width: 150,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: new NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 150,
                            child: Text(
                              snapshot.data!.data[index].attributes.title,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 0.65),
                              ),
                              overflow: TextOverflow.fade,
                              maxLines: 2,
                              softWrap: true,
                            ),
                          );
                        },
                      ),
                    );
                  }
              }
            },
          ),
          SizedBox(
            width: 150,
            child: Text(
              animeName,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              overflow: TextOverflow.fade,
              maxLines: 2,
              softWrap: true,
            ),
          )
        ],
      ),
    );
  }
}
