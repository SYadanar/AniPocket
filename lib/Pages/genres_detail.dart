import 'package:flutter/material.dart';

class GenreDetailPage extends StatefulWidget {
  final String clickedUrl;
  final String clickedGenreName;
  const GenreDetailPage(
      {Key? key, required this.clickedUrl, required this.clickedGenreName})
      : super(key: key);

  @override
  _GenreDetailPageState createState() => _GenreDetailPageState();
}

class _GenreDetailPageState extends State<GenreDetailPage> {
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
