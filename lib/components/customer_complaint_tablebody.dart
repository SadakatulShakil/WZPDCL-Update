import 'package:flutter/material.dart';
import 'package:wzpdcl_app_flutter/constants.dart';

class ComplaintTableBody extends StatelessWidget {
  final String id;
  ComplaintTableBody({required this.id,});


  @override
  Widget build(BuildContext context) {
    return Container(
      height:348,
      width:165,
      margin: EdgeInsets.only(left:6,top:252,),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFE1E1E1),
        ),
       // borderRadius: //last == true?
        // BorderRadius.only(

       //   bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)):null,
      ),
    //  height: 40.0,
    //  width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Complaint Id:',
            style: kComplaintTableBody,
          ),
          Text(
            '1234',
            style: kComplaintTableBody,
          ),
        ],
      ),
    );
  }
}