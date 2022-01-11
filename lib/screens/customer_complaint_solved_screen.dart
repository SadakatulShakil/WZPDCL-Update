import 'package:flutter/material.dart';
import 'package:wzpdcl_app_flutter/components/custom_button.dart';
import 'package:wzpdcl_app_flutter/constants.dart';
// class CustomerComplaintSolved extends StatelessWidget {
//   const CustomerComplaintSolved({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
class CustomerComplaintSolved extends StatefulWidget {
 // const CustomerComplaintSolved({Key? key}) : super(key: key);
  final bool isVisible;
  CustomerComplaintSolved({this.isVisible=false});
  @override
  _CustomerComplaintSolvedState createState() => _CustomerComplaintSolvedState();
}

class _CustomerComplaintSolvedState extends State<CustomerComplaintSolved> {
  @override
  Widget build(BuildContext context) {
    //from customer complaint progress screen
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FittedBox(
          fit:BoxFit.contain,
          child: SizedBox(
            height: 290,
            child: Container(
              width: 348.0,
              height: 210.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: FittedBox(
                  fit:BoxFit.contain,
                  child: Padding(
                    padding: const EdgeInsets.only(top:6.0,left:5.0,right:4),
                    child: Container(
                      color: Color.fromARGB(255, 255, 255, 255),
                      child:
                      Padding(
                        padding: const EdgeInsets.only(top:10,left:21,right: 17,bottom:66),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RichText(
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
                                    text: '''Solved Time:        15-03-2021  10.25 am''',
                                    style: TextStyle(

                                      /* letterSpacing: null, */
                                    ),
                                  )
                                ],
                              ),
                            ),
                            /////FeedBack button
                          SizedBox(
                            height: 13,
                          ),
                        FittedBox(
                          fit:BoxFit.contain,
                            child: MyCustomButton(buttonText: 'Feedback',onTap: (){})),
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
 //   solved screen
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         FittedBox(
//           fit:BoxFit.contain,
//           child: Padding(
//             padding: const EdgeInsets.only(top:6.0,left: 6.0,right:6),
//             child: Container(
//               width: 348.0,
//               height: 210.0,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(6.0),
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(6.0),
//                 child: Container(
//                   color: Color.fromARGB(255, 255, 255, 255),
//                   child:
//                   Padding(
//                     padding: const EdgeInsets.only(top:10,left:20,right: 16,bottom: 11),
//                     child: FittedBox(
//                       fit:BoxFit.contain,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           FittedBox(
//                             fit:BoxFit.contain,
//                             child: Text(
//                               '''Complaint ID:       00001414
// Submit Date:        1012545421
// Contact No:          0177641443
// Complaint:            Oaver Billing
// Message:              Over Bill Problem 500 taka
// Fault Address:      house: 203, Road: 10, Mujgunni R/A
//     ''',
//                               style: kCustomerComplaintDataTable,
//                               textAlign: TextAlign.left,
//                               overflow: TextOverflow.visible,
//                             ),
//                           ),
// //                           RichText(
// //                             overflow: TextOverflow.visible,
// //                             textAlign: TextAlign.left,
// //                             text: const TextSpan(
// //                               style: kCustomerComplaintDataTable,
// //                               children: [
// //                                 TextSpan(
// //                                   text: '''Complaint ID:       00001414
// // Submit Date:        1012545421
// // Contact No:          0177641443
// // Complaint:            Oaver Billing
// // Message:              Over Bill Problem 500 taka
// // Fault Address:      house: 203, Road: 10, Mujgunni R/A
// //     ''',
// //                                   style: TextStyle(
// //                                       // Fault Location:                          File:
// //                                       // Instructions:
// //
// //                                     /* letterSpacing: null, */
// //                                   ),
// //                                 ),
//     Row(
//       children: [
//         FittedBox(
//             fit:BoxFit.contain,
//             child: Text('''Fault Location:   ''',
//             style: kCustomerComplaintDataTable,
//             textAlign: TextAlign.left,
//             ),
//         ),
//     //view map button
//     //sizedbox used here to resize
//     SizedBox(
//     height:25,
//     width: 65,
//     child: TextButton(
//     style:TextButton.styleFrom(
//     padding: EdgeInsets.only(top:0),
//     ),
//     onPressed: () {  },
//     child: FittedBox(
//     fit:BoxFit.contain,
//     child: Container(
//     width: 46.22222137451172,
//     height: 13.0,
//     decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(14.444443702697754),
//     ),
//     child: ClipRRect(
//     borderRadius: BorderRadius.circular(14.444443702697754),
//     child: Container(
//     color: Color.fromARGB(255, 45, 49, 146),
//     //text
//     child:
//     Text(
//     '''View Map''',
//     overflow: TextOverflow.visible,
//     //textAlign: TextAlign.left,
//     textAlign: TextAlign.center,
//     style: TextStyle(
//     height: 1.3602273905944218,
//     fontSize: 7.222221851348877,
//     fontFamily: 'Inter',
//     fontWeight: FontWeight.w400,
//     color: Color.fromARGB(255, 255, 255, 255),
//
//     /* letterSpacing: 0.0, */
//     ),
//     ),
//     ),
//     ),
//     ),
//     ),
//     ),
//     ),
//         //file
//         SizedBox(
//             width: 10,
//         ),
//         Text('''File:''',
//             style: kCustomerComplaintDataTable,
//         ),
//         //view file button
//         SizedBox(
//             height: 20,
//             child: TextButton(
//               style:TextButton.styleFrom(
//                 padding: EdgeInsets.all(0.0),
//               ),
//
//
//               onPressed: () {  },
//               child: FittedBox(
//                 fit:BoxFit.contain,
//                 child: Container(
// //figma height width
// //                 width: 46.22222137451172,
// //                 height: 13.0,
//                 width: 55,
//                 height: 15.0,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(14.444443702697754),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(14.444443702697754),
//                   child: Container(
//                     color: Color.fromARGB(255, 0, 167, 76),
//                     //text
//                     child:
//                     Text(
//                       '''View File''',
//                       overflow: TextOverflow.visible,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         height: 1.3602273905944218,
//                         fontSize: 7.222221851348877,
//                         fontFamily: 'Inter',
//                         fontWeight: FontWeight.w400,
//                         color: Color.fromARGB(255, 255, 255, 255),
//
//                         /* letterSpacing: 0.0, */
//                       ),
//                     ),
//                   ),
//                 ),
//                 ),
//               ),
//             ),
//         ),
//     ],
//     ),
//                             FittedBox(
//                               fit:BoxFit.contain,
//                               child: SizedBox(
//                                 height: 50,
//                                 child: RichText(
//                                 overflow: TextOverflow.visible,
//                                 textAlign: TextAlign.left,
//                                 text: const TextSpan(
//                                   style: kCustomerComplaintDataTable,
//                                   children: [
//                                     TextSpan(
//                                       text: '''Instructions:''',
//                                       style: TextStyle(
//                                       ),
//                                     ),
//                                     TextSpan(
//                                       text: '''          ''',
//                                       style: TextStyle(
//
//                                         /* letterSpacing: null, */
//                                       ),
//                                     ),
//                                     TextSpan(
//                                       text: '''Please stay at home my team coming
// ''',
//                                       style: TextStyle(
//                                         color: Color.fromARGB(255, 253, 0, 58),
//
//                                         /* letterSpacing: null, */
//                                       ),
//                                     ),
//                                     TextSpan(
//                                       text: '''Solved Time:''',
//                                       style: TextStyle(
//
//                                         /* letterSpacing: null, */
//                                       ),
//                                     ),
//                                     TextSpan(
//                                       text: '''         ''',
//                                       style: TextStyle(
//
//                                         /* letterSpacing: null, */
//                                       ),
//                                     ),
//                                         TextSpan(
//                                         text: '''15-03-2021  10.25 am''',
//                                           style: TextStyle(
//                                         ),
//                                 ),
//                                   ],
//                                 ),
//                           ),
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
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
  /////
  //     ],
  //   );
  }
}
