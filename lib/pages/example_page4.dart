import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class ExamplePage4 extends StatefulWidget {
  const ExamplePage4({Key? key}) : super(key: key);

  @override
  _ExamplePage4State createState() => _ExamplePage4State();
}

class _ExamplePage4State extends State<ExamplePage4> {
  int sectionIndex = 0;

  List<String> bodies = [
    'assets/images/work.gif',
    'assets/images/work.gif',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff040738),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          bodies[sectionIndex],
          fit: BoxFit.cover,
        ),
      ),
      bottomNavigationBar: customNavigationBar(),
    );
  }

  CurvedNavigationBar customNavigationBar() {
    return CurvedNavigationBar(
      items: const [
        Icon(Icons.work, color: Colors.white),
        Icon(Icons.person, color: Colors.white),
      ],
      index: 0,
      height: 50,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 600),
      color: const Color(0xff040936),
      backgroundColor: const Color(0xfff6f5fa),
      buttonBackgroundColor: const Color(0xff040936),
      onTap: (index) {
        setState(() {
          sectionIndex = index;
        });
      },
    );
  }
}
