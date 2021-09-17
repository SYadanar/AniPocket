import 'dart:io';
import 'package:flutter/material.dart';
import 'package:anime_app/router/router.gr.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  await Hive.openBox<String>("friends");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appRouter = MyAppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Material App',
      theme: ThemeData(fontFamily: 'Raleway'),
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}
