import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:chatme/providers/cart_screen_provider.dart';
import 'package:chatme/widgets/badge.dart';
import 'package:chatme/widgets/circle_widget.dart';
import 'package:chatme/widgets/feature_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ProductDetailScreent extends StatelessWidget {
  static const route = 'productdetail';

  @override
  Widget build(BuildContext context) {
    final devicesize = MediaQuery.of(context).size;
    ScreenUtil.init(context,
        width: devicesize.width,
        height: devicesize.height,
        allowFontScaling: false);
    return Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              width: devicesize.width,
              height: devicesize.height,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: ScreenUtil().setWidth(30),
                                    height: ScreenUtil().setHeight(30),
                                    margin: EdgeInsets.only(left: 10),
                                    child: Stack(
                                      children: <Widget>[
                                        Circle(),
                                        Positioned(
                                          child: Icon(Icons.arrow_back_ios),
                                          top: ScreenUtil().setWidth(2),
                                        )
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Consumer<CartScreenProvider>(
                                    builder: (ctx, data, fixedwidget) => Badge(
                                      child: fixedwidget,
                                      value: '2',
                                    ),
                                    child: Container(
                                        width: 30,
                                        height: 30,
                                        margin: EdgeInsets.only(top: 7, left: 12),
                                        child: SvgPicture.asset(
                                            'assets/supermarket.svg')),
                                  ),
                                  Container(
                                    width: ScreenUtil().setWidth(30),
                                    height: ScreenUtil().setHeight(30),
                                    margin: EdgeInsets.symmetric(horizontal: 15),
                                    child: Stack(
                                      children: <Widget>[
                                        Circle(),
                                        Positioned(
                                          child: Icon(Icons.favorite_border),
                                          top: ScreenUtil().setWidth(2),
                                          bottom: ScreenUtil().setWidth(2),
                                          left: ScreenUtil().setWidth(2),
                                          right: ScreenUtil().setWidth(2),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 4,
                              child: Container(
                                color: Colors.white,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: devicesize.width,
                                      height: 220,
                                      padding: EdgeInsets.only(
                                          bottom: ScreenUtil().setWidth(20)),
                                      child: Carousel(
                                        images: [
                                          Image.network(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRJPRoxxSBVKMLJIUf2XT9sfhPZj8hLmLCFJUO38Uu0hsJqKeDp&usqp=CAU',
                                          ),
                                          Image.network(
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRJPRoxxSBVKMLJIUf2XT9sfhPZj8hLmLCFJUO38Uu0hsJqKeDp&usqp=CAU'),
                                          Image.network(
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRJPRoxxSBVKMLJIUf2XT9sfhPZj8hLmLCFJUO38Uu0hsJqKeDp&usqp=CAU'),
                                        ],
                                        dotBgColor:
                                        Color.fromRGBO(255, 255, 255, .2),
                                        dotColor: Colors.grey,
                                        dotIncreasedColor: Colors.orangeAccent,
                                        boxFit: BoxFit.fill,
                                      ),
                                    ),
                                    Container(
                                      height: .3,
                                      width: devicesize.width,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              )),
                          Expanded(
                            flex: 2,
                            child: Container(
                              color: Colors.white,
                              width: devicesize.width,
                              padding: EdgeInsets.only(left: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  AutoSizeText(
                                    '450 \$',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: ScreenUtil().setSp(19),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: AutoSizeText(
                                      'All Price include vart',
                                      style: TextStyle(
                                          color: Colors.lightBlue,
                                          fontSize: ScreenUtil().setSp(15)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: ScreenUtil().setHeight(6),
                                  ),
                                  Container(
                                    width: devicesize.width - 110,
                                    child: AutoSizeText(
                                      'Samsung Glaxy Note 8-6.3 inch 256 gb dual sim 2 with hard ssd 1 T ',
                                      maxLines: 2,
                                    ),
                                  ),
                                  Container(
                                    width: ScreenUtil().setWidth(100),
                                    height: ScreenUtil().setHeight(30),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          size: 20,
                                          color: Colors.orange,
                                        ),
                                        Icon(Icons.star,
                                            size: 20, color: Colors.orange),
                                        Icon(
                                          Icons.star,
                                          size: 20,
                                          color: Colors.orange,
                                        ),
                                        Icon(
                                          Icons.star_border,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                        Icon(
                                          Icons.star_border,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            leading: Text(
                              'Features',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            leading: Container(
                                width: 40,
                                height: 40,
                                child: FeatureWidget(
                                    Color.fromRGBO(255, 204, 153, .7),
                                    Icons.shopping_cart,
                                    Colors.orange)),
                            title: Text(
                              'Free Shopping',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            leading: Container(
                                width: 40,
                                height: 40,
                                child: FeatureWidget(
                                    Color.fromRGBO(204, 255, 204, .8),
                                    Icons.shop,
                                    Color.fromRGBO(0, 204, 102, .4))),
                            title: Text(
                              'Easy Return',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            leading: Container(
                                width: 40,
                                height: 40,
                                child: FeatureWidget(
                                    Color.fromRGBO(204, 229, 255, 1),
                                    Icons.update,
                                    Color.fromRGBO(51, 153, 255, 1))),
                            title: Text(
                              '1 Year Wrranty',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ), // SizedBox(height: 10,),
            Container(
              width: devicesize.width,
              height: devicesize.height,
              margin: EdgeInsets.only(top: 10),
              color: Colors.blue,
              child: Column(

                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Description',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
