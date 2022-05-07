import 'package:athkar/Screen/List_Quran_Page.dart';
import 'package:flutter/material.dart';

import 'First_Home_Athkar.dart';
import 'List_Quran_Page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  int _selectedIndex = 0;
//  static final List<Widget> _widgetOptions = <Widget>[
//    FirstHomePageAthkarItem(),
//    Test(),
//    ListQuranPage(),
//    Azan(),
////    DataTable(columns: , rows: null)
//  ];
//
//  void _onItemTapped(int index) {
//    setState(() {
//      _selectedIndex = index;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('‏اذكار الصباح والمساء'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.ac_unit),
              ),
//              Tab(
//                icon: Icon(Icons.g_translate),
//              ),
              Tab(
                icon: Icon(Icons.location_on),
              ),
              // Tab(
              //   icon: Icon(Icons.library_books),
              // ),
            ],
          ),
        ),
        body:
//        Center(
//          child: _widgetOptions.elementAt(_selectedIndex),
//        ),
            TabBarView(
          children: [
            FirstHomePageAthkarItem(),
//            PrayerTime(),
            ListQuranPage(),
            // Azan(),
          ],
        ),
//        bottomNavigationBar: BottomNavigationBar(
//          selectedItemColor: Theme.of(context).primaryColor,
//          unselectedItemColor: Theme.of(context).secondaryHeaderColor,
//          items: [
//            BottomNavigationBarItem(
//              icon: Icon(Icons.search),
//              title: Text('Athkar'),
//            ),
//            BottomNavigationBarItem(
//              icon: Icon(Icons.star),
//              title: Text('Test'),
//            ),
//            BottomNavigationBarItem(
//              icon: Icon(Icons.home),
//              title: Text('Quraan'),
//            ),
//            BottomNavigationBarItem(
//              icon: Icon(Icons.home),
//              title: Text('Table'),
//            ),
//          ],
//          currentIndex: _selectedIndex,
//        selectedItemColor: Colors.amber[800],
//          onTap: _onItemTapped,
//        ),
      ),
    );
//    return FirstHomePageAthkarItem();
  }
}
