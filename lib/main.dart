import 'package:flutter/material.dart';
import 'package:anime_app/router/router.gr.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

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

        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          bodyText2: GoogleFonts.poppins(
            textStyle: textTheme.bodyText2,
          ),
          bodyText1: GoogleFonts.openSans(textStyle: textTheme.bodyText1),
        ),
      ),
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}
