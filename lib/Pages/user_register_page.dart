import 'package:flutter/material.dart';



class UserSignUpPage extends StatelessWidget {
  
  const UserSignUpPage({Key? key, }) : super(key: key);

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
