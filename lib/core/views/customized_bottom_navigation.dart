import 'package:flutter/material.dart';
import 'package:quiz_u/app/home/views/home_view.dart';
import 'package:quiz_u/app/leaderboard/views/leaderboard_view.dart';
import 'package:quiz_u/app/profile/views/profile_view.dart';

class CustomizedBottomNavigation extends StatefulWidget {
  const CustomizedBottomNavigation({Key? key}) : super(key: key);

  @override
  State<CustomizedBottomNavigation> createState() => _CustomizedBottomNavigationState();
}

class _CustomizedBottomNavigationState extends State<CustomizedBottomNavigation> {
  int currentIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    LeaderboardView(),
    ProfileView(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Quiz U',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
            Icon(
              Icons.timelapse_rounded,
              size: 35,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: _widgetOptions.elementAt(currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 15.0,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        iconSize: 30,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 18,
        unselectedFontSize: 15,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.leaderboard,
            ),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
