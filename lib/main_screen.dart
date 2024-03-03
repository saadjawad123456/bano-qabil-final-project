import 'package:flutter/material.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int myIndex = 0;

  List<Widget> widgetList = const [
    Home(), //Text('Home',style: TextStyle(fontSize: 40),),
    Text(
      'Store',
      style: TextStyle(fontSize: 40),
    ),
    Text(
      'Wishlist',
      style: TextStyle(fontSize: 40),
    ),
    Text(
      'Profile',
      style: TextStyle(fontSize: 40),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetList[myIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          // showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          elevation: 10,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inbox),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monitor_heart),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ]),
    );
  }
}
