import 'package:anime_app/Models/For_search_bar/search_.dart';
import 'package:anime_app/router/router.gr.dart';
import 'package:anime_app/service/api_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ToDoSearchDelegate extends SearchDelegate<AnimeName> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<AnimeName>(
      future: ApiService().getname(query: query),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: Wrap(
                children: [
                  const CircularProgressIndicator(),
                ],
              ),
            );
          default:
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.animeDataForName.length,
                itemBuilder: (context, index) {
                  return _clickableSearchResultCards(
                    context,
                    snapshot.data!.animeDataForName[index].links.self,
                    snapshot.data!.animeDataForName[index].attributes
                        .posterImage.original,
                    snapshot.data!.animeDataForName[index].attributes
                        .canonicalTitle,
                  );
                },
              );
            }
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<AnimeName>(
      future: ApiService().getname(query: query),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: Wrap(
                children: [
                  const CircularProgressIndicator(),
                ],
              ),
            );
          default:
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.animeDataForName.length,
                itemBuilder: (context, index) {
                  return _clickableSearchResultCards(
                    context,
                    snapshot.data!.animeDataForName[index].links.self,
                    snapshot.data!.animeDataForName[index].attributes
                        .posterImage.original,
                    snapshot.data!.animeDataForName[index].attributes
                        .canonicalTitle,
                  );
                },
              );
            }
        }
      },
    );
  }

  InkWell _clickableSearchResultCards(BuildContext context, String clickedUrl,
      String posterImgUrl, String animeName) {
    return InkWell(
      onTap: () {
        AutoRouter.of(context).push(
          AnimeDetailRoute(clickedUrl: clickedUrl),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 60,
                child: Image.network(
                  posterImgUrl,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Image.asset(
                      "assets/images/no_img_available.png",
                    );
                  },
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 119,
                child: Text(
                  animeName,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
