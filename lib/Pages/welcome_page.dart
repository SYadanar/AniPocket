import 'package:anime_app/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';



class WelcomePage extends StatelessWidget {
  
  const WelcomePage({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('This is welcome page'),),
      
        body: Column(
          
      children: [
        ElevatedButton(onPressed: (){
          AutoRouter.of(context).push(HomeRoute(id: 1));
          //AutoRouter.of(context).pop();
        }, child: Text('guest account')),
        
      ],
    ));
  }
}
