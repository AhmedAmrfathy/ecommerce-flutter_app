import 'package:chatme/providers/addtocartsheet_provider.dart';
import 'package:chatme/providers/auth_screens_provider.dart';
import 'package:chatme/providers/cart_screen_provider.dart';
import 'package:chatme/providers/Navigation_screens_provider.dart';
import 'package:chatme/providers/productdetail_screens_provider.dart';
import 'package:chatme/screens/acount_screens.dart';
import 'package:chatme/screens/auth_screens.dart';
import 'package:chatme/screens/category_screens.dart';
import 'package:chatme/screens/homepage_screens.dart';
import 'package:chatme/screens/navigation_screens.dart';
import 'package:chatme/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './screens/homepage_screens.dart';
import './providers/userauth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: User()),
        ChangeNotifierProvider.value(value: AuthScreenProvider()),
        ChangeNotifierProvider.value(value: CartScreenProvider()),
        ChangeNotifierProvider.value(value: NavigationScreenProvider()),
        ChangeNotifierProvider.value(value: ProductdetailScreenProvider()),
        ChangeNotifierProvider.value(value: AddtoCartSheetProvider())
      ],
      child: Consumer<User>(
        builder: (_, cos, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primaryColor: Color.fromRGBO(0, 102, 204, 1),
            ),
            home: FutureBuilder(
              future: cos.read(),
              builder: (ctx, snapshotdata) {
                if (snapshotdata.data == '') {
                  return AuthScreen();
                } else {
                  return NavigationScreen();
                }
              },
            ),
            // AuthScreen(),
            routes: {
              ProductDetailScreen.route: (ctx) => ProductDetailScreen(),
              NavigationScreen.route: (ctx) => NavigationScreen(),
              HomePageScreen.route: (ctx) => HomePageScreen(),
              CategoryScreens.categoryroute: (ctx) => CategoryScreens(),
              AcountScreens.acountroute: (ctx) => AcountScreens()
            },
          );
        },
      ),
    );
  }
}
