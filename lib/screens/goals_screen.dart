import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            trailing: const Icon(
              CupertinoIcons.add_circled_solid,
              color: Color(0xFF000000),
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

  Container _goals() {
    return Container(
      height: 500,
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
        height: 500,
        child: ListView.builder(
          padding: const EdgeInsets.all(0),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
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
                    CupertinoIcons.device_phone_portrait,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
                title: Text(
                  'Iphone 16 Pro Max',
                  style: GoogleFonts.golosText(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  'Rp. 2.000.000 / Rp. 20.000.000',
                  style: GoogleFonts.golosText(
                    fontSize: 14,
                    color: const Color(0xFFC2C8CF),
                  ),
                ),
                trailing: Text(
                  '10%',
                  style: GoogleFonts.golosText(
                    fontSize: 16,
                    color: const Color(0xFFF65454),
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
