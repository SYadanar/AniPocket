import 'package:flutter/material.dart';
import 'package:anime_app/router/router.gr.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appRouter=MyAppRouter();

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp.router(
      title: 'Material App',
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(), 
      
    );
  }
}
 