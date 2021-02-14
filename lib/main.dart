import 'package:flutter/material.dart';
import 'kudos_list.dart';
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
            fontSize: 14.0,
            fontWeight: FontWeight.w800,
          ),
          headline3: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),
          subtitle1: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ).apply(
          displayColor: ThemeColors.darkGrey,
        ),
      ),
      title: 'Kudify App',
      home: KudosList(),
    );
  }
}
