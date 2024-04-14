import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ourmoy/models/categories_model.dart';
import 'package:ourmoy/services/transactions_services.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            stretch: true,
            backgroundColor: const Color(0xFFFFFFFF),
            largeTitle: Text(
              'History',
              style: GoogleFonts.golosText(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            middle: Text(
              'History',
              style: GoogleFonts.golosText(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            alwaysShowMiddle: false,
            border: Border.all(color: Colors.transparent),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                _statistics(context),
                _history(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _statistics(BuildContext context) {
    return Container(
      height: 160,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2 - 30,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F7F9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.arrow_down_square,
                      color: Color(0xFF000000),
                    ),
                    Text(
                      '  Income',
                      style: GoogleFonts.golosText(
                        fontSize: 18,
                        color: const Color(0xFFAAAAAA),
                      ),
                    ),
                  ],
                ),
                StreamBuilder<double>(
                  stream: DbTransactions.getTotalIncome(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final formatter = NumberFormat.currency(
                          locale: 'id_ID', symbol: '+Rp. ');
                      String formattedBalance =
                          formatter.format(snapshot.data as double);
                      return Text(
                        formattedBalance,
                        style: GoogleFonts.golosText(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1BC760),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2 - 30,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F7F9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.arrow_up_square,
                      color: Color(0xFF000000),
                    ),
                    Text(
                      '  Expense',
                      style: GoogleFonts.golosText(
                        fontSize: 18,
                        color: const Color(0xFFAAAAAA),
                      ),
                    ),
                  ],
                ),
                StreamBuilder<double>(
                  stream: DbTransactions.getTotalExpenses(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final formatter = NumberFormat.currency(
                          locale: 'id_ID', symbol: '+Rp. ');
                      String formattedBalance =
                          formatter.format(snapshot.data as double);
                      return Text(
                        formattedBalance,
                        style: GoogleFonts.golosText(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFF65454),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _history() {
    return StreamBuilder<QuerySnapshot>(
      stream: DbTransactions.getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            height: snapshot.data!.docs.length * 100,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 16, bottom: 74),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SizedBox(
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  DocumentSnapshot transactions = snapshot.data!.docs[index];

                  final Categories categories = categoriesList.firstWhere(
                      (element) =>
                          element.name == transactions.get('category'));
                  IconData icon = categories.icon;
                  for (var categories in categoriesList) {
                    if (transactions.get('category') == categories.name) {
                      icon = categories.icon;
                    }
                  }

                  final formatter = NumberFormat.currency(
                    locale: 'id_ID',
                    symbol: (transactions.get('category') == 'Income')
                        ? '+Rp. '
                        : '-Rp. ',
                  );
                  String formattedBalance =
                      formatter.format(transactions.get('nominal'));

                  DateTime now = DateTime.now();
                  DateTime dateTime =
                      DateTime.parse(transactions.get('datetime'));
                  String formattedDate = '';
                  if (dateTime.year == now.year &&
                      dateTime.month == now.month &&
                      dateTime.day == now.day) {
                    formattedDate = 'Today';
                  } else {
                    DateTime yesterday = now.subtract(const Duration(days: 1));
                    if (dateTime.year == yesterday.year &&
                        dateTime.month == yesterday.month &&
                        dateTime.day == yesterday.day) {
                      formattedDate = 'Yesterday';
                    } else {
                      formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
                    }
                  }

                  return Card(
                    color: const Color(0xFFF6F7F9),
                    margin: const EdgeInsets.only(top: 10),
                    elevation: 0,
                    child: ListTile(
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
                        transactions.get('description'),
                        style: GoogleFonts.golosText(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        formattedDate,
                        style: GoogleFonts.golosText(
                          fontSize: 14,
                          color: const Color(0xFFC2C8CF),
                        ),
                      ),
                      trailing: Text(
                        formattedBalance,
                        style: GoogleFonts.golosText(
                          fontSize: 16,
                          color: (transactions.get('category') == 'Income')
                              ? const Color(0xFF1BC760)
                              : const Color(0xFFF65454),
                        ),
                      ),
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
