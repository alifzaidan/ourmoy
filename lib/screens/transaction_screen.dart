import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ourmoy/screens/transaction_expenses_screen.dart';
import 'package:ourmoy/screens/transaction_income_screen.dart';

enum Transaction { income, expenses }

Map<Transaction, Widget> transactionPage = <Transaction, Widget>{
  Transaction.income: const IncomePage(),
  Transaction.expenses: const ExpensesPage(),
};

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  Transaction _selectedSegment = Transaction.income;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            stretch: true,
            backgroundColor: const Color(0xFFFFFFFF),
            largeTitle: Text(
              'New Transaction',
              style: GoogleFonts.golosText(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            middle: Text(
              'New Transaction',
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
                _segmentedControl(),
                transactionPage[_selectedSegment]!
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _segmentedControl() {
    return Container(
      width: double.infinity,
      height: 100,
      color: const Color(0xFFFFFFFF),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CupertinoSlidingSegmentedControl<Transaction>(
        backgroundColor: const Color(0xFFF6F7F9),
        thumbColor: const Color(0xFFFCB226),
        groupValue: _selectedSegment,
        onValueChanged: (Transaction? value) {
          if (value != null) {
            setState(() {
              _selectedSegment = value;
            });
          }
        },
        children: <Transaction, Widget>{
          Transaction.income: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.arrow_down_square,
                  color: Color(0xFF000000),
                ),
                Text(
                  '  Income',
                  style: GoogleFonts.golosText(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Transaction.expenses: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  CupertinoIcons.arrow_up_square,
                  color: Color(0xFF000000),
                ),
                Text(
                  '  Expenses',
                  style: GoogleFonts.golosText(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        },
      ),
    );
  }
}
