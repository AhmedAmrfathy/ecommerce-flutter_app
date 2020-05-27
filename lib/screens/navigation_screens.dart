import 'package:chatme/providers/Navigation_screens_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class NavigationScreen extends StatelessWidget {
  static const route = 'navigationscreenroute';

  @override
  Widget build(BuildContext context) {
    final navigationprovider = Provider.of<NavigationScreenProvider>(context);
    return Scaffold(
      bottomNavigationBar: (BottomNavigationBar(
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.black54,
        elevation: 6,
        iconSize: 35,
        currentIndex: navigationprovider.indexnumber,
        onTap: navigationprovider.ontap,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text('Home')),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/category.svg',height: 35,width: 35,color: Colors.black54,),
              activeIcon:SvgPicture.asset('assets/category.svg',height: 35,width: 35,color: Colors.amber,),
              title: Text('Category')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
              ),
              title: Text('Account'))
        ],
      )),
      body: navigationprovider.pagescreen[navigationprovider.indexnumber]
          ['page'],
    );
  }
}
