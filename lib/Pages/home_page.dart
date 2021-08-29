import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';



class HomePage extends StatelessWidget {
   final int id;
  const HomePage({Key? key, required this.id,}) : super(key: key);

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
