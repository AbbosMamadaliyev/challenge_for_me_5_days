import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:provider/provider.dart';

import 'home_page_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomePageModel>();

    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            pages: pages,
            initialPage: model.initialIndex,
            onPageChangeCallback: model.onChangePage,
            slideIconWidget: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.white,
                ),
                Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.white,
                ),
              ],
            ),
            positionSlideIcon: 0.85,
          ),
        ],
      ),
    );
  }

  List<Widget> pages = [
    FullContainer(
      color: Colors.redAccent,
      text: 'Welcome to Picasso!',
    ),
    FullContainer(
      color: Colors.deepPurple,
      text: 'More Street arts',
    ),
    FullContainer(
      color: Colors.greenAccent,
      text: 'More photos',
    ),
    FullContainer(
      color: Colors.deepOrangeAccent,
      text: 'More painting',
    ),
  ];
}

class FullContainer extends StatelessWidget {
  final String text;
  final Color color;
  const FullContainer({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      color: color,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Image.asset(
              'assets/images/png1.png',
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 200,
              width: 250,
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                  fontSize: 28,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomDotWidget(index: 0),
                CustomDotWidget(index: 1),
                CustomDotWidget(index: 2),
                CustomDotWidget(index: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDotWidget extends StatelessWidget {
  final int index;
  const CustomDotWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final initialIndex = context.watch<HomePageModel>().initialIndex;

    return AnimatedContainer(
      height: 6,
      width: initialIndex == index ? 20 : 6,
      margin: const EdgeInsets.only(bottom: 30, right: 4),
      decoration: BoxDecoration(
        color: initialIndex == index ? Colors.white : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      duration: const Duration(milliseconds: 200),
    );
  }
}
