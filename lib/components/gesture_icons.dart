import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GestureIcons extends StatelessWidget {
  final String commonPath;
  final String svgName;
  final Function onTapIcon;

  GestureIcons(
      {required this.svgName,
      required this.commonPath,
      required this.onTapIcon, });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: SvgPicture.asset(commonPath + svgName,),
        onTap: () {

            //Navigator.push(context, MaterialPageRoute(builder: (context)=> screen));
            onTapIcon(context);
        });
  }


}

