import 'package:anime_app/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  final String characterId, imageUrl, characterName;
  const CharacterCard(
      {Key? key,
      required this.characterId,
      required this.imageUrl,
      required this.characterName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AutoRouter.of(context)
            .push(CharacterDetailRoute(characterId: characterId));
      },
      child: Wrap(
        children: [
          SizedBox(
            width: 160,
            child: Card(
              elevation: 10,
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 8, color: Colors.green),
                      bottom: BorderSide(width: 8, color: Colors.green),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 110,
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: Image.network(
                            imageUrl,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Image.asset(
                                "assets/images/no_img_available.png",
                                fit: BoxFit.fill,
                              );
                            },
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 140,
                        child: Text(
                          characterName,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          softWrap: true,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
