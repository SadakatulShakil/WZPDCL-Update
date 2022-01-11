import 'package:flutter/material.dart';
import 'package:wzpdcl_app_flutter/constants.dart';

class TableBody extends StatelessWidget {
  final String firstNumber;
  final String secondNumber;
  final bool? last;
  TableBody({required this.firstNumber, required this.secondNumber, this.last = false});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFE1E1E1),
        ),
        borderRadius: last == true?BorderRadius.only(
            bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)):null,
      ),
      height: 40.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            firstNumber,
            style: kTableBodyTextStyle,
          ),
          Text(
            secondNumber,
            style: kTableBodyTextStyle,
          ),
        ],
      ),
    );
  }
}