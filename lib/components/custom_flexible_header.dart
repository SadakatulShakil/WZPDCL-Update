import 'package:flutter/material.dart';

class CustomFlexibleHeader extends StatelessWidget {
  /* Icon, Text, Text or Null */

  final Widget? leftWidget;
  final String headerText;
  final double? headerTextSize;
  final Widget? rightWidget;
  final MainAxisAlignment? alignment;

  CustomFlexibleHeader(
      {this.leftWidget,
      required this.headerText,
      this.headerTextSize,
      this.rightWidget,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Container(
          margin: EdgeInsets.only(left: 5.0, right: 5.0),
          child: Row(
            mainAxisAlignment: alignment??MainAxisAlignment.spaceBetween,
            children: [
              leftWidget??Icon(
                Icons.clear,
                color: Colors.grey,
              ),
              Text(
                headerText,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: headerTextSize?? 30.0,
                  color: Color(0XFF2D3192),
                ),
              ),
              rightWidget?? Text(''),
            ],
          ),
        ),
      ),
    );
  }
}
