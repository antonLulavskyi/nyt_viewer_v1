import 'package:flutter/material.dart';
import 'package:nyt_viewer_v1/screens/favorites.dart';
import 'package:nyt_viewer_v1/screens/newsfeed.dart';
import 'package:nyt_viewer_v1/screens/tapBar.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      //home: const Newsfeed(),
      initialRoute: TapBarScreen.routeName,
      routes: {
        TapBarScreen.routeName:(context) => const TapBarScreen(),
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   //int _selectedBottonNavigationIndex = 0;

//   // void _onItemTapped(int index) {
//   //   setState(() {
//   //     _selectedBottonNavigationIndex = index;
//   //   });
//   // }

//   // final List<Widget> _pages = [
//   //     const Newsfeed(),
//   //     const Favorites(),
//   //     const Settings(),
//   //   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('NYT Viewer'),
//       ),
//       body: Center(
//         child: Text('hello'),//_pages.elementAt(_selectedBottonNavigationIndex),
//       ),
//       // bottomNavigationBar: BottomNavigationBar(
//       //   currentIndex: _selectedBottonNavigationIndex,
//       //   onTap: _onItemTapped,
//       //   selectedItemColor: Colors.white,
//       //   unselectedItemColor: Colors.grey,
//       //   items: const [
//       //     BottomNavigationBarItem(
//       //         icon: Icon(Icons.book_rounded), label: 'Newsfeed'),
//       //     BottomNavigationBarItem(
//       //         icon: Icon(Icons.favorite_rounded), label: 'Favorites'),
//       //     BottomNavigationBarItem(
//       //         icon: Icon(Icons.settings), label: 'Sittings'),
//       //   ],
//       // ),
//     );
//   }
// }
