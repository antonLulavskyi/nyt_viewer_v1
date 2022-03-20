import 'package:flutter/material.dart';

import 'package:nyt_viewer_v1/screens/tapBar.dart';

void main() {
  runApp(const MyApp());
}

// // true - light mode, false - dark mode.
// bool colorMode = false;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: TapBarScreen.routeName,
      routes: {
        TapBarScreen.routeName:(context) => const TapBarScreen(),
      },
    );
  }
}
