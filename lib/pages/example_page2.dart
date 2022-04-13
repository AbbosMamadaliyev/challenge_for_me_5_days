import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class ExamplePage2 extends StatefulWidget {
  const ExamplePage2({Key? key}) : super(key: key);

  @override
  _ExamplePage2State createState() => _ExamplePage2State();
}

class _ExamplePage2State extends State<ExamplePage2> {
  int initialIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff02072a),
      ),
      body: Center(
        child: Text(
          bodyText[initialIndex],
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: initialIndex,
        style: TabStyle.flip,
        backgroundColor: const Color(0xff02072a),
        color: Colors.white,
        onTap: (int i) {
          setState(() {
            initialIndex = i;
          });
        },
      ),
    );
  }

  List<String> bodyText = [
    'Home',
    'Discovery',
    'Add',
    'Message',
    'Profile',
  ];
}
