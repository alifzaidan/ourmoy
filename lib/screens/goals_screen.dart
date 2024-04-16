import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ourmoy/models/categories_model.dart';
import 'package:ourmoy/screens/addgoals_screen.dart';
import 'package:ourmoy/services/accounts_services.dart';
import 'package:ourmoy/services/goals_services.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            stretch: true,
            backgroundColor: const Color(0xFFFFFFFF),
            largeTitle: Text(
              'Goals',
              style: GoogleFonts.golosText(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            middle: Text(
              'Goals',
              style: GoogleFonts.golosText(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => const AddGoalsScreen(),
                  ),
                );
              },
              icon: const Icon(
                CupertinoIcons.add_circled_solid,
                color: Color(0xFF000000),
              ),
            ),
            alwaysShowMiddle: false,
            border: Border.all(color: Colors.transparent),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                _goals(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _goals() {
    return StreamBuilder<QuerySnapshot>(
      stream: DbGoals.getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            height: snapshot.data!.docs.length * 150.0,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 62),
            decoration: const BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: SizedBox(
              height: snapshot.data!.docs.length * 150.0,
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  DocumentSnapshot goals = snapshot.data!.docs[index];

                  final Categories categories = categoriesList.firstWhere(
                      (element) => element.name == goals.get('category'));
                  IconData icon = categories.icon;
                  for (var categories in categoriesList) {
                    if (goals.get('category') == categories.name) {
                      icon = categories.icon;
                    }
                  }

                  final formatter = NumberFormat.currency(
                    locale: 'id_ID',
                    symbol: 'Rp. ',
                  );
                  String formattedPrice = formatter.format(goals.get('price'));

                  double percentage = 0;

                  return Card(
                    color: const Color(0xFFF6F7F9),
                    margin: const EdgeInsets.only(top: 10),
                    elevation: 0,
                    child: StreamBuilder<double>(
                      stream: DbAccounts.getTotalBalance(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final formatter = NumberFormat.currency(
                            locale: 'id_ID',
                            symbol: 'Rp. ',
                          );
                          String formattedBalance =
                              formatter.format(snapshot.data as double);
                          percentage = (snapshot.data as double) /
                              double.parse(goals.get('price').toString()) *
                              100;

                          return ListTile(
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFF000000),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                icon,
                                color: const Color(0xFFFFFFFF),
                              ),
                            ),
                            title: Text(
                              goals.get('name'),
                              style: GoogleFonts.golosText(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              '$formattedBalance /\n$formattedPrice',
                              style: GoogleFonts.golosText(
                                fontSize: 14,
                                color: const Color(0xFFC2C8CF),
                              ),
                            ),
                            trailing: Text(
                              percentage >= 100
                                  ? 'Done ✅'
                                  : '${percentage.toStringAsFixed(0)}%',
                              style: GoogleFonts.golosText(
                                fontSize: 16,
                                color: (percentage >= 40)
                                    ? (percentage >= 80)
                                        ? const Color(0xFF1BC760)
                                        : const Color(0xFFE9A115)
                                    : const Color(0xFFF65454),
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        return const CircularProgressIndicator();
                      },
                    ),
                  );
                },
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Text('Error');
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
