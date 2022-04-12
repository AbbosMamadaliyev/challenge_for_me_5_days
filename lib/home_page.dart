import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> isTap =
      List.filled(ImageModel.imageList.length, false, growable: true);
  bool tap = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xff040828),
      appBar: AppBar(
        title: const Text('day 1'),
        backgroundColor: const Color(0xff0d175c),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              itemCount: ImageModel.imageList.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      ImageModel.imageList[itemIndex].isTap =
                          !ImageModel.imageList[itemIndex].isTap;
                      tap = ImageModel.imageList[itemIndex].isTap;
                    });
                  },
                  child: Container(
                    height: size.height * 0.35,
                    width: size.width * 0.7,
                    margin: const EdgeInsets.symmetric(vertical: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: ImageModel.imageList[itemIndex].isTap
                                ? Color(0xff35c7c7)
                                : Color(0xff83cbcb),
                            spreadRadius: ImageModel.imageList[itemIndex].isTap
                                ? 1.8
                                : 0.5,
                            blurRadius: 8),
                      ],
                      border: Border.all(
                          color: ImageModel.imageList[itemIndex].isTap
                              ? const Color(0xff35c7c7)
                              : Colors.transparent,
                          width: 2),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/img${itemIndex + 1}.jpeg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Author: ${ImageModel.imageList[itemIndex].author}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Views: ${ImageModel.imageList[itemIndex].views} mln',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: size.height * 0.6,
                viewportFraction: 0.7,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
            tap
                ? TextButton(
                    onPressed: () {
                      tap = false;
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: Color(0xff0f23aa),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class ImageModel {
  final String author;
  final double views;
  bool isTap;

  ImageModel({
    required this.author,
    required this.views,
    this.isTap = false,
  });

  static List<ImageModel> imageList = [
    ImageModel(author: 'Imzaar', views: 4.2),
    ImageModel(author: 'Vitor Gusmao', views: 1.55),
    ImageModel(author: 'Francesco Ungaro', views: 1.55),
    ImageModel(author: 'Alotrobo', views: 2),
  ];
}
