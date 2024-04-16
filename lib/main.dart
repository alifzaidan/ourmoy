import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:ourmoy/firebase_options.dart';
import 'package:ourmoy/screens/addgoals_screen.dart';
import 'package:ourmoy/screens/goals_screen.dart';
import 'package:ourmoy/screens/history_screen.dart';
import 'package:ourmoy/screens/navigation.dart';
import 'package:ourmoy/screens/profile_screen.dart';
import 'package:ourmoy/screens/settings_screen.dart';
import 'package:ourmoy/screens/test_screen.dart';
import 'package:ourmoy/screens/transaction_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        '/transaction': (context) => const TransactionScreen(),
        '/goals': (context) => const GoalsScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/addgoals': (context) => const AddGoalsScreen(),
        '/test': (context) => const TestScreen(),
      },
    );
  }
}
