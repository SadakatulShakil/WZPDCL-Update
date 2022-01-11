import 'package:flutter/material.dart';
import 'package:wzpdcl_app_flutter/constants.dart';
class TabBarContainer extends StatelessWidget {
 final Color color;
 final String text;
  // const TabBarContainer({Key? key}) : super(key: key);
  TabBarContainer({required this.color,required this.text});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 115.0,
      height: 47.0,
      child: ClipRRect(
        borderRadius: BorderRadius.zero,
        child: Container(
         // color: Color.fromARGB(255, 249, 156, 47),
          color:color,
          child:
          Padding(
            padding: const EdgeInsets.only(top:6),
            child: Text(
              '''Submission 
3''',
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              style:  kCustomerComplaintTabBarText,
            ),
          ),
        ),
      ),
    );
  }
}
