import 'package:chatme/widgets/addtocartsheet_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductdetailScreenProvider with ChangeNotifier {
  //this is for slider
  final imagelist = [
    'https://www.fhinds.co.uk/Images/Product/Default/xlarge/D0828_L_1.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT_WEdO9GRsRsssrMdwLy6TkyDBj8Vr6nOWRLshnKx8DHLZ9Pyn&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT_WEdO9GRsRsssrMdwLy6TkyDBj8Vr6nOWRLshnKx8DHLZ9Pyn&usqp=CAU'
  ];
  var index = 0;

  ontap(int newindex) {
    index = newindex;
    notifyListeners();
  }

  void showsheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: AddtoCartSheet(),
          );
        },
        elevation: 8,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
        )).then((value) {
      notifyListeners();
    });
  }
}
