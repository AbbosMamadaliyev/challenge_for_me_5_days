import 'package:flutter/cupertino.dart';

class HomePageModel extends ChangeNotifier {
  int initialIndex = 0;

  void onChangePage(int index) {
    initialIndex = index;
    notifyListeners();
  }
}
