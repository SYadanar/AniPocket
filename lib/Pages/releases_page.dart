import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class ReleasesPage extends StatelessWidget {
  const ReleasesPage({
    Key? key,
  }) : super(key: key);

  // Getting Current Year
  static final currentYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$currentYear Releases'),
      ),
      body: Text("Hi"),
    );
  }
}
