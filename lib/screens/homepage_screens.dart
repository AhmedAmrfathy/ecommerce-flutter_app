import 'package:carousel_pro/carousel_pro.dart';
import 'package:chatme/providers/cart_screen_provider.dart';
import 'package:chatme/providers/Navigation_screens_provider.dart';
import 'package:chatme/widgets/badge.dart';
import 'package:chatme/widgets/horizontallistview_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatelessWidget {
  static const route = 'homepageroute';
  @override
  Widget build(BuildContext context) {
    final devicesize = MediaQuery.of(context).size;
    ScreenUtil.init(context, width: devicesize.width, height: devicesize.height, allowFontScaling: false);
    return Scaffold(
        body: Container(
          width: devicesize.width,
          height: devicesize.height,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: devicesize.width,
                  height: devicesize.height * .14,
                  decoration: BoxDecoration(
                    border: Border.all(width: .2),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 17),
                        width: devicesize.width - 60,
                        height: devicesize.height * .06,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: .7),
                            borderRadius: BorderRadius.circular(24)),
                        child: (Row(
                          children: <Widget>[
                            Flexible(
                              child: Container(
                                margin: EdgeInsets.only(left: 14, right: 7),
                                child: Icon(
                                  Icons.search,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Flexible(
                              child: TextField(
                                decoration: InputDecoration(
                                    labelText: 'Search',
                                    labelStyle: TextStyle(
                                      fontSize: 18,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ),
                            ),
                          ],
                        )),
                      ),
                      Flexible(
                          child: Consumer<CartScreenProvider>(
                        builder: (ctx, data, fixedwidget) => Badge(
                          child: fixedwidget,
                          value: '2',
                        ),
                        child: Container(
                          width: 30,
                          height: 30,
                          margin: EdgeInsets.only(top: 7, left: 12),
                          child: SvgPicture.asset('assets/supermarket.svg')
                        ),
                      ))
                    ],
                  ),
                ),
                Container(
                  width: devicesize.width,
                  height: devicesize.height - (devicesize.height * .14)-70,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height:ScreenUtil().setHeight(150),
                          margin: EdgeInsets.only(top: 10, bottom: 5),
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: Carousel(
                            images: [
                              NetworkImage(
                                  'https://www.supermama.me/system/App/Entities/Article/images/000/100/398/watermarked/%D9%85%D8%AD%D9%84%D8%A7%D8%AA-%D8%A3%D8%AD%D8%B0%D9%8A%D8%A9-%D9%86%D8%B3%D8%A7%D8%A6%D9%8A%D8%A9.jpg'),
                              NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS-j0yBHURExrb0d18fSE3Nwcc01hFZbpsesdbyhSDEa9Smunng'),
                              NetworkImage(
                                  'https://www.sayidaty.net/sites/default/files/styles/800x510/public/2018/11/08/4449426-1352504760.jpg'),
                            ],
                            boxFit: BoxFit.fill,
                            borderRadius: true,
                            radius: Radius.circular(13),
                          ),
                        ),
                        Container(
                          height: ScreenUtil().setHeight(260),
                          padding: EdgeInsets.only(left: 18, top: 18),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Flexible(
                                     flex:1,
                                      //margin: EdgeInsets.only(bottom: 12),
                                      child: Text(
                                        'New arrivals',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 17,
                                            color: Colors.black),
                                      ),
                                    ),
                                    Flexible(
                                        flex:7,
                                        child: Container(
                                          margin:EdgeInsets.only(top: 12),
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (ctx, index) =>
                                                HorizontalListviewWidget(),
                                            itemCount: 19,
                                          ),
                                        )),
                                  ],
                              ),
                        ),
                        Container(
                          height:ScreenUtil().setHeight(260),
                          padding: EdgeInsets.only(left: 18, top: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                flex:1,
                                //margin: EdgeInsets.only(bottom: 12),
                                child: Text(
                                  'New arrivals',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 17,
                                      color: Colors.black),
                                ),
                              ),
                              Flexible(
                                  flex:7,
                                  child: Container(
                                    margin:EdgeInsets.only(top: 12),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (ctx, index) =>
                                          HorizontalListviewWidget(),
                                      itemCount: 19,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          height: ScreenUtil().setHeight(260),
                          padding: EdgeInsets.only(left: 18, top: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                flex:1,
                                //margin: EdgeInsets.only(bottom: 12),
                                child: Text(
                                  'New arrivals',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 17,
                                      color: Colors.black),
                                ),
                              ),
                              Flexible(
                                  flex:7,
                                  child: Container(
                                    margin:EdgeInsets.only(top: 12),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (ctx, index) =>
                                          HorizontalListviewWidget(),
                                      itemCount: 19,
                                    ),
                                  )),
                            ],
                          ),
                        ),




                       ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
