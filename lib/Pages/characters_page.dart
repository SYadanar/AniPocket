import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.all(13),
            sliver: SliverAppBar(
                expandedHeight: 380,
                backgroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/images/sample_poster.jpg',
                    fit: BoxFit.fill,
                  ),
                )),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (_, int index) {
              return Container(
                padding: EdgeInsets.only(left: 13),
                height: 60,
                width: 300,
                child: Text(
                  'Character Name<Japan Name>',
                  //textScaleFactor: 2,
                  style: TextStyle(fontSize: 19),
                ),
              );
            },
            childCount: 1,
          )),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (_, int index) {
              return Container(
                padding: EdgeInsets.only(left: 13),
                height: 30,
                width: 300,
                child: Text(
                  'Detail',
                  //textScaleFactor: 2,
                  style: TextStyle(
                    fontSize: 17,
                    //color: Colors.grey[700],
                  ),
                ),
              );
            },
            childCount: 1,
          )),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (_, int index) {
              return Container(
                padding: EdgeInsets.only(left: 13),
                height: 150,
                width: 300,
                child: Text(
                  '                         WriteDetail Here.................................................................................................................................................................................................................................................................................................................................................................',
                  //textScaleFactor: 2,
                  style: TextStyle(fontSize: 14),
                ),
              );
            },
            childCount: 1,
          )),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (_, int index) {
              return Container(
                padding: EdgeInsets.only(left: 13),
                height: 30,
                width: 300,
                child: Text(
                  'Related Characters',
                  //textScaleFactor: 2,
                  style: TextStyle(
                    fontSize: 17,
                    //color: Colors.grey[700],
                  ),
                ),
              );
            },
            childCount: 1,
          )),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (_, int index) {
              return Container(
                padding: EdgeInsets.only(left: 10),
                height: 250,
                width: 300,
                color: Colors.white,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 5, color: Colors.white),
                            bottom: BorderSide(width: 8, color: Colors.white),
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 140,
                              height: 180,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: Image.asset(
                                  'assets/images/sample_poster.jpg',
                                  fit: BoxFit.fill,
                                  // height: 184,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 140,
                              child: Text(
                                "CHARACTER NAME",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 5, color: Colors.white),
                            bottom: BorderSide(width: 8, color: Colors.white),
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 140,
                              height: 180,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: Image.asset(
                                  'assets/images/sample_poster.jpg',
                                  fit: BoxFit.fill,
                                  // height: 184,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 140,
                              child: Text(
                                "CHARACTER NAME",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 5, color: Colors.white),
                            bottom: BorderSide(width: 8, color: Colors.white),
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 140,
                              height: 180,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: Image.asset(
                                  'assets/images/sample_poster.jpg',
                                  fit: BoxFit.fill,
                                  // height: 184,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 140,
                              child: Text(
                                "CHARACTER NAME",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            childCount: 1,
          )),
        ],
      ),
    );
  }
}
