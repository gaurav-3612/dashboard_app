import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'responsive.dart';
import 'side_menu.dart';
import 'middle_section.dart';
import 'right_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // FIXED: Added const constructor here
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Dashboard',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SideMenu is the Drawer on Mobile
      drawer: Responsive.isDesktop(context) ? null : SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Side Menu (Only show on Desktop)
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 2, // Takes 2/12 of the screen
                child: SideMenu(),
              ),

            // 2. Middle Section (Takes remaining space on Mobile/Tablet, share with Right on Desktop)
            Expanded(
              flex: 7, // Takes 7/12 of the screen
              child: SingleChildScrollView(child: MiddleSection()),
            ),

            // 3. Right Section (Only show on Desktop and large Tablets)
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 3, // Takes 3/12 of the screen
                child: Container(
                  height: MediaQuery.of(context).size.height, // Full height
                  child: SingleChildScrollView(child: RightSection()),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
