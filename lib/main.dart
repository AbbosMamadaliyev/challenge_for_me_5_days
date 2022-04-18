import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home+page.dart';
import 'home_page_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => HomePageModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
