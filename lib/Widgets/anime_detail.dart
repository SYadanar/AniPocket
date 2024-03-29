import 'package:anime_app/Models/For_Anime_Character/character_detail_response.dart';
import 'package:anime_app/Models/For_Anime_Character/character_response.dart';
import 'package:anime_app/Widgets/anime_detail_more_info.dart';
import 'package:anime_app/Widgets/category_list_of_anime.dart';
import 'package:anime_app/Widgets/character_card.dart';
import 'package:anime_app/Widgets/youtube_player.dart';
import 'package:anime_app/colors.dart';
import 'package:anime_app/router/router.gr.dart';
import 'package:anime_app/service/api_service.dart';
import 'package:anime_app/temp_data.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:anime_app/main.dart';

late Box animeBox;

class AnimeDetail extends StatefulWidget {
  final String animeId,
      coverImageUrl,
      animeTitle,
      rating,
      categoryUrl,
      overview,
      startDate,
      endDate,
      nextRelease,
      popularityRank,
      ratingRank,
      ageRatingGuide,
      status,
      episodeCount,
      episodeLength,
      youtubeVideoId,
      self;
  const AnimeDetail({
    Key? key,
    required this.animeId,
    required this.coverImageUrl,
    required this.rating,
    required this.overview,
    required this.animeTitle,
    required this.categoryUrl,
    required this.startDate,
    required this.endDate,
    required this.nextRelease,
    required this.popularityRank,
    required this.ratingRank,
    required this.ageRatingGuide,
    required this.status,
    required this.episodeCount,
    required this.episodeLength,
    required this.youtubeVideoId,
    required this.self,
  }) : super(key: key);

  @override
  _AnimeDetailState createState() => _AnimeDetailState();
}

class _AnimeDetailState extends State<AnimeDetail> {
  final PagingController<int, Data> _pagingController =
      PagingController(firstPageKey: 0);

  bool isInFav = false;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    animeBox = Hive.box(animeName);

