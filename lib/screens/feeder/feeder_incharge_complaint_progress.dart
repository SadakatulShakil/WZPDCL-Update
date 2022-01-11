import 'package:flutter/material.dart';
import 'package:wzpdcl_app_flutter/constants.dart';
class FeederInchargeComplaintProgress extends StatefulWidget {
  const FeederInchargeComplaintProgress({Key? key}) : super(key: key);

  @override
  _FeederInchargeComplaintProgressState createState() => _FeederInchargeComplaintProgressState();
}

class _FeederInchargeComplaintProgressState extends State<FeederInchargeComplaintProgress> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0,right: 5,left: 5),
      child: Container(
        width: 350.0,
        height: 192.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          child: Container(
            color: Color.fromARGB(255, 255, 255, 255),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FittedBox(
                  fit:BoxFit.contain,
                  child: Padding(
                    padding: const EdgeInsets.only(top:7.0,right:4,left:21),
                    child: RichText(
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.left,
                        text: const TextSpan(
                          style: kCustomerComplaintDataTable,
                          children: [
                            TextSpan(
                              text: '''Complaint ID:''',
                              style: kFeederComplaintDataTableLeftText,
                            ),
                            TextSpan(
                              text: '''        00001414
''',
                              style: TextStyle(

                                /* letterSpacing: null, */
                              ),
                            ),
                            TextSpan(
                              text: '''Submit Date:''',
                              style:
                                kFeederComplaintDataTableLeftText,
                                /* letterSpacing: null, */
                            ),
                            TextSpan(
                              text: '''         1012545421
''',
                              style: TextStyle(

                                /* letterSpacing: null, */
                              ),
                            ),
                            TextSpan(
                              text: '''Contact No:''',
                              style: kFeederComplaintDataTableLeftText,
                            ),
                            TextSpan(
                              text: '''          0177641443
''',
                              style: TextStyle(

                                /* letterSpacing: null, */
                              ),
                            ),
                            TextSpan(
                              text: '''Complaint:''',
                              style: kFeederComplaintDataTableLeftText,
                            ),
                            TextSpan(
                              text: '''            Oaver Billing
''',
                              style: TextStyle(

                                /* letterSpacing: null, */
                              ),
                            ),
                            TextSpan(
                              text: '''Message:''',
                              style:kFeederComplaintDataTableLeftText,
                            ),
                            TextSpan(
                              text: '''              Over Bill Problem 500 taka
''',
                              style: TextStyle(

                                /* letterSpacing: null, */
                              ),
                            ),
                            TextSpan(
                              text: '''Fault Address:''',
                              style:kFeederComplaintDataTableLeftText,
                            ),
                            TextSpan(
                              text: '''      house: 203, Road: 10, Mujgunni R/A
''',
                              style: TextStyle(

                                /* letterSpacing: null, */
                              ),
                            ),
                            TextSpan(
                              text: '''Instructions:''',
                              style: kFeederComplaintDataTableLeftText,
                            ),
                            TextSpan(
                              text: '''         ''',
                              style: TextStyle(

                                /* letterSpacing: null, */
                              ),
                            ),
                            TextSpan(
                              text: '''Please stay at home my team coming
''',
                              style: TextStyle(
                                color: Color.fromARGB(255, 233, 45, 45),

                                /* letterSpacing: null, */
                              ),
                            )
                          ],
                        )),
                  ),
                ),
                //////solved like button
            FittedBox(
              fit:BoxFit.contain,
              child: Container(
                width: 348.0,
                //figma height 25
                height: 25.0,
               // height: 35.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                    bottomRight: Radius.circular(6.0),
                    bottomLeft: Radius.circular(6.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                    bottomRight: Radius.circular(6.0),
                    bottomLeft: Radius.circular(6.0),
                  ),
                  child: Container(
                    color: Color.fromARGB(255, 0, 167, 76),
                    //text
                    child:
                    Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                     // textBaseline:TextBaseline.ideographic ,
                      children: [
                        Text(
                          '''Solved''',
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            height: 1.3602272669474285,
                            //figma fontsize 12
                            fontSize:12.0,
                           // fontSize: 14.0,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 255, 255, 255),
                            /* letterSpacing: 0.0, */
                          ),
                        ),
                        Icon(
                          Icons.thumb_up_off_alt_outlined,
                          //color: Color(0xFFFFFF),
                          color: Colors.white,
                          size: 20.0,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
                SizedBox(height:6,),
              ],
            ),
          ),
        ),
      ),
    );
    /////2nd container data table
    Container(
    width: 350.0,
    height: 192.0,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(6.0),
    ),
    child: ClipRRect(
    borderRadius: BorderRadius.circular(6.0),
    child: Container(
    color: Color.fromARGB(255, 255, 255, 255),
    child:
    Column(
    children: [
    RichText(
    overflow: TextOverflow.visible,
    textAlign: TextAlign.left,
    text: const TextSpan(
    style: TextStyle(
    height: 1.75,
    fontSize: 12.0,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: Color.fromARGB(255, 0, 0, 0),

    /* letterSpacing: 0.0, */
    ),
    children: [
    TextSpan(
    text: '''Complaint ID:''',
    style: TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,

    /* letterSpacing: null, */
    ),
    ),
    TextSpan(
    text: '''        00001414
''',
    style: TextStyle(

    /* letterSpacing: null, */
    ),
    ),
    TextSpan(
    text: '''Submit Date:''',
    style: TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,

    /* letterSpacing: null, */
    ),
    ),
    TextSpan(
    text: '''         1012545421
''',
    style: TextStyle(

    /* letterSpacing: null, */
    ),
    ),
    TextSpan(
    text: '''Contact No:''',
    style: TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,

    /* letterSpacing: null, */
    ),
    ),
    TextSpan(
    text: '''          0177641443
''',
    style: TextStyle(

    /* letterSpacing: null, */
    ),
    ),
    TextSpan(
    text: '''Complaint:''',
    style: TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,

    /* letterSpacing: null, */
    ),
    ),
    TextSpan(
    text: '''            Oaver Billing
''',
    style: TextStyle(

    /* letterSpacing: null, */
    ),
    ),
    TextSpan(
    text: '''Message:''',
    style: TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,

    /* letterSpacing: null, */
    ),
    ),
    TextSpan(
    text: '''              Over Bill Problem 500 taka
''',
    style: TextStyle(

    /* letterSpacing: null, */
    ),
    ),
    TextSpan(
    text: '''Fault Address:''',
    style: TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,

    /* letterSpacing: null, */
    ),
    ),
    TextSpan(
    text: '''      house: 203, Road: 10, Mujgunni R/A
''',
    style: TextStyle(

    /* letterSpacing: null, */
    ),
    ),
    TextSpan(
    text: '''Instructions:''',
    style: TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,

    /* letterSpacing: null, */
    ),
    ),
    TextSpan(
    text: '''         ''',
    style: TextStyle(

    /* letterSpacing: null, */
    ),
    ),
    TextSpan(
    text: '''Please stay at home my team coming
''',
    style: TextStyle(
    color: Color.fromARGB(255, 233, 45, 45),

    /* letterSpacing: null, */
    ),
    )
    ],
    )),
    //////solved like button
    Container(
    width: 348.0,
    //figma height 25
    //  height: 25.0,
    height: 35.0,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(0.0),
    topRight: Radius.circular(0.0),
    bottomRight: Radius.circular(6.0),
    bottomLeft: Radius.circular(6.0),
    ),
    ),
    child: ClipRRect(
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(0.0),
    topRight: Radius.circular(0.0),
    bottomRight: Radius.circular(6.0),
    bottomLeft: Radius.circular(6.0),
    ),
    child: Container(
    color: Color.fromARGB(255, 0, 167, 76),
    //text
    child:
    Row(
    //crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    // textBaseline:TextBaseline.ideographic ,
    children: [
    Text(
    '''Solved''',
    overflow: TextOverflow.visible,
    textAlign: TextAlign.left,
    style: TextStyle(
    height: 1.3602272669474285,
    //figma fontsize 12
    //fontsize:12.0
    fontSize: 14.0,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    color: Color.fromARGB(255, 255, 255, 255),
    /* letterSpacing: 0.0, */
    ),
    ),
    Icon(
    Icons.thumb_up_off_alt_outlined,
    //color: Color(0xFFFFFF),
    color: Colors.white,
    ),

    ],
    ),
    ),
    ),
    ),
    SizedBox(height:6,),
    ],
    ),
    ),
    ),
    );
  }
}
