import 'package:flutter/material.dart';
import 'package:wzpdcl_app_flutter/constants.dart';
// class CustomerComplaintProgress extends StatelessWidget {
//   const CustomerComplaintProgress({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
class CustomerComplaintProgress extends StatefulWidget {
  late final bool isVisible;
  //const CustomerComplaintProgress({Key? key}) : super(key: key);
  CustomerComplaintProgress({this.isVisible=false});

  @override
  _CustomerComplaintProgressState createState() => _CustomerComplaintProgressState();
}

class _CustomerComplaintProgressState extends State<CustomerComplaintProgress> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    widget.isVisible=false;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FittedBox(
          fit:BoxFit.contain,
          child: Container(
            width: 348.0,
            height: 210.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Padding(
                padding: const EdgeInsets.only(top:6.0,left: 6.0,right:6),
                child: Container(
                  color: Color.fromARGB(255, 255, 255, 255),
                  child:
                  FittedBox(
                    fit:BoxFit.contain,
                    child: Padding(
                      padding: const EdgeInsets.only(top:10,left:20,right: 16,bottom: 11),
                      child: RichText(
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.left,
                          text: const TextSpan(
                            style: kCustomerComplaintDataTable,
                            children: [
                              TextSpan(
                                text: '''Complaint ID:       00001414
Submit Date:        1012545421
Contact No:          0177641443
Complaint:            Oaver Billing
Message:              Over Bill Problem 500 taka
Fault Address:      house: 203, Road: 10, Mujgunni R/A
Fault Location:                          File:
Instructions:         ''',
                                style: TextStyle(

                                  /* letterSpacing: null, */
                                ),
                              ),
                              TextSpan(
                                text: '''Please stay at home my team coming
''',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 253, 0, 58),

                                  /* letterSpacing: null, */
                                ),
                              ),
                              TextSpan(
                                text: '''Action Taken Time: 15-03-2021  10.25 am''',
                                style: TextStyle(

                                  /* letterSpacing: null, */
                                ),
                              )
                            ],
                          ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        //////////////2nd container data table
//         SizedBox(height: 7,),
//         Container(
//           width: 348.0,
//           height: 210.0,
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
//                       text: '''Complaint ID:       00001414
// Submit Date:        1012545421
// Contact No:          0177641443
// Complaint:            Oaver Billing
// Message:              Over Bill Problem 500 taka
// Fault Address:      house: 203, Road: 10, Mujgunni R/A
// Fault Location:                          File:
// Instructions:         ''',
//                       style: TextStyle(
//
//                         /* letterSpacing: null, */
//                       ),
//                     ),
//                     TextSpan(
//                       text: '''Please stay at home my team coming
// ''',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 253, 0, 58),
//
//                         /* letterSpacing: null, */
//                       ),
//                     ),
//                     TextSpan(
//                       text: '''Action Taken Time: 15-03-2021  10.25 am''',
//                       style: TextStyle(
//
//                         /* letterSpacing: null, */
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
      ],
    );
  }
}

