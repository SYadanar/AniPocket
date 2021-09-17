import 'package:anime_app/colors.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:anime_app/router/router.gr.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  await Hive.openBox<String>("friends");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appRouter = MyAppRouter();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp.router(
      title: 'Material App',
      theme: ThemeData(
        // textTheme:
        //     GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),

        textTheme: GoogleFonts.poppinsTextTheme(textTheme).copyWith(
          bodyText2: GoogleFonts.poppins(
            textStyle: textTheme.bodyText2,
          ),
          bodyText1: GoogleFonts.openSans(textStyle: textTheme.bodyText1),
        ),

        primaryColor: myPrimaryColor,
      ),
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}
