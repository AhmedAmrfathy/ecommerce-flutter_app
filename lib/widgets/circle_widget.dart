import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: (BoxDecoration(
          borderRadius: BorderRadius.circular(40),color: Color.fromRGBO(200, 200, 240, .8))),
    );
  }
}
