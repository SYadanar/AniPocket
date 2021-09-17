import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:anime_app/Pages/welcome_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Saves'),
      ),
      body: Container()
      /*Column(
        children: <Widget>[
          Expanded(
              child: ValueListenableBuilder(
            valueListenable: friendsBox.listenable(),
            builder: (context, Box<String> frineds, _) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    final key = frineds.keys.toList()[index];
                    final value = frineds.get(key);
                    return ListTile(
                      title: Text(value!),
                      subtitle: Text(key),
                    );
                  },
                  separatorBuilder: (_, index) => Divider(),
                  itemCount: frineds.keys.toList().length);
            },
          ))
        ],
      ),*/
    );
  }
}
