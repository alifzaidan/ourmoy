import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                Text(
                  '+Rp. 2.560.000',
                  style: GoogleFonts.golosText(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1BC760),
                  ),
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
                Text(
                  '-Rp. 2.560.000',
                  style: GoogleFonts.golosText(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFF65454),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _history() {
    return Container(
      height: 500,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 16, bottom: 62),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 500,
        child: ListView.builder(
          padding: const EdgeInsets.all(0),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
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
                  child: const Icon(
                    CupertinoIcons.money_dollar,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                title: Text(
                  'Money In',
                  style: GoogleFonts.golosText(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  'Today',
                  style: GoogleFonts.golosText(
                    fontSize: 14,
                    color: const Color(0xFFC2C8CF),
                  ),
                ),
                trailing: Text(
                  '+Rp. 2.000',
                  style: GoogleFonts.golosText(
                    fontSize: 16,
                    color: const Color(0xFF1BC760),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
