import 'package:flutter/material.dart';
import 'package:nyt_viewer_v1/screens/favorites.dart';
import 'package:nyt_viewer_v1/screens/newsfeed.dart';
import 'package:nyt_viewer_v1/screens/settings.dart';

class TapBarScreen extends StatefulWidget {
  static const routeName = '/tap-bar-screen';
  const TapBarScreen({Key? key}) : super(key: key);

  @override
  State<TapBarScreen> createState() => _TapBarScreenState();
}

class _TapBarScreenState extends State<TapBarScreen> {
  final List<Map<String, Object>> _pages = const [
    {'page': Newsfeed(), 'title': 'Newsfeed'},
    {'page': Settings(), 'title': 'Settings'},
    {'page': Favorites(), 'title': 'Favorites'},
  ];

  int _selectedIndex = 0;

  void _selectedScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${_pages[_selectedIndex]['title']}')),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _selectedScreen,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.book_rounded), label: 'Newsfeed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded), label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Sittings'),
        ],
      ),
      body: _pages[_selectedIndex]['page'] as Widget,
    );
  }
}
