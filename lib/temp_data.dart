import 'package:flutter/material.dart';

late String animeBackdropUrl;

Widget buildChild() {
  if (animeBackdropUrl == "N/A") {
    return Image.asset(
      "assets/images/no_img_available.png",
      width: double.infinity,
      height: 220,
      fit: BoxFit.fill,
    );
  } else {
    return Image.network(
      animeBackdropUrl,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Image.asset(
          "assets/images/no_img_available.png",
        );
      },
      width: double.infinity,
      height: 220,
      fit: BoxFit.fill,
    );
  }
}
