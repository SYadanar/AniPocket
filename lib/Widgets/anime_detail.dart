import 'package:flutter/material.dart';

class AnimeDetail extends StatefulWidget {
  const AnimeDetail({Key? key}) : super(key: key);

  @override
  _AnimeDetailState createState() => _AnimeDetailState();
}

class _AnimeDetailState extends State<AnimeDetail> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: ListView(children: [
        Stack(
          children: [
            Container(
                width: double.infinity,
                height: 200,
                child: FittedBox(
                  child: Image.asset('assets/images/Example.jpg'),
                  fit: BoxFit.fill,
                )),
            Positioned(
                top: 10,
                left: 10,
                child: Icon(
                  Icons.circle,
                  color: Colors.grey[700],
                  size: 35,
                )),
            Positioned(
                top: 14,
                left: 14,
                child: Icon(Icons.arrow_back_ios_new_outlined))
          ],
        ),
        SizedBox(
          height: 13,
        ),
        Container(
          width: double.infinity,
          height: 20,
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                child: Text(
                  "The Name of Anime",
                  style: TextStyle(fontSize: 19),
                ),
              ),
              SizedBox(
                width: 150,
              ),
              Container(
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 60,
            ),
            Positioned(
              left: 10,
              child: Icon(
                Icons.category,
                size: 28,
              ),
            ),
            Positioned(
              left: 50,
              child: Card(
                child: Container(
                  height: 20,
                  width: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Genres',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 110,
              child: Card(
                child: Container(
                  height: 20,
                  width: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Genres',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 170,
              child: Card(
                child: Container(
                  height: 20,
                  width: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Genres',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 240,
              child: Card(
                child: Container(
                  height: 30,
                  width: 110,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ratings  83',
                        style: TextStyle(color: Colors.grey[700], fontSize: 13),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 28,
              left: 50,
              child: Card(
                child: Container(
                  height: 20,
                  width: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Genres',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 28,
              left: 110,
              child: Card(
                child: Container(
                  height: 20,
                  width: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Genres',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 18,
        ),
        Container(
          width: double.infinity,
          height: 20,
          child: Row(
            children: [
              SizedBox(
                width: 12,
              ),
              Container(
                child: Text(
                  "Review",
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
            width: double.infinity,
            height: 170,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 336,
                  height: 170,
                  child: ListView(
                    children: [
                      Text(
                          'Write Review here........................................................................................')
                    ],
                  ),
                )
              ],
            )),
        SizedBox(
          height: 18,
        ),
        Container(
          width: double.infinity,
          height: 20,
          child: Row(
            children: [
              SizedBox(
                width: 12,
              ),
              Container(
                child: Text(
                  "More Information",
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 250,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: 190,
                  height: 250,
                  child: Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 15,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            child: Text(
                              "Start Date-",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[700]),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      width: double.infinity,
                      height: 15,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            child: Text(
                              "End Date-",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[700]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      width: double.infinity,
                      height: 15,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            child: Text(
                              "NextRelease-",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[700]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      width: double.infinity,
                      height: 15,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            child: Text(
                              "PopularityRank-",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[700]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      width: double.infinity,
                      height: 15,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            child: Text(
                              "RatingRank-",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[700]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      width: double.infinity,
                      height: 15,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            child: Text(
                              "AgeRatingGuide-",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[700]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      width: double.infinity,
                      height: 15,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            child: Text(
                              "Status-",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[700]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      width: double.infinity,
                      height: 15,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            child: Text(
                              "Total Episodes-",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[700]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      width: double.infinity,
                      height: 15,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            child: Text(
                              "Episode Length",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[700]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 18,
        ),
        Container(
          width: double.infinity,
          height: 20,
          child: Row(
            children: [
              SizedBox(
                width: 12,
              ),
              Container(
                child: Text(
                  "Characters",
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          color: Colors.white,
          width: double.infinity,
          height: 240,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(
                width: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
        ),
        Container(
          color: Colors.white,
          width: double.infinity,
          height: 35,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                  child: Container(
                      height: 35,
                      width: 80,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "See more",
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                          ]))),
            ],
          ),
        ),
      ]),
    ));
  }
}
