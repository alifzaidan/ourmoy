import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ourmoy/screens/profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: const Color(0xFFFFFFFF),
            largeTitle: Text(
              'Settings',
              style: GoogleFonts.golosText(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            middle: Text(
              'Settings',
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
                Container(
                  height: 500,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(top: 16, bottom: 62),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF2684FC),
                              Color(0xFF1403DC),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF000000).withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'OURMOY',
                                  style: GoogleFonts.golosText(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFFFFFFFF),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Sedikit-sedikit \nlama-lama menjadi bukit 😁',
                                  style: GoogleFonts.golosText(
                                    fontSize: 14,
                                    color: const Color(0xFFFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                            Image.asset(
                              'assets/images/logo_ourmoy.png',
                              width: 80,
                              height: 80,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      CupertinoListTile(
                        title: const Text('Profile'),
                        leading: const Icon(
                          CupertinoIcons.person_fill,
                          color: Color(0xFF000000),
                        ),
                        trailing: const CupertinoListTileChevron(),
                        onTap: () => Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) => const ProfileScreen(),
                          ),
                        ),
                      ),
                      const Divider(),
                      const CupertinoListTile(
                        title: Text('Share'),
                        leading: Icon(
                          CupertinoIcons.arrowshape_turn_up_right_fill,
                          color: Color(0xFF000000),
                        ),
                        additionalInfo: Text('Not available'),
                      ),
                      const Divider(),
                      const CupertinoListTile(
                        title: Text('Theme'),
                        leading: Icon(
                          CupertinoIcons.lightbulb_fill,
                          color: Color(0xFF000000),
                        ),
                        additionalInfo: Text('Not available'),
                      ),
                      const Divider(),
                      const CupertinoListTile(
                        title: Text('Delete Data'),
                        leading: Icon(
                          CupertinoIcons.trash_fill,
                          color: Color(0xFF000000),
                        ),
                        additionalInfo: Text('Not available'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
