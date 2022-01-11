import 'package:flutter/material.dart';
import 'package:wzpdcl_app_flutter/constants.dart';
class LedgerScreen extends StatefulWidget {
  const LedgerScreen({Key? key}) : super(key: key);

  @override
  _LedgerScreenState createState() => _LedgerScreenState();
}

class _LedgerScreenState extends State<LedgerScreen> {
  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //bill ledger text
          // SizedBox(
          //   height: 8,
          // ),
          SizedBox(
            height: 30,
            child: Container(
              width: 360.0,
              color:Color.fromARGB(255, 255, 255, 255),
              child: Text(
                '''Bill Ledger of Last 12 Months''',
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.171875,
                  fontSize: 20.0,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 99, 99, 99),

                  /* letterSpacing: 0.0, */
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
          //bill data table
            width: 360.0,
            height: 81.0,
            child: ClipRRect(
              borderRadius: BorderRadius.zero,
              child: Container(
                color: Color.fromARGB(255, 255, 255, 255),
                //datatable text
                child:
                Padding(
                  //left:10 by figma
                  padding: const EdgeInsets.only(left:20.0,top: 0),
                  child: Align(
                    alignment: Alignment(0,-0.6),
                    child: Row(
                      children: [
                        RichText(
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.left,
                          text: const TextSpan(
                            style: TextStyle(
                              height: 2.0,
                              fontSize: 12.0,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 0, 0, 0),

                              /* letterSpacing: 0.0, */
                            ),
                            children: [
                              TextSpan(
                                text: '''Bill Month:''',
                                style: kFeederComplaintDataTableLeftText,
                              ),
                              TextSpan(
                                text: ''' OCT-2016
''',
                              ),
                              TextSpan(
                                text: '''Due Date:''',
                                style: kFeederComplaintDataTableLeftText,
                              ),
                              TextSpan(
                                text: ''' 28-NOV-2016
''',
                              ),
                              TextSpan(
                                text: '''Pay Date:''',
                                style: kFeederComplaintDataTableLeftText,
                              )
                            ],
                          ),
                        ),
                        //data table text for 2nd column
                        SizedBox(
                          width: 40,
                        ),
                        RichText(
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.left,
                          text: const TextSpan(
                            style: TextStyle(
                              height: 2.005000114440918,
                              fontSize: 12.0,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 0, 0, 0),

                              /* letterSpacing: 0.0, */
                            ),
                            children: [
                              TextSpan(
                                text: '''Current Bill:''',
                                style: kFeederComplaintDataTableLeftText,
                              ),
                              TextSpan(
                                text: '''         4110.7
''',
                              ),
                              TextSpan(
                                text: '''Total Bill:''',
                                style: kFeederComplaintDataTableLeftText,
                              ),
                              TextSpan(
                                text: '''              4102
''',
                              ),
                              TextSpan(
                                text: '''Paid Amount:''',
                                style: kFeederComplaintDataTableLeftText,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      );

  }
}
