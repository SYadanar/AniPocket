import 'package:anime_app/colors.dart';
import 'package:anime_app/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    var d = Duration(seconds: 5);
    // Delayed 5 sseconds to next page
    Future.delayed(d, () {
      AutoRouter.of(context).push(HomeRoute());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: paleYellowColor,
        ),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  "assets/images/logo_2.png",
                  width: MediaQuery.of(context).size.width - 140,
                ),
              ),
              Text(
                "AniPocket",
                style: TextStyle(
                  color: myPrimaryColor,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Browse Anime Anytime, Anywhere",
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 1.25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
