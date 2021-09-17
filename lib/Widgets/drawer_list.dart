import 'package:anime_app/colors.dart';
import 'package:anime_app/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  // Getting Current Year
  static final currentYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // DrawerHeader(
        //   child: Image.asset("assets/images/LogoSample.png"),
        // ),
        Container(
          height: 100,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Image.asset(
                "assets/images/logo_2.png",
                fit: BoxFit.scaleDown,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "AniPocket",
                    style: TextStyle(
                      fontSize: 30,
                      color: myPrimaryColor,
                    ),
                  ),
                  Text(
                    "Anytime, Anywhere",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: ListTile(
            leading: Icon(
              Icons.home,
              color: myPrimaryColor,
            ),
            title: Text(
              "HOME",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: myPrimaryColor,
                letterSpacing: 1.5,
              ),
            ),
            onTap: () {
              AutoRouter.of(context).push(HomeRoute());
            },
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: ListTile(
            leading: Icon(
              Icons.category,
              color: myPrimaryColor,
            ),
            title: Text(
              "CATEGORY",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
                color: myPrimaryColor,
              ),
            ),
            onTap: () {
              AutoRouter.of(context).push(CategoryListRoute());
            },
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: ListTile(
            leading: Icon(
              Icons.calendar_today,
              color: myPrimaryColor,
            ),
            title: Text(
              "$currentYear RELEASES",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: myPrimaryColor,
                letterSpacing: 1.5,
              ),
            ),
            onTap: () {
              AutoRouter.of(context).push(ReleasesRoute());
            },
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: ListTile(
            leading: Icon(
              Icons.favorite,
              color: myPrimaryColor,
            ),
            title: Text(
              "FAVOURITES",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: myPrimaryColor,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
/*
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                DrawerHeader(child: Text("App Name")),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("HOME"),
                ),
                ListTile(
                  leading: Icon(Icons.category),
                  title: Text("CATEGORY"),
                ),
                ListTile(
                    leading: Icon(Icons.calendar_today),
                    // title: Text('2021 RELEASES'),
                    title: Text("$currentYear RELEASES")),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text("MY FAVOURITES"),
                ),
                // ExpansionTile(
                //   leading: Icon(Icons.info),
                //   title: Text("OTHERS"),
                //   trailing: Icon(Icons.keyboard_arrow_down),
                //   children: [
                //     ListTile(
                //       subtitle: Text("Contact Us"),
                //     ),
                //     ListTile(
                //       subtitle: Text("About Us"),
                //     ),
                //     ListTile(
                //       subtitle: Text("Feedback"),
                //     )
                //   ],
                // ),
              ],
            ),
          ),
          Container(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
            ),
          ),
        ],
      ),
    );
*/
  }
}
