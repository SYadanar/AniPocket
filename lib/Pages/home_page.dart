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
      body: Text("Home Page"),
    );
  }
}
