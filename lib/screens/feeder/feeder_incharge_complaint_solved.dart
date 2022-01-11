import 'package:flutter/material.dart';
import 'package:wzpdcl_app_flutter/constants.dart';
class FeederInchargeComplaintSolved extends StatefulWidget {
  const FeederInchargeComplaintSolved({Key? key}) : super(key: key);

  @override
  _FeederInchargeComplaintSolvedState createState() => _FeederInchargeComplaintSolvedState();
}

class _FeederInchargeComplaintSolvedState extends State<FeederInchargeComplaintSolved> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:8.0,right: 5,left: 5),
          child: Container(
            width: 350.0,
            height: 187.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Container(
                color: Color.fromARGB(255, 255, 255, 255),
                child:
//datatable text
                FittedBox(
                  fit: BoxFit.contain,
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 21.0,top:10.0),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: RichText(
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.left,
                                text: const TextSpan(
                                  style:kCustomerComplaintDataTable,
                                  children: [
                                    TextSpan(
                                      text: '''Complaint ID:''',
                                      style: kFeederComplaintDataTableLeftText,
                                    ),
                                    TextSpan(
                                      text: '''       00001414
''',
                                      style: TextStyle(

                                        /* letterSpacing: null, */
                                      ),
                                    ),
                                    TextSpan(
                                      text: '''Submit Date: ''',
                                      style: kFeederComplaintDataTableLeftText,
                                    ),
                                    TextSpan(
                                      text: '''       1012545421
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
                                      style: kFeederComplaintDataTableLeftText,
                                    ),
                                    TextSpan(
                                      text: '''              Over Bill Problem 500 taka
''',
                                      style: TextStyle(

                                        /* letterSpacing: null, */
                                      ),
                                    ),
                                    TextSpan(
                                      text: '''Feeder Name:''',
                                      style: kFeederComplaintDataTableLeftText,
                                    ),
                                    TextSpan(
                                      text: '''       Mujgunni R/A
''',
                                      style: TextStyle(

                                        /* letterSpacing: null, */
                                      ),
                                    ),
                                    TextSpan(
                                      text: '''Solved Time:''',
                                      style: kFeederComplaintDataTableLeftText,
                                    ),
                                    TextSpan(
                                      text: '''         25/03/2021 12:30
''',
                                      style: TextStyle(

                                        /* letterSpacing: null, */
                                      ),
                                    ),
                                    TextSpan(
                                      text: '''Customer Feedback:''',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromARGB(255, 0, 167, 76),

                                        /* letterSpacing: null, */
                                      ),
                                    ),
                                    TextSpan(
                                      text: ''' Satisfactory
''',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 167, 76),

                                        /* letterSpacing: null, */
                                      ),
                                    )
                                  ],
                                ),
                            ),
                          ),
                        ),
                      //date time text
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Padding(
                            padding: const EdgeInsets.only(top:12.0,right:8.0),
                            child: SizedBox(
                              height:200,
                              child: Text(
                              ''' 25/03/2021 09:25''',
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                              height: 1.3602272669474285,
                              fontSize: 12.0,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 0, 0, 0),

                              /* letterSpacing: 0.0, */
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
//         //2nd container data table
//         SizedBox(
//           height: 2,
//         ),
//         Container(
//           width: 350.0,
//           height: 187.0,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(6.0),
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(6.0),
//             child: Container(
//               color: Color.fromARGB(255, 255, 255, 255),
//               child:
// //datatable text
//               Padding(
//                 padding: const EdgeInsets.only(left: 21.0,top: 7),
//                 child: RichText(
//                   overflow: TextOverflow.visible,
//                   textAlign: TextAlign.left,
//                   text: const TextSpan(
//                     style:kCustomerComplaintDataTable,
//                     children: [
//                       TextSpan(
//                         text: '''Complaint ID:''',
//                         style: kFeederComplaintDataTableLeftText,
//                       ),
//                       TextSpan(
//                         text: '''       00001414
// ''',
//                         style: TextStyle(
//
//                           /* letterSpacing: null, */
//                         ),
//                       ),
//                       TextSpan(
//                         text: '''Submit Date: ''',
//                         style: kFeederComplaintDataTableLeftText,
//                       ),
//                       TextSpan(
//                         text: '''       1012545421
// ''',
//                         style: TextStyle(
//
//                           /* letterSpacing: null, */
//                         ),
//                       ),
//                       TextSpan(
//                         text: '''Contact No:''',
//                         style: kFeederComplaintDataTableLeftText,
//                       ),
//                       TextSpan(
//                         text: '''          0177641443
// ''',
//                         style: TextStyle(
//
//                           /* letterSpacing: null, */
//                         ),
//                       ),
//                       TextSpan(
//                         text: '''Complaint:''',
//                         style: kFeederComplaintDataTableLeftText,
//                       ),
//                       TextSpan(
//                         text: '''            Oaver Billing
// ''',
//                         style: TextStyle(
//
//                           /* letterSpacing: null, */
//                         ),
//                       ),
//                       TextSpan(
//                         text: '''Message:''',
//                         style: kFeederComplaintDataTableLeftText,
//                       ),
//                       TextSpan(
//                         text: '''              Over Bill Problem 500 taka
// ''',
//                         style: TextStyle(
//
//                           /* letterSpacing: null, */
//                         ),
//                       ),
//                       TextSpan(
//                         text: '''Feeder Name:''',
//                         style: kFeederComplaintDataTableLeftText,
//                       ),
//                       TextSpan(
//                         text: '''       Mujgunni R/A
// ''',
//                         style: TextStyle(
//
//                           /* letterSpacing: null, */
//                         ),
//                       ),
//                       TextSpan(
//                         text: '''Solved Time:''',
//                         style: kFeederComplaintDataTableLeftText,
//                       ),
//                       TextSpan(
//                         text: '''         25/03/2021 12:30
// ''',
//                         style: TextStyle(
//
//                           /* letterSpacing: null, */
//                         ),
//                       ),
//                       TextSpan(
//                         text: '''Customer Feedback:''',
//                         style: TextStyle(
//                           fontFamily: 'Inter',
//                           fontWeight: FontWeight.w500,
//                           color: Color.fromARGB(255, 0, 167, 76),
//
//                           /* letterSpacing: null, */
//                         ),
//                       ),
//                       TextSpan(
//                         text: ''' Satisfactory
// ''',
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 0, 167, 76),
//
//                           /* letterSpacing: null, */
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
      ],
    );
  }
}
