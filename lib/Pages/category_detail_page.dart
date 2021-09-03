import 'package:anime_app/service/api_service.dart';
import 'package:flutter/material.dart';

class CategoryDetailPage extends StatefulWidget {
  final String clickedUrl;
  final String clickedGenreName;
  const CategoryDetailPage(
      {Key? key, required this.clickedUrl, required this.clickedGenreName})
      : super(key: key);

  @override
  _CategoryDetailPageState createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  @override
  void initState() {
    ApiService()
        .getRelatedAnimeList(widget.clickedUrl, 0)
        .then((value) => print(value.toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.clickedGenreName),
      ),
      body: Text(widget.clickedUrl),
    );
  }
}
