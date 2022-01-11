import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  final Function() onTap;
  final String buttonText;
  final double? width;
  final double? height;
  final double? fontSize;

  MyCustomButton(
      {required this.buttonText,
      required this.onTap,
      this.width,
      this.height,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        width: width ?? 320.22,
        height: height ?? 43,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(2, 2))],
            color: Color(0xFF00A74C),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            buttonText,
            style: TextStyle(
                color: Colors.white,
                fontSize: fontSize ?? 16.0,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
