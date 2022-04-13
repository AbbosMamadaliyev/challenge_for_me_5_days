import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ExamplePage3 extends StatefulWidget {
  const ExamplePage3({Key? key}) : super(key: key);

  @override
  _ExamplePage3State createState() => _ExamplePage3State();
}

class _ExamplePage3State extends State<ExamplePage3> {
  int initialIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff050d34),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          bodies[initialIndex],
          fit: BoxFit.cover,
        ),
      ),
      bottomNavigationBar: GNav(
          selectedIndex: initialIndex,
          onTabChange: (index) {
            setState(() {
              initialIndex = index;
            });
          },
          tabBorderRadius: 22,
          tabActiveBorder: Border.all(color: Colors.white, width: 1),
          backgroundColor: const Color(0xff050d34),
          curve: Curves.fastOutSlowIn,
          color: Colors.white,
          duration: const Duration(milliseconds: 300),
          gap: 8,
          activeColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          tabMargin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.favorite_outline,
              text: 'Likes',
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            )
          ]),
    );
  }

  List<String> bodies = [
    'assets/images/home.gif',
    'assets/images/like.gif',
    'assets/images/search.gif',
    'assets/images/profile.gif',
  ];
}
