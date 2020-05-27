import 'package:flutter/material.dart';

class FeatureWidget extends StatelessWidget {
  final Color squarecolor;
  final Color iconcolor;
  final IconData icon;

  FeatureWidget(this.squarecolor, this.icon,this.iconcolor);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: squarecolor,
      shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(5)),
      elevation: 6,
      child: Align(
        alignment: Alignment.center,
        child: Icon(icon,color:iconcolor,),
      ),
    );
  }
}
