import 'package:anime_app/Models/For_Anime_Card/anime_response.dart';
import 'package:anime_app/Widgets/category_list_of_anime.dart';
import 'package:anime_app/Widgets/youtube_player.dart';
import 'package:anime_app/router/router.gr.dart';
import 'package:anime_app/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class TestintPage extends StatelessWidget {
  const TestintPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('This is testing page'),
        ),
        body: Center(
            child: FutureBuilder<AnimeResponse>(
                future: ApiService().getAnime(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const CircularProgressIndicator();

                    default:
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else {
                        return CustomScrollView(
                          slivers: <Widget>[
                            //SliverPadding(
                            //padding: EdgeInsets.all(13),
                            //sliver:
                            SliverAppBar(
                                expandedHeight: 200,
                                backgroundColor: Colors.white,
                                flexibleSpace: FlexibleSpaceBar(
                                  background: Stack(
                                    children: [
                                      ShaderMask(
                                        shaderCallback: (rect) {
                                          return LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.black,
                                              Colors.transparent
                                            ],
                                          ).createShader(
                                            Rect.fromLTRB(
                                                0, 0, rect.width, rect.height),
                                          );
                                        },
                                        blendMode: BlendMode.dstIn,
                                        child:
                                            //widget.coverImageUrl
                                            Image.asset(
                                          'assets/images/sample_poster.jpg',
                                          width: double.infinity,
                                          height: 200,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        left: 10,
                                        child: Icon(
                                          Icons.circle,
                                          color: Color.fromRGBO(
                                              255, 255, 255, 0.6),
                                          size: 30,
                                        ),
                                      ),
                                      Positioned(
                                        top: 16,
                                        left: 15,
                                        child: InkWell(
                                          onTap: () {
                                            AutoRouter.of(context).pop();
                                          },
                                          child: Icon(
                                            Icons.arrow_back_ios_new_outlined,
                                            size: 18,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                            //),
                            SliverList(
                                delegate: SliverChildBuilderDelegate(
                              (_, int index) {
                                return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 70,
                        child: Text(
                          // "The Name of Anime The Name of Anime The Name of Anime The Name of Anime The Name of Anime The Name of  Anime AnimeAnime Anime",
                          'widget.animeTitle',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.red,
                          size: 24,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Text(
                        'Rating',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.65),
                          fontSize: 14,
                        ),
                      ),
                      
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        // '83/100',
                        'widget.rating',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // ----------- Category List Start -----------
                CategoryListOfAnime(
                  url: 'widget.categoryUrl',
                ),
                // ----------- Category List End -----------
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "Review",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    // 'Write Review here..............................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................',
                    'widget.overview',
                    textAlign: TextAlign.justify,
                  ),
                ),
                // ---------- Trailer Area Start ----------
                SizedBox(
                  height: 20,
                ),
                YouTubePlayer('widget.youtubeVideoId'),
                // ---------- Trailer Area End ----------
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "More Information",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Start Date                 ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(0, 0, 0, 0.65),
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'widget.startDate',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "End Date                   ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(0, 0, 0, 0.65),
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'widget.endDate',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Next Release            ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(0, 0, 0, 0.65),
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'widget.nextRelease',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Popularity Rank       ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(0, 0, 0, 0.65),
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'widget.popularityRank',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Rating Rank              ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(0, 0, 0, 0.65),
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'widget.ratingRank',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Age Rating Guide    ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(0, 0, 0, 0.65),
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'widget.ageRatingGuide',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Status Guide             ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(0, 0, 0, 0.65),
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'widget.status',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Total Episodes         ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(0, 0, 0, 0.65),
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'widget.episodeCount',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Episode Length        ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromRGBO(0, 0, 0, 0.65),
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'widget.episodeLength',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                  child: Text(
                    "Characters",
                    style: TextStyle(fontSize: 18),
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
                      ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
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
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
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
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
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
              ],
            ),
          );
                              },
                              childCount: 1,
                            )),
                          ],
                        );
                      }
                  }
                })));
  }
}
