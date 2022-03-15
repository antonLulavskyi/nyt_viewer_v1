import 'package:flutter/material.dart';
import 'package:nyt_viewer_v1/screens/favorites.dart';
import 'package:nyt_viewer_v1/screens/newsfeed.dart';

import './screens/settings.dart';

void main() {
  runApp(const MyApp());
}

// true - light mode, false - dark mode.
bool colorMode = false;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        //primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedBottonNavigationIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedBottonNavigationIndex = index;
    });
  }

  final List<Widget> _pages = [
      Newsfeed(),
      Favorites(),
      Settings(),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NYT Viewer'),
      ),
      body: Center(
        child: _pages.elementAt(_selectedBottonNavigationIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedBottonNavigationIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.book_rounded), label: 'Newsfeed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded), label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Sittings'),
        ],
      ),
    );
  }
}
