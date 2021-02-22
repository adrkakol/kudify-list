import 'package:flutter/material.dart';

import 'kudos_wall.dart';
import 'theme_colors.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: ThemeColors.lightGrey,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20.0,
          ),
          headline2: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 14.0,
          ),
          headline3: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
          ),
          subtitle1: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ).apply(
          displayColor: ThemeColors.darkGrey,
        ),
      ),
      title: 'Kudify app',
      home: KudosWall(),
    );
  }
}
