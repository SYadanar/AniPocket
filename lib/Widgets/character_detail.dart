import 'package:anime_app/colors.dart';
import 'package:anime_app/temp_data.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class CharacterDetailWidget extends StatelessWidget {
  final String characterImgUrl,
      canonicalName,
      englishName,
      japaneseName,
      aboutCharacter;
  const CharacterDetailWidget(
      {Key? key,
      required this.characterImgUrl,
      required this.canonicalName,
      required this.englishName,
      required this.japaneseName,
      required this.aboutCharacter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _htmlContent = """<p>$aboutCharacter</p>""";
    return Scaffold(
      body: ListView(
        // shrinkWrap: true,
        children: [
          Stack(
            children: [
              // ------ Anime Cover Image Start ------
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
              // ------ Anime Cover Image End ------
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
                    size: 30,
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
                    size: 18,
                  ),
                ),
              ),
              // ------ Character Image Start ------
              Container(
                transform: Matrix4.translationValues(0.0, 120.0, 0.0),
                child: Center(
                  child: CircleAvatar(
                    radius: (MediaQuery.of(context).size.width / 2) - 60,
                    backgroundColor: mySecondaryColor,
                    child: CircleAvatar(
                      radius: (MediaQuery.of(context).size.width / 2) - 68,
                      backgroundImage: NetworkImage(
                        characterImgUrl,
                      ),
                    ),
                  ),
                ),
              )
              // ------ Character Image End ------
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 140, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ------ Character Name [Canonical Name] Start ------
                Container(
                  width: double.infinity,
                  child: Text(
                    canonicalName,
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                // ------ Character Name [Canonical Name] End ------
                SizedBox(
                  height: 20,
                ),
                // ------ Character Eng & Japanese Name Start ------
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "English       ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(0, 0, 0, 0.65),
                              ),
                            ),
                            TextSpan(
                              text: englishName,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Japanese   ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(0, 0, 0, 0.65),
                              ),
                            ),
                            TextSpan(
                              text: japaneseName,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // ------ Character Eng & Japanese Name End ------
                SizedBox(
                  height: 20,
                ),
                // ------ About Character Start ------
                Container(
                  child: Text(
                    "About $canonicalName",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.65),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: Html(
                    data: _htmlContent,
                    style: {
                      'p': Style(
                        lineHeight: LineHeight(1.5),
                        textAlign: TextAlign.justify,
                        fontFamily:
                            Theme.of(context).textTheme.bodyText1!.fontFamily,
                      ),
                    },
                  ),
                ),
                // ------ About Character End ------
              ],
            ),
          ),
        ],
      ),
    );
  }
}
