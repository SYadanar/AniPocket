import 'package:anime_app/Models/For_Anime_Card/anime_response.dart';
import 'package:anime_app/Widgets/category_list_of_anime.dart';
import 'package:anime_app/Widgets/youtube_player.dart';
import 'package:anime_app/router/router.gr.dart';
import 'package:anime_app/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';



class TestingPage extends StatelessWidget {
  
  const TestingPage({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('This is home page'),),
      
        body: Column(
          
      children: [
        
        
        ElevatedButton(onPressed: (){
          //AutoRouter.of(context).push(DetailRoute(id: 2));
          //AutoRouter.of(context).pop();
        }, child: Text('Page'))
      ],
    ));
  }
}