    // Check if anime is already in User's favourite list or not
    if (animeBox.get(widget.animeTitle) != null) {
      isInFav = true;
    }

    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final response =
          await ApiService().getAnimeCharacterList(widget.animeId, 5, pageKey);
      final bool isLastPage = pageKey == 10;
      if (isLastPage) {
        _pagingController.appendLastPage(response.data);
      } else {
        final int nextPageKey = pageKey + 10;
        _pagingController.appendPage(response.data, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 220,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.transparent],
                      ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height),
                      );
                    },
                    blendMode: BlendMode.dstIn,
                    child: buildChild(),
                  ),
                  Positioned(
                    top: 20,
                    left: 10,
                    child: InkWell(
                      onTap: () {
                        AutoRouter.of(context).pop();
                      },
                      child: Icon(
                        Icons.circle,
                        color: Color.fromRGBO(255, 255, 255, 0.6),
                        size: 32,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 26,
                    left: 15,
                    child: InkWell(
                      onTap: () {
                        AutoRouter.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      child: Column(
                        children: [
                          // ------ Title & Favourite Icon Area Start ------
                          Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ------ Anime Title Start ------
                                Container(
                                  width: MediaQuery.of(context).size.width - 70,
                                  child: Text(
                                    widget.animeTitle,
                                    style: TextStyle(fontSize: 22),
                                  ),
                                ),
                                // ------ Anime Title End ------

                                // ------ Favourite Icon End ------
                                Container(
                                  width: 28,
                                  child: IconButton(
                                    iconSize: 28,
                                    onPressed: () {
                                      final value = widget.self;
                                      final key = widget.animeTitle;
                                      setState(
                                        () {
                                          if (isInFav == true) {
                                            isInFav = false;
                                            // Add to Local Storage (animeBox)
                                            animeBox.delete(key);
                                            // Show message with SnackBar
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    "Removed from your favourite list!"),
                                              ),
                                            );
                                          } else {
                                            isInFav = true;
                                            // Remove from Local Storage (aniweBox)
                                            animeBox.put(key, value);
                                            // Show message with SnackBar
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    "Added to your favourite list!"),
                                              ),
                                            );
                                          }
                                        },
                                      );
                                    },
                                    icon: Icon(
                                      isInFav
                                          ? Icons.favorite
                                          : Icons.favorite_border_outlined,
                                      color: Colors.red,
                                      size: 28,
                                    ),
                                  ),
                                )
                                // ------ Favourite Icon End ------
                              ],
                            ),
                          ),
                          // ------ Title & Favourite Icon Area End ------
                          SizedBox(
                            height: 8,
                          ),
                          // ------ Anime Rating Start ------
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
                                  widget.rating,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // ------ Anime Rating End ------
                        ],
                      ),
                    ),
                    // ------ Category List Start ------
                    CategoryListOfAnime(url: widget.categoryUrl),
                    // ------ Category List End ------
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                      child: Column(
                        children: [
                          // ------ Anime Overview Start ------
                          Container(
                            width: double.infinity,
                            child: Text(
                              "Overview",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(0, 0, 0, 0.65),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: double.infinity,
                              child: Text(
                                widget.overview != "N/A"
                                    ? widget.overview
                                    : "WE ARE SORRY !\nThare is no Overview for this Anime yet!",
                                style: GoogleFonts.openSans(
                                  height: 1.5,
                                  fontSize: 14,
                                ),
                                textAlign: widget.overview != "N/A" ? TextAlign.justify : TextAlign.center,
                              )),
                          // ------ Anime Overview End ------
                          SizedBox(
                            height: 20,
                          ),
                          // ------ Trailer Start ------
                          Container(
                            child: widget.youtubeVideoId != "N/A"
                                ? YouTubePlayer(widget.youtubeVideoId)
                                : Text(""),
                          ),
                          // ------ Trailer End ------
                          SizedBox(
                            height: 20,
                          ),
                          // ------ Anime More Info Start ------
                          Container(
                            width: double.infinity,
                            child: Text(
                              "More Information",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MoreInformation(
                              startDate: widget.startDate,
                              endDate: widget.endDate,
                              nextRelease: widget.nextRelease,
                              popularityRank: widget.popularityRank,
                              ratingRank: widget.ratingRank,
                              ageRatingGuide: widget.ageRatingGuide,
                              status: widget.status,
                              episodeCount: widget.episodeCount,
                              episodeLength: widget.episodeLength),
                          // ------ Anime More Info End ------
                          SizedBox(
                            height: 18,
                          ),
                          // ------ Characters Start ------
                          Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Characters",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    AutoRouter.of(context).push(
                                      CharacterListRoute(
                                        animeId: widget.animeId,
                                        animeName: widget.animeTitle,
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "See more",
                                    style: TextStyle(color: myPrimaryColor),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 250,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: PagedListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 20,
                          );
                        },
                        padding: EdgeInsets.only(left: 16, right: 16),
                        pagingController: _pagingController,
                        builderDelegate: PagedChildBuilderDelegate<Data>(
                          itemBuilder: (context, character, index) {
                            return FutureBuilder<CharacterDetailResponse>(
                              future:
                                  ApiService().getCharacterDetail(character.id),
                              builder: (context, snapshot) {
                                String characterImg = "N/A";
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting:
                                    return Center(
                                      child: Wrap(
                                        children: [
                                          SizedBox(
                                            child:
                                                const CircularProgressIndicator(),
                                            width: 20,
                                            height: 20,
                                          )
                                        ],
                                      ),
                                    );
                                  default:
                                    if (snapshot.hasError) {
                                      return Center(
                                        child: Text(snapshot.error.toString()),
                                      );
                                    } else {
                                      if (snapshot
                                              .data!.data.attributes.image !=
                                          null) {
                                        characterImg = snapshot.data!.data
                                            .attributes.image!.original;
                                      }
                                      return CharacterCard(
                                        characterId: character.id,
                                        imageUrl: characterImg,
                                        characterName: snapshot.data!.data
                                            .attributes.canonicalName,
                                      );
                                    }
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    // ------ Characters End ------
                  ],
                );
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
