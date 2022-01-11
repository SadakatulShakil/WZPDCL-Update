import 'package:flutter/material.dart';
import 'package:wzpdcl_app_flutter/constants.dart';
class FeederInchargeComplaintInbox extends StatefulWidget {
  const FeederInchargeComplaintInbox({Key? key}) : super(key: key);

  @override
  _FeederInchargeComplaintInboxState createState() => _FeederInchargeComplaintInboxState();
}

class _FeederInchargeComplaintInboxState extends State<FeederInchargeComplaintInbox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:6.0,left: 5,right: 5,),
          child: FittedBox(
            fit:BoxFit.contain,
            child: Container(
              width: 350.0,
             // height: 172.0,
              height: 230.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Container(
                  color: Color.fromARGB(255, 255, 255, 255),
                  child:
                  Padding(
                    padding: const EdgeInsets.only(top:4.0,left:21,right:29,bottom: 21),
                    child: Column(
                      children: [
                        FittedBox(
                          fit: BoxFit.contain,
                          child: RichText(
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.left,
                              text: const TextSpan(
                                style: kCustomerComplaintDataTable,
                                children: [
                                  TextSpan(
                                    text: '''Complaint ID''',
                                    style: kFeederComplaintDataTableLeftText,
                                  ),
                                  TextSpan(
                                    text: ''':       00001414
''',
                                  ),
                                  TextSpan(
                                    text: '''Submit Date:''',
                                    style: kFeederComplaintDataTableLeftText,
                                  ),
                                  TextSpan(
                                    text: '''        1012545421
''',
                                  ),
                                  TextSpan(
                                    text: '''Contact No:''',
                                    style: kFeederComplaintDataTableLeftText,
                                  ),
                                  TextSpan(
                                    text: '''         0177641443
''',
                                  ),
                                  TextSpan(
                                    text: '''Complaint:''',
                                    style: kFeederComplaintDataTableLeftText
                                  ),
                                  TextSpan(
                                    text: '''           Oaver Billing
''',
                                  ),
                                  TextSpan(
                                    text: '''Message:''',
                                    style: kFeederComplaintDataTableLeftText,
                                  ),
                                  TextSpan(
                                    text: '''             Over Bill Problem 500 taka
''',
                                  ),
                                  TextSpan(
                                    text: '''Fault Address:''',
                                    style: kFeederComplaintDataTableLeftText,
                                  ),
                                  TextSpan(
                                    text: '''     house: 203, Road: 10, Mujgunni R/A
''',
                                  ),
                                  // TextSpan(
                                  //   text: '''Fault Location:''',
                                  //   style: kFeederComplaintDataTableLeftText,
                                  // )

                                ],
                              ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 0.0,
                        // ),
              //          padding: const EdgeInsets.only(left:24.0,top: 0),
                        SizedBox(
                          height: 15.0,
                          child: Row(
                            children: <Widget>[
                              FittedBox(
                                fit:BoxFit.contain,
                                child: Text('''Fault Location:''',
                                  style: kFeederComplaintDataTableLeftText,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              //view map button
                              //sizedbox used here to resize
                              SizedBox(
                                height: 45,
                                width: 65,
                                child: TextButton(
                                  style:TextButton.styleFrom(
                                    padding: EdgeInsets.only(top:0),
                                  ),
                                  onPressed: () {  },
                                  child: FittedBox(
                                    fit:BoxFit.contain,
                                    child: Container(
                                      width: 46.22222137451172,
                                      height: 13.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14.444443702697754),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(14.444443702697754),
                                        child: Container(
                                          color: Color.fromARGB(255, 45, 49, 146),
                                          //text
                                           child:
                                           Text(
                                             '''View Map''',
                                             overflow: TextOverflow.visible,
                                             //textAlign: TextAlign.left,
                                             textAlign: TextAlign.center,
                                             style: TextStyle(
                                               height: 1.3602273905944218,
                                               fontSize: 7.222221851348877,
                                               fontFamily: 'Inter',
                                               fontWeight: FontWeight.w400,
                                               color: Color.fromARGB(255, 255, 255, 255),

                                               /* letterSpacing: 0.0, */
                                             ),
                                           ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              //file
                              SizedBox(
                                width: 5,
                              ),
                              Text('''File:''',
                                style: kFeederComplaintDataTableLeftText,
                              ),
                              //view file button
                          SizedBox(
                            height: 20,
                            child: TextButton(
                                style:TextButton.styleFrom(
                                  padding: EdgeInsets.all(0.0),
                                ),


                              onPressed: () {  },
                              child: FittedBox(
                                fit:BoxFit.contain,
                                child: Container(
//figma height width
                                  // width: 46.22222137451172,
                                  // height: 13.0,
                                  width: 55,
                                  height: 15.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14.444443702697754),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(14.444443702697754),
                                    child: Container(
                                      color: Color.fromARGB(255, 0, 167, 76),
                                      //text
                                      child:
                                      Text(
                                        '''View File''',
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          height: 1.3602273905944218,
                                          fontSize: 7.222221851348877,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromARGB(255, 255, 255, 255),

                                          /* letterSpacing: 0.0, */
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                              ////take action in one row
                              // SizedBox(
                              //   width:3,
                              // ),
                              // TextButton(
                              //   style:TextButton.styleFrom(
                              //     padding: EdgeInsets.all(0.0),
                              //   ),
                              //   onPressed: () {  },
                              //   child: Container(
                              //     width: 67.0,
                              //     height: 17.0,
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(5.0),
                              //     ),
                              //     child:
                              //     ClipRRect(
                              //       borderRadius: BorderRadius.circular(5.0),
                              //       child: Container(
                              //         color: Color.fromARGB(255, 229, 0, 39),
                              //         //text take action
                              //         child:
                              //         Text(
                              //           '''Take Action''',
                              //           overflow: TextOverflow.visible,
                              //           textAlign: TextAlign.center,
                              //           style: TextStyle(
                              //             height: 1.3602273887364076,
                              //             fontSize: 9.444443702697754,
                              //             fontFamily: 'Inter',
                              //             fontWeight: FontWeight.w400,
                              //             color: Color.fromARGB(255, 255, 255, 255),
                              //
                              //             /* letterSpacing: 0.0, */
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),

                            ],
                          ),
                        ),
                        //take action in nextline
                        SizedBox(
                          height: 28,
                          child: TextButton(
                                                  style:TextButton.styleFrom(
                                                    padding: EdgeInsets.only(left:250,),
                                                   alignment: Alignment(0,-0.2),
                                                  ),
                                                  onPressed: () {  },
                                                  child: FittedBox(
                                                    fit:BoxFit.contain,
                                                    child: Container(
                                                      width: 67.0,
                                                      height: 17.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(5.0),
                                                      ),
                                                      child:
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(5.0),
                                                        child: Container(
                                                          color: Color.fromARGB(255, 229, 0, 39),
                                                          //text take action
                                                          child:
                                                          Text(
                                                            '''Take Action''',
                                                            overflow: TextOverflow.visible,
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                              height: 1.3602273887364076,
                                                              fontSize: 9.444443702697754,
                                                              fontFamily: 'Inter',
                                                              fontWeight: FontWeight.w400,
                                                              color: Color.fromARGB(255, 255, 255, 255),

                                                              /* letterSpacing: 0.0, */
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                        ),
                       ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

    //////////////////////2nd Container to show datatable
//         SizedBox(
//           height: 2,
//         ),
//         Container(
//           width: 350.0,
//           height: 172.0,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(6.0),
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(6.0),
//             child: Container(
//               color: Color.fromARGB(255, 255, 255, 255),
//               child:
//               RichText(
//                 overflow: TextOverflow.visible,
//                 textAlign: TextAlign.left,
//                 text: const TextSpan(
//                   style: kCustomerComplaintDataTable,
//                   children: [
//                     TextSpan(
//                       text: '''Complaint ID''',
//                       style: kFeederComplaintDataTableLeftText,
//                     ),
//                     TextSpan(
//                       text: ''':       00001414
// ''',
//                     ),
//                     TextSpan(
//                       text: '''Submit Date:''',
//                       style: kFeederComplaintDataTableLeftText,
//                     ),
//                     TextSpan(
//                       text: '''        1012545421
// ''',
//                     ),
//                     TextSpan(
//                       text: '''Contact No:''',
//                       style: kFeederComplaintDataTableLeftText,
//                     ),
//                     TextSpan(
//                       text: '''         0177641443
// ''',
//                     ),
//                     TextSpan(
//                         text: '''Complaint:''',
//                         style: kFeederComplaintDataTableLeftText
//                     ),
//                     TextSpan(
//                       text: '''           Oaver Billing
// ''',
//                     ),
//                     TextSpan(
//                       text: '''Message:''',
//                       style: kFeederComplaintDataTableLeftText,
//                     ),
//                     TextSpan(
//                       text: '''             Over Bill Problem 500 taka
// ''',
//                     ),
//                     TextSpan(
//                       text: '''Fault Address:''',
//                       style: kFeederComplaintDataTableLeftText,
//                     ),
//                     TextSpan(
//                       text: '''     house: 203, Road: 10, Mujgunni R/A
// ''',
//                     ),
//                     TextSpan(
//                       text: '''Fault Location:''',
//                       style: kFeederComplaintDataTableLeftText,
//                     ),
//                   ],
//
//                 ),
//               ),
//             ),
//           ),
//         ),
      ],
    );
  }
}
