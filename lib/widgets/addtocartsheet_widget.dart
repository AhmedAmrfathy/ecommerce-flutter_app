import 'package:auto_size_text/auto_size_text.dart';
import 'package:chatme/providers/addtocartsheet_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddtoCartSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AddtoCartSheetProvider>(context);
    final devicesize = MediaQuery.of(context).size;
    return Container(
      width: devicesize.width - 40,
      height: devicesize.height * .7,
      padding: EdgeInsets.only(top: 10, left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              width: devicesize.width - 40,
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 90,
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.black12),
                        shape: BoxShape.rectangle),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS4dufXrJZAeJcOSaUIIfwLK1JW0QBAtZZk9hztoqx_NONPEA_Y&usqp=CAU'),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(top: 5, bottom: 7),
                              width: devicesize.width - 50,
                              child: AutoSizeText(
                                'Samsung Glaxy Note 8-6.3 inch 256 gb dual sim 2 with hard ssd 1 T',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                                maxLines: 2,
                              )),
                          Expanded(
                            child: AutoSizeText(
                              '450 \$',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              width: devicesize.width - 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: devicesize.width - 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              'Color',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    state.onlickfirstbutton();
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 8),
                                    width: 80,
                                    height: 33,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.black54),
                                      borderRadius: BorderRadius.circular(17),
                                      color: state.firstbutton
                                          ? state.selectedcolorbackground
                                          : state.unselectedcolorbackground,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Red',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: state.firstbutton
                                                ? state.selectettextcolor
                                                : state.unselectettextcolor),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    state.onlicksecondbutton();
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 5),
                                    width: 80,
                                    height: 33,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.black54),
                                      borderRadius: BorderRadius.circular(17),
                                      color: state.secondbutton
                                          ? state.selectedcolorbackground
                                          : state.unselectedcolorbackground,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'blue',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: state.secondbutton
                                                ? state.selectettextcolor
                                                : state.unselectettextcolor),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: devicesize.width - 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              'Size',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    state.onclickfirstSizeButton();
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 8),
                                    width: 80,
                                    height: 33,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.black54),
                                      borderRadius: BorderRadius.circular(17),
                                      color: state.firstSizeButton
                                          ? state.selectedcolorbackground
                                          : state.unselectedcolorbackground,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'L',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: state.firstSizeButton
                                                ? state.selectettextcolor
                                                : state.unselectettextcolor),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    state.onclicksecondSizeButton();
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 5),
                                    width: 80,
                                    height: 33,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.black54),
                                      borderRadius: BorderRadius.circular(17),
                                      color: state.secondtSizeButton
                                          ? state.selectedcolorbackground
                                          : state.unselectedcolorbackground,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'XL',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: state.secondtSizeButton
                                                ? state.selectettextcolor
                                                : state.unselectettextcolor),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    state.onclickthirdSizeButton();
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 5),
                                    width: 80,
                                    height: 33,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.black54),
                                      borderRadius: BorderRadius.circular(17),
                                      color: state.thirdSizeButton
                                          ? state.selectedcolorbackground
                                          : state.unselectedcolorbackground,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'XXL',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: state.thirdSizeButton
                                                ? state.selectettextcolor
                                                : state.unselectettextcolor),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: devicesize.width - 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              'Quantaty',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            height: 30,
                            width: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                    color: Colors.blueGrey, width: 1)),
                            padding: EdgeInsets.only(left: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '+',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              left: BorderSide(width: 1),
                                              right: BorderSide(width: 1))),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text('1'),
                                      )),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('-',
                                          style: TextStyle(fontSize: 18)),
                                    ),
                                  ),
                                ),
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
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                  child: Container(
                width: devicesize.width-70,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(30)),
                    child: Align(alignment: Alignment.center,child: Text('Add To Cart',style: TextStyle(color: Colors.white,fontSize: 17),)),
              )),
            ),
          )
        ],
      ),
    );
  }
}
