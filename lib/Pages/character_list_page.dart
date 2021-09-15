import 'package:anime_app/Models/For_Anime_Character/character_detail_response.dart';
import 'package:anime_app/Models/For_Anime_Character/character_response.dart';
import 'package:anime_app/Widgets/character_card.dart';
import 'package:anime_app/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CharacterListPage extends StatefulWidget {
  final String animeId, animeName;
  const CharacterListPage(
      {Key? key, required this.animeId, required this.animeName})
      : super(key: key);

  @override
  _CharacterListPageState createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  final PagingController<int, Data> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final response =
          await ApiService().getAnimeCharacterList(widget.animeId, 10, pageKey);
      final bool isLastPage = response.meta.count <= pageKey;
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
      appBar: AppBar(
        title: Text("${widget.animeName} Characters"),
      ),
      body: PagedGridView<int, Data>(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Data>(
            itemBuilder: (context, character, index) {
          return Center(
            child: FutureBuilder<CharacterDetailResponse>(
              future: ApiService().getCharacterDetail(character.id),
              builder: (context, snapshot) {
                String characterImg = "N/A";
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Wrap(
                      children: [
                        SizedBox(
                          child: const CircularProgressIndicator(),
                          height: 20,
                          width: 20,
                        ),
                      ],
                    );
                  default:
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else {
                      if (snapshot.data!.data.attributes.image != null) {
                        characterImg =
                            snapshot.data!.data.attributes.image!.original;
                      }
                      return CharacterCard(
                        characterId: character.id,
                        imageUrl: characterImg,
                        characterName:
                            snapshot.data!.data.attributes.canonicalName,
                      );
                    }
                }
              },
            ),
          );
        }),
      ),
    );
  }
}
