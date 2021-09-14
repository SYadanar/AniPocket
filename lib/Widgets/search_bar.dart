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
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
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
            ));
          default:
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.animeDataForName.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        snapshot.data!.animeDataForName[index].attributes
                            .canonicalTitle,
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                      onTap: () {
                        AutoRouter.of(context).push(
                          AnimeDetailRoute(
                              clickedUrl: snapshot
                                  .data!.animeDataForName[index].links.self),
                        );
                      },
                    );
                  });
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
            ));
          default:
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.animeDataForName.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        snapshot.data!.animeDataForName[index].attributes
                            .canonicalTitle,
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                      onTap: () {
                        AutoRouter.of(context).push(
                          AnimeDetailRoute(
                              clickedUrl: snapshot
                                  .data!.animeDataForName[index].links.self),
                        );
                      },
                    );
                  });
            }
        }
      },
    );
  }
}
