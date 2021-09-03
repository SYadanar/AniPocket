import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Hello");
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 5, color: Colors.green),
              bottom: BorderSide(width: 8, color: Colors.green),
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
                  "CHARACTER NAME HERE",
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
    );
  }
}
