import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class GenrePage extends StatelessWidget {
  const GenrePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Genres'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            height: 40,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //AutoRouter.of(context).push(DetailRoute(id: 2));
                    //AutoRouter.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, onPrimary: Colors.blue),
                  child: Container(
                      height: 30,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              'Action',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      )),
                ),
                ElevatedButton(
                  onPressed: () {
                    //AutoRouter.of(context).push(DetailRoute(id: 2));
                    //AutoRouter.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, onPrimary: Colors.blue),
                  child: Container(
                      height: 30,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              'Comedy',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 40,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //AutoRouter.of(context).push(DetailRoute(id: 2));
                    //AutoRouter.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, onPrimary: Colors.blue),
                  child: Container(
                      height: 30,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              'Slice of Life',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      )),
                ),
                ElevatedButton(
                  onPressed: () {
                    //AutoRouter.of(context).push(DetailRoute(id: 2));
                    //AutoRouter.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, onPrimary: Colors.blue),
                  child: Container(
                      height: 30,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              'Drama',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 40,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //AutoRouter.of(context).push(DetailRoute(id: 2));
                    //AutoRouter.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, onPrimary: Colors.blue),
                  child: Container(
                      height: 30,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              'Romance',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      )),
                ),
                ElevatedButton(
                  onPressed: () {
                    //AutoRouter.of(context).push(DetailRoute(id: 2));
                    //AutoRouter.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, onPrimary: Colors.blue),
                  child: Container(
                      height: 30,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              'Psychological',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 40,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //AutoRouter.of(context).push(DetailRoute(id: 2));
                    //AutoRouter.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, onPrimary: Colors.blue),
                  child: Container(
                      height: 30,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              'History',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      )),
                ),
                ElevatedButton(
                  onPressed: () {
                    //AutoRouter.of(context).push(DetailRoute(id: 2));
                    //AutoRouter.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, onPrimary: Colors.blue),
                  child: Container(
                      height: 30,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              'Mecha',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 40,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //AutoRouter.of(context).push(DetailRoute(id: 2));
                    //AutoRouter.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, onPrimary: Colors.blue),
                  child: Container(
                      height: 30,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              'Supernatural',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      )),
                ),
                ElevatedButton(
                  onPressed: () {
                    //AutoRouter.of(context).push(DetailRoute(id: 2));
                    //AutoRouter.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, onPrimary: Colors.blue),
                  child: Container(
                      height: 30,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              'Adventure',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 40,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //AutoRouter.of(context).push(DetailRoute(id: 2));
                    //AutoRouter.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, onPrimary: Colors.blue),
                  child: Container(
                      height: 30,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              'Fantasy',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      )),
                ),
                ElevatedButton(
                  onPressed: () {
                    //AutoRouter.of(context).push(DetailRoute(id: 2));
                    //AutoRouter.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, onPrimary: Colors.blue),
                  child: Container(
                      height: 30,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              'Magic',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 40,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //AutoRouter.of(context).push(DetailRoute(id: 2));
                    //AutoRouter.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, onPrimary: Colors.blue),
                  child: Container(
                      height: 30,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              'Horror',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      )),
                ),
                ElevatedButton(
                  onPressed: () {
                    //AutoRouter.of(context).push(DetailRoute(id: 2));
                    //AutoRouter.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, onPrimary: Colors.blue),
                  child: Container(
                      height: 30,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              'Mystery',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 40,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //AutoRouter.of(context).push(DetailRoute(id: 2));
                    //AutoRouter.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, onPrimary: Colors.blue),
                  child: Container(
                      height: 30,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              'Sci-Fi',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      )),
                ),
                ElevatedButton(
                  onPressed: () {
                    //AutoRouter.of(context).push(DetailRoute(id: 2));
                    //AutoRouter.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, onPrimary: Colors.blue),
                  child: Container(
                      height: 30,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              'Ecchi',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
/*Card(
                  child: Container(
                      height: 30,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              'Action',
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      )),
                ),*/
