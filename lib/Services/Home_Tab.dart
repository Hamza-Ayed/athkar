import 'package:flutter/material.dart';

class BottomNavgationBarHome extends StatelessWidget {
  const BottomNavgationBarHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0, // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.mail),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        )
      ],
    );
  }
}
