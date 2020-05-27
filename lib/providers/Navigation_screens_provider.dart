import 'package:chatme/screens/acount_screens.dart';
import 'package:chatme/screens/category_screens.dart';
import 'package:chatme/screens/homepage_screens.dart';
import 'package:chatme/screens/product_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class NavigationScreenProvider with ChangeNotifier {
  int indexnumber = 0;

  void ontap(int x) {
    indexnumber = x;
    notifyListeners();
  }

  var pagescreen = [
    {'page': HomePageScreen()},
    {'page': ProductDetailScreen()},
    {'page': AcountScreens()}
  ];
}
