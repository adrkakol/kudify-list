import 'package:flutter/material.dart';

import 'kudos_list.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kudify App',
        home: KudosList());
  }
}
