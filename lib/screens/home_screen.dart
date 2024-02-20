import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: const Color(0xFFFFFFFF),
            leading: Text(
              'Total balance',
              style: GoogleFonts.golosText(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 2.5,
                color: const Color(0xFFC2C8CF),
              ),
            ),
            largeTitle: Text(
              'Rp. 2.560.000',
              style: GoogleFonts.golosText(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            middle: Text(
              'Rp. 2.560.000',
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
                _accounts(),
                _lasttransactions(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _accounts() {
    return Container(
      height: 270,
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Accounts',
                style: GoogleFonts.golosText(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Icon(
                CupertinoIcons.plus_circle_fill,
                color: Color(0xFF000000),
                size: 25,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 170,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                  width: 320,
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5478F6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Muchammad Alif Zaidan',
                        style: GoogleFonts.golosText(
                          fontSize: 18,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                      Text(
                        'Rp. 2.560.000',
                        style: GoogleFonts.golosText(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                      Text(
                        'Tidak ada tagihan yang harus dibayar',
                        style: GoogleFonts.golosText(
                          fontSize: 16,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container _lasttransactions() {
    return Container(
      height: 800,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 16, bottom: 62),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Last Transactions',
                style: GoogleFonts.golosText(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Icon(
                CupertinoIcons.arrow_up_right_circle_fill,
                color: Color(0xFF000000),
                size: 25,
              ),
            ],
          ),
          Container(
            height: 600,
            padding: const EdgeInsets.only(top: 10),
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
        ],
      ),
    );
  }
}
