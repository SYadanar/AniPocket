import 'package:flutter/material.dart';

class OnTapMain extends StatefulWidget {
  const OnTapMain({Key? key}) : super(key: key);

  @override
  _OnTapMainState createState() => _OnTapMainState();
}

class _OnTapMainState extends State<OnTapMain> {
  void onTapFuntion() {
    setState(() {
      OnTap() == OnTapTwo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onTapFuntion();
        },
        child: OnTap());
  }
}

class OnTap extends StatefulWidget {
  const OnTap({Key? key}) : super(key: key);

  @override
  _OnTapState createState() => _OnTapState();
}

class _OnTapState extends State<OnTap> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.favorite_border_outlined,
          color: Colors.red,
          size: 24,
        ));
  }
}

class OnTapTwo extends StatefulWidget {
  const OnTapTwo({Key? key}) : super(key: key);

  @override
  _OnTapTwoState createState() => _OnTapTwoState();
}

class _OnTapTwoState extends State<OnTapTwo> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.favorite,
          color: Colors.red,
          size: 24,
        ));
  }
}
