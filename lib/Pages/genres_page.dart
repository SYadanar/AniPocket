import 'package:anime_app/Models/For_Genre/genre_list_response.dart';
import 'package:anime_app/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class GenrePage extends StatefulWidget {
  const GenrePage({
    Key? key,
  }) : super(key: key);

  @override
  _GenrePageState createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  final PagingController<int, GenreList> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    // String encoded = Uri.encodeQueryComponent(
    //     "fields[genres]=name&page[limit]=10&page[offset]=0");
    // print(encoded);

    ApiService().getGenreList(0).then((value) => print(value.toString()));

    _pagingController.addPageRequestListener((pageKey) {
      print("Page Key ..... $pageKey");
      _fetchPage(pageKey);
    });

    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final response = await ApiService().getGenreList(pageKey);

      final bool isLastPage = response.meta.count == pageKey;
      print("Is last : $isLastPage");
      if (isLastPage) {
        _pagingController.appendLastPage(response.data);
      } else {
        final int nextPageKey = pageKey + 10;
        _pagingController.appendPage(response.data, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Genres'),
      ),
      body: PagedListView<int, GenreList>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<GenreList>(
            itemBuilder: (context, genereList, index) {
          return Text(genereList.id + " : " + genereList.attributes.name);
        }),
      ),
    );
  }
}


/*Card(
  child: Container(
      height: 30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              'Action',
              textAlign: TextAlign.center,
            ),
          )
        ],
      )),
),*/