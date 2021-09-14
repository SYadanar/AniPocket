import 'package:anime_app/Models/For_Category/category_list_response.dart';
import 'package:anime_app/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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
  // final PagingController<int, CategoryList> _pagingController =
  //     PagingController(firstPageKey: 0);

  // @override
  // void initState() {
  //   _pagingController.addPageRequestListener((pageKey) {
  //     _fetchPage(pageKey);
  //   });

  //   super.initState();
  // }

  // Future<void> _fetchPage(int pageKey) async {
  //   try {
  //     final response = await ApiService()
  //         .getAnimeCategoryListInString(widget.category, pageKey);

  //     final bool isLastPage = response.meta.count <= pageKey;
  //     if (isLastPage) {
  //       _pagingController.appendLastPage(response.data);
  //     } else {
  //       final int nextPageKey = pageKey + 10;
  //       _pagingController.appendPage(response.data, nextPageKey);
  //     }
  //   } catch (error) {
  //     _pagingController.error = error;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return /*InkWell(
      onTap: () {
        // print("hi");
        print(">>>>>>>>>>>>>>");
        print(widget.category);
      },
      child:*/
        Container(
      // margin: const EdgeInsets.symmetric(vertical: 15),
      // width: MediaQuery.of(context).size.width - 200,
      // height: 160,
      height: 190,
      child: Stack(
        children: [
          Positioned(
            bottom: 15,
            right: 16,
            child: Container(
              padding: EdgeInsets.only(left: 140, top: 10, bottom: 10),
              // width: MediaQuery.of(context).size.width,
              // height: 117,
              height: 140,
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
                  SizedBox(
                    child: Text(
                      // "Anime Title Here",
                      widget.animeName,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                      softWrap: true,
                    ),
                    width: MediaQuery.of(context).size.width - 160,
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
                          // "83.1",
                          widget.rating,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Text(
                      "Adventure fiction, Dark fantasy, Martial Arts, Action, Adventure fiction, Dark fantasy, Martial Arts, Action, , Dark fantasy, Martial Arts, Action",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 0.65),
                      ),
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                      softWrap: true,
                    ),
                    width: MediaQuery.of(context).size.width - 160,
                  ),
                  // PagedListView<int, CategoryList>(
                  //   physics: new NeverScrollableScrollPhysics(),
                  //   // shrinkWrap: true,
                  //   pagingController: _pagingController,
                  //   builderDelegate:
                  //       PagedChildBuilderDelegate<CategoryList>(
                  //     itemBuilder: (context, categoryList, index) {
                  //       String categoryListString = "";
                  //       if (index == 0) {
                  //         categoryListString =
                  //             "${categoryList.attributes.title}, ";
                  //       } else {
                  //         categoryListString = categoryListString +
                  //             "${categoryList.attributes.title}, ";
                  //       }
                  //       return SizedBox(
                  //         child: Text(categoryListString),
                  //         width: MediaQuery.of(context).size.width - 160,
                  //       );
                  //       // return Text(categoryList.attributes.title + " | ");
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
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
        ],
      ),
      //),
    );
  }
}
