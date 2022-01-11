import 'package:flutter/material.dart';
import 'package:wzpdcl_app_flutter/constants.dart';
class GreenHeaderContainer extends StatelessWidget {
  // const GreenHeaderContainer({Key? key}) : super(key: key);
  String text;
  GreenHeaderContainer({required this.text});
  @override
  Widget build(BuildContext context) {
    return   Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: Container(
          width: 360.0,
          //  height: 78.0,
          height: 78.0,
          child: ClipRRect(
            borderRadius: BorderRadius.zero,
            child: Container(
              color: Color.fromARGB(255, 0, 167, 76),
              child:
              Padding(
                padding: const EdgeInsets.only(top:10,bottom: 10,left: 42,right: 42),
                child: FittedBox(
                  fit:BoxFit.contain,
                  child: Text(
//                     '''Customer No. 01866355255
// Complaint Statistics''',
                  text,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    style: kComplaintStat,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }
}
