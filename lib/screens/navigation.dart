import 'package:flutter/cupertino.dart';
import 'package:ourmoy/screens/goals_screen.dart';
import 'package:ourmoy/screens/history_screen.dart';
import 'package:ourmoy/screens/home_screen.dart';
import 'package:ourmoy/screens/settings_screen.dart';

const page = [
  HomeScreen(),
  HistoryScreen(),
  HistoryScreen(),
  GoalsScreen(),
  SettingsScreen(),
];

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.time),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.plus),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.lightbulb),
              label: 'Goals',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              label: 'Settings',
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              return page[index];
            },
          );
        });
  }
}
