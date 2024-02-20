import 'package:flutter/cupertino.dart';
import 'package:ourmoy/screens/goals_screen.dart';
import 'package:ourmoy/screens/history_screen.dart';
import 'package:ourmoy/screens/navigation.dart';
import 'package:ourmoy/screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Ourmoy',
      theme: const CupertinoThemeData(
        primaryColor: Color(0xFF2684FC),
        scaffoldBackgroundColor: Color(0xFFF2F2F7),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Navigation(),
        '/history': (context) => const HistoryScreen(),
        '/goals': (context) => const GoalsScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
