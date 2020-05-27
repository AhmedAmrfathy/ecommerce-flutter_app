import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chatme/providers/cart_screen_provider.dart';
import 'package:chatme/providers/productdetail_screens_provider.dart';
import 'package:chatme/widgets/badge.dart';
import 'package:chatme/widgets/circle_widget.dart';
import 'package:chatme/widgets/feature_widget.dart';
import 'package:chatme/widgets/horizontallistview_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const route = 'productdetail';

  List<T> map<T>(List list, Function function) {
    List<T> result = [];
    for (int i = 0; i < list.length; i++) {
      result.add(function(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final devicesize = MediaQuery.of(context).size;
    ScreenUtil.init(context,
        width: devicesize.width,
        height: devicesize.height,
        allowFontScaling: false);
    final productdetscrprovider=Provider.of<ProductdetailScreenProvider>(context);
    return Scaffold(
        body: Container(
          color: Colors.grey,
          child: ListView(
            children: <Widget>[
              Container(
                width: devicesize.width,
                height: devicesize.height,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.white,
                        child: LayoutBuilder(
                          builder: (ctx, constraint) {
                            return Column(
                              children: <Widget>[
                                Container(
                                  width: devicesize.width,
                                  height: constraint.maxHeight * .20,
                                  color: Colors.white,
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: ScreenUtil().setWidth(30),
                                        height: ScreenUtil().setHeight(30),
                                        margin: EdgeInsets.only(left: 10),
                                        child: Stack(
                                          children: <Widget>[
                                            Circle(),
                                            Positioned(
                                              child: IconButton(icon:Icon(Icons.arrow_back_ios),onPressed:(){
                                                productdetscrprovider.showsheet(context);
                                              },),
                                              top: ScreenUtil().setWidth(2),
                                            )
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Consumer<CartScreenProvider>(
                                        builder: (ctx, data, fixedwidget) =>
                                            Badge(
                                          child: fixedwidget,
                                          value: '2',
                                        ),
                                        child: Container(
                                            width: 30,
                                            height: 30,
                                            margin: EdgeInsets.only(
                                                top: 7, left: 12),
                                            child: SvgPicture.asset(
                                                'assets/supermarket.svg')),
                                      ),
                                      Container(
                                        width: ScreenUtil().setWidth(30),
                                        height: ScreenUtil().setHeight(30),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Stack(
                                          children: <Widget>[
                                            Circle(),
                                            Positioned(
                                              child:
                                                  Icon(Icons.favorite_border),
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
                                Consumer<ProductdetailScreenProvider>(
                                  builder: (ctx, data, child) {
                                    return Column(
                                      children: <Widget>[
                                        CarouselSlider(
                                          height: constraint.maxHeight * .7,
                                          initialPage: data.index,
                                          onPageChanged: (newindex) {
                                            data.ontap(newindex);
                                          },
                                          autoPlay: true,
                                          autoPlayInterval:
                                              Duration(seconds: 2),
                                          autoPlayAnimationDuration:
                                              Duration(milliseconds: 2000),
                                          items: data.imagelist.map((imgurl) {
                                            return Builder(
                                              builder: (BuildContext context) {
                                                return Container(
                                                  width: devicesize.width,
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  child: Image.network(
                                                    imgurl,
                                                    fit: BoxFit.fill,
                                                  ),
                                                );
                                              },
                                            );
                                          }).toList(),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 1),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: map(data.imagelist,
                                                (index, url) {
                                              return Container(
                                                width: data.index == index
                                                    ? 20
                                                    : 9,
                                                height: 9,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 8, horizontal: 5),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: data.index == index
                                                        ? Colors.deepOrange
                                                        : Colors.grey),
                                              );
                                            }),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: devicesize.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Divider(
                              height: 1,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.white,
                                width: devicesize.width,
                                padding: EdgeInsets.only(left: 15, top: 15),
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
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Text(
                                        'Features',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: ListTile(
                                        leading: Container(
                                            width: 35,
                                            height: 35,
                                            child: FeatureWidget(
                                                Color.fromRGBO(
                                                    255, 204, 153, .7),
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
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: ListTile(
                                        leading: Container(
                                            width: 35,
                                            height: 35,
                                            child: FeatureWidget(
                                                Color.fromRGBO(
                                                    204, 255, 204, .8),
                                                Icons.shop,
                                                Color.fromRGBO(
                                                    0, 204, 102, .4))),
                                        title: Text(
                                          'Easy Return',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: ListTile(
                                        leading: Container(
                                            width: 35,
                                            height: 35,
                                            child: FeatureWidget(
                                                Color.fromRGBO(
                                                    204, 229, 255, 1),
                                                Icons.update,
                                                Color.fromRGBO(
                                                    51, 153, 255, 1))),
                                        title: Text(
                                          '1 Year Wrranty',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.white,
                        width: devicesize.width,
                        padding: EdgeInsets.only(top: 19, left: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                width: devicesize.width - 40,
                                child: AutoSizeText(
                                  'Alternatively, your editor might support flutter pub get. Check the docs for your editor to learn more with mre than camera 15 anh for weddings and Check the docs for your editor to learn more with mre than camera 15 anh for weddings andCheck the docs for your editor to learn more with mre than camera 15 anh for weddings andCheck the docs for your editor to learn more with mre than camera 15 anh for weddings andCheck the docs for your editor to learn more with mre than camera 15 anh for weddings and',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  maxLines: 4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: devicesize.width,
                height: devicesize.height,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: devicesize.width,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(15)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.network(
                            'https://www.fhinds.co.uk/Images/Product/Default/xlarge/D0828_L_1.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: devicesize.width,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: devicesize.width,
                              height: 35,
                              child: Text(
                                'Reviews',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: devicesize.width,
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        width: devicesize.width,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                'Ahmed Amr',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.star,
                                                    size: 20,
                                                    color: Colors.orange,
                                                  ),
                                                  Icon(Icons.star,
                                                      size: 20,
                                                      color: Colors.orange),
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
                                            ),
                                            Expanded(
                                              child: Text(
                                                'The product works well',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      height: 10,
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: devicesize.width,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                'Ibrahim sid',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.star,
                                                    size: 20,
                                                    color: Colors.orange,
                                                  ),
                                                  Icon(Icons.star,
                                                      size: 20,
                                                      color: Colors.orange),
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
                                            ),
                                            Expanded(
                                              child: Text(
                                                'really very bad product',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: devicesize.width,
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            width: 140,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.black12),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: InkWell(
                                                child:
                                                    AutoSizeText('View more'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(left: 10, top: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                flex: 1,
                                //margin: EdgeInsets.only(bottom: 12),
                                child: Text(
                                  'Recomended',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 17,
                                      color: Colors.black),
                                ),
                              ),
                              Flexible(
                                  flex: 7,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 12),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (ctx, index) =>
                                          HorizontalListviewWidget(),
                                      itemCount: 19,
                                    ),
                                  )),
                            ],
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
