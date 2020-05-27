import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalListviewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Stack(
                children: <Widget>[
                  Image.network(
                    'https://media.extra.com/i/aurora/100041557_100_01?w=400&h=400&img404=missing_product&v=false',
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      top: 1,
                      right: 1,
                      child: Container(
                        width: 27,
                        height: 27,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: 27,
                              height: 27,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: .5),
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromRGBO(200, 200, 240, .8),
                              ),
                            ),
                            Center(
                              child: Icon(
                                Icons.favorite_border,
                                size: 20,
                                color: Color.fromRGBO(20, 20, 20, .7),
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
            Container(
              width: 140,
              height: 58,
              margin: EdgeInsets.only(top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AutoSizeText('I phone X with camera 65 mg and 128gb',maxLines:2,style: TextStyle(fontSize: 16),),
                  AutoSizeText('45\,00\$',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
