import 'package:anime_app/Models/For_Anime_Character/character_detail_response.dart';
import 'package:anime_app/Widgets/character_detail.dart';
import 'package:anime_app/service/api_service.dart';
import 'package:flutter/material.dart';

class CharacterDetailPage extends StatelessWidget {
  final String characterId;
  const CharacterDetailPage({Key? key, required this.characterId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<CharacterDetailResponse>(
          future: ApiService().getCharacterDetail(characterId),
          builder: (context, snapshot) {
            String characterImg = "N/A";
            String engName = "N/A";
            String jpName = "N/A";
      
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: const CircularProgressIndicator(),
                );
              default:
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  if (snapshot.data!.data.attributes.image != null) {
                    characterImg = snapshot.data!.data.attributes.image!.original;
                  }
                  if (snapshot.data!.data.attributes.names.en != null) {
                    engName = snapshot.data!.data.attributes.names.en!;
                  }
                  if (snapshot.data!.data.attributes.names.jp != null) {
                    jpName = snapshot.data!.data.attributes.names.jp!;
                  }
                  return CharacterDetailWidget(
                      characterImgUrl: characterImg,
                      canonicalName: snapshot.data!.data.attributes.canonicalName,
                      englishName: engName,
                      japaneseName: jpName,
                      aboutCharacter: snapshot.data!.data.attributes.description);
                }
            }
          },
        ),
      ),
    );
  }
}
