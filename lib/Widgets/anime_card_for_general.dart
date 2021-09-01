import 'package:flutter/material.dart';

class AnimeCardForGeneral extends StatelessWidget {
  const AnimeCardForGeneral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 150,
              height: 194,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                child: Image.asset(
                  'assets/images/sample_poster.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: (150 - 58) / 2,
              child: Container(
                transform: Matrix4.translationValues(0.0, 10.0, 0.0),
                width: 58,
                height: 22,
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 243, 58, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.stars_rounded,
                      // color: Color.fromRGBO(255, 195, 0, 1),
                      size: 15,
                    ),
                    Text(
                      "83.1",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(0, 0, 0, 0.65),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 150,
          child: Text(
            "Action",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(0, 0, 0, 0.65),
            ),
          ),
        ),
        SizedBox(
          width: 150,
          child: Text(
            "Anime Title Here",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
