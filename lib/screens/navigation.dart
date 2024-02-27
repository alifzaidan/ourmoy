import 'package:flutter/cupertino.dart';
import 'package:ourmoy/screens/goals_screen.dart';
import 'package:ourmoy/screens/history_screen.dart';
import 'package:ourmoy/screens/home_screen.dart';
import 'package:ourmoy/screens/settings_screen.dart';
import 'package:ourmoy/screens/transaction_screen.dart';

const page = [
  HomeScreen(),
  HistoryScreen(),
  TransactionScreen(),
  GoalsScreen(),
  SettingsScreen(),
];

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          height: 60,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house),
              activeIcon: Icon(CupertinoIcons.house_fill),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.time),
              activeIcon: Icon(CupertinoIcons.time_solid),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.plus_app),
              activeIcon: Icon(CupertinoIcons.plus_app_fill),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.lightbulb),
              activeIcon: Icon(CupertinoIcons.lightbulb_fill),
              label: 'Goals',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.gear),
              activeIcon: Icon(CupertinoIcons.gear_solid),
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
