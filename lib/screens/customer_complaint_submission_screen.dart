import 'package:flutter/material.dart';
import 'package:wzpdcl_app_flutter/components/mycustom_appbar.dart';
import 'package:wzpdcl_app_flutter/components/network_helper_get.dart';
import 'package:wzpdcl_app_flutter/components/new_connection_status&payment_tablebody.dart';
import 'package:wzpdcl_app_flutter/components/customer_complaint_tablebody.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:wzpdcl_app_flutter/components/ticketAPI.dart';
import 'package:wzpdcl_app_flutter/figma_widgets/GeneratedRectangle14Widget10.dart';
import'package:wzpdcl_app_flutter/figma_widgets/GeneratedRectangle3Widget12.dart';
import 'package:wzpdcl_app_flutter/figma_widgets/GeneratedRectangle14Widget10.dart';
import 'package:wzpdcl_app_flutter/generatedCustomerComplaintWidget1/GeneratedRectangle13Widget18.dart';
import 'package:wzpdcl_app_flutter/generatedCustomerComplaintWidget1/GeneratedRectangle14Widget18.dart';
import 'package:wzpdcl_app_flutter/generatedCustomerComplaintWidget1/GeneratedRectangle3Widget20.dart';
import 'package:wzpdcl_app_flutter/generatedCustomerComplaintWidget1/GeneratedSignUphereWidget19.dart';
import 'package:wzpdcl_app_flutter/generatedCustomerComplaintWidget1/GeneratedCustomerComplimentWidget19.dart';
import 'package:wzpdcl_app_flutter/figma_widgets/GeneratedRectangle13Widget10.dart';
import 'package:wzpdcl_app_flutter/figma_widgets/GeneratedSignUphereWidget11.dart';

import '../constants.dart';

// class CustomerComplaintSubmissionless extends StatelessWidget {
//    CustomerComplaintSubmissionless({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context)

  //{
// //     return Container(
// // //      child: Column(
// // //        mainAxisAlignment: MainAxisAlignment.start,
// // //       crossAxisAlignment: CrossAxisAlignment.stretch,
// // //       children: [
// // //        Row(
// // //
// // //          children: [
// // //            Text('Complaint ID: '),
// // //            Text('0000141  '),
// // //            SizedBox(width: 10.0,),
// // //          ],
// // //        ),
// // //         Row(
// // //           children: [
// // //             Text('Submit Date:  '),
// // //             Text('25/03/2021   '),
// // //           ],
// // //         ),
// // //         Row(
// // //           children: [
// // //             Text('Contact No:  '),
// // //             Text('0177641443  '),
// // //           ],
// // //         ),
// // //         Row(
// // //           children: [
// // //             Text('Complaint: '),
// // //             Text('Oaver Billing Complaint  '),
// // //           ],
// // //         ),
// // //         Row(
// // //           children: [
// // //             Text('Message:  '),
// // //             Text('Over Bill Problem 500 taka   '),
// // //           ],
// // //         ),
// // //         Row(
// // //           children: [
// // //             Text('Fault Address:   '),
// // //             Text('house: 203, Road: 10, Mujgunni R/A   '),
// // //           ],
// // //         ),
// // //         Row(
// // //           children: [
// // //             Text('Fault Location:   '),
// // //             Text('0000141  '),
// // //           ],
// // //         ),
// // //       ],
// // //
// // //       ),
// // //     );
// // //   }
// // // }
// //
// //
// //
// //       /// Flutter code sample for Table
// //
// // // This sample shows a `Table` with borders, multiple types of column widths and different vertical cell alignments.
//     return Scaffold(
//
//     //  appBar: MyCustomAppBar(context: context,),
//       body: Column(
//         children: [
//           //green container positioned middle
//           Container(
//             height: 78,
//             width: 360,
//             margin: EdgeInsets.only(top:52),
//             color: Color(0xFF00A74C),
//             child: Column(
//             children: [
//             /*  Container(
//                 height:48 ,
//                 width: 276,
//                 margin: EdgeInsets.only(top:72,left:42),
//                 color: Color(0xFF00A74C),*/
//               Text('Customer No. 01866355255 Complaint Statistics',textAlign: TextAlign.center,
//               style: kCustomerComplaintStatistics,),
//
//             ],
//             ),
//           ),
//           Container(
//             child: Column(
//               children: [
//                 Row(
//                  children:[
//                    Text('Complaint ID: '),
//                   Text('0000141  '),
//                   ]
//                 ),
//       Row(
//             children: <Widget>[
//               Text('Contact No: '),
//               Text('0177641443   '),
//              ],
//            ),
//       Row(
//             children: <Widget>[
//               Text('Complaint:  '),
//               Text('Oaver Billing Complaint   '),
//
//             ],
//           ),
//               ],
//             ),
//           )
//         ],
//       ),
//       );
//
//
//   }
// }
//        body: Table(
//         border: TableBorder.all(width:0.0,color: Colors.white),
//         columnWidths: const <int, TableColumnWidth>{
//         },
//         defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//        defaultColumnWidth: FlexColumnWidth(5.0),
//
//
//         children: <TableRow>[
//           TableRow(
//             children: <Widget>[
//               Text('Complaint ID: '),
//               Text('0000141  '),
//               // TableCell(
//               //  // verticalAlignment: TableCellVerticalAlignment.top,
//               //   child: Container(
//               //
//               //   ),
//               // ),
//               // Container(
//               //
//               // ),
//             ],
//           ),
//           TableRow(
//             // decoration: const BoxDecoration(
//             //
//             // ),
//             children: <Widget>[
//               Text('Submit Date:  '),
//              Text('25/03/2021   '),
//               // Container(
//               //   height: 32,
//               //   color: Colors.yellow,
//               // ),
//               // Center(
//               //   child: Container(
//               //
//               //   ),
//               // ),
//             ],
//           ),
//      TableRow(
//          children: <Widget>[
//          Text('Complaint ID: '),
//      Text('0000141  '),
//
//          ],
//      ),
//           TableRow(
//             children: <Widget>[
//               Text('Complaint ID: '),
//               Text('0000141  '),
//
//             ],
//           ),
//           TableRow(
//             children: <Widget>[
//               Text('Contact No: '),
//               Text('0177641443   '),
//
//             ],
//           ),
//           TableRow(
//             children: <Widget>[
//               Text('Complaint:  '),
//               Text('Oaver Billing Complaint   '),
//
//             ],
//           ),
//           TableRow(
//             children: <Widget>[
//               Text('Message:  '),
//               Text('Over Bill Problem 500 taka   '),
//
//             ],
//           ),
//           TableRow(
//             children: <Widget>[
//               Text('Fault Address:   '),
//               Text('house: 203, Road: 10, Mujgunni R/A    '),
//
//             ],
//           ),
//           TableRow(
//             children: <Widget>[
//               Text('Fault Location:   '),
//               Text('house: 203, Road: 10, Mujgunni R/A    '),
//
//             ],
//           ),
//      ],
//
//      ),
//             );
//
//  }
//
//
// }
  ////////////////////////////////////////////////////////
// class ComplaintSubmission extends StatefulWidget {
//   const ComplaintSubmission({Key? key}) : super(key: key);
//
//   @override
//   _ComplaintSubmissionState createState() => _ComplaintSubmissionState();
// }
//
// class _ComplaintSubmissionState extends State<ComplaintSubmission> {
//   int scrollCount = 1;
//   List<Widget> complaintSubmission = [];
//   Container tableHead = Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
//       color: Color(0xFFE1E1E1),
//     ),
//     height: 40.0,
//     width: double.infinity,
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Text(
//           'Mobile Number',
//           style: kTableHeadTextStyle,
//         ),
//         Text(
//           'Tracking Number',
//           style: kTableHeadTextStyle,
//         ),
//       ],
//     ),
//   );
//
//   void getTrackingNumbers() async {
//     GetNetworkHelper helper = GetNetworkHelper(
//         url: 'http://103.204.81.62:8081/westzone_ticket_api/index.php'
//     );
//     var data = await helper.getData();
//     print(data['data']);
//     if (data['data'].length > 0) {
//       int i = 0;
//       complaintSubmission.add(tableHead);
//       for (var info in data['data']) {
//         String trackNumber = info['Tracking']; //data[0].Tracking
//         if (i == data['data'].length - 1) {
//           TableBody body = TableBody(
//             firstNumber: _mobileNumber!,
//             secondNumber: trackNumber,
//             last: true,);
//           complaintSubmission.add(body);
//         } else {
//           TableBody body = TableBody(
//               firstNumber: _mobileNumber!, secondNumber: trackNumber);
//           complaintSubmission.add(body);
//         }
//         i++;
//       }
//     }
//   }
//       @override
//       Widget build(BuildContext context) {
//         return Container();
//       }
//
//
// }
///////////////////////from figma{
//   {
//     return Container(
//       width: 360.0,
//       height: 640.0,
//       child: ClipRRect(
//         borderRadius: BorderRadius.zero,
//         child: Container(
//           color: Color.fromARGB(255, 246, 246, 246),
//         ),
//       ),
//     );
//   }
// }
 /* {
 return Material(
child: ClipRRect(
borderRadius: BorderRadius.zero,
child: Container(
width: 360.0,
height: 640.0,
child: Stack(
fit: StackFit.expand,
alignment: Alignment.center,
//overflow: Overflow.visible,
children: [
ClipRRect(
borderRadius: BorderRadius.zero,
child: Container(
color: Color.fromARGB(255, 255, 255, 255),
),
),
Positioned(
left: 0.0,
top: 0.0,
right: null,
bottom: null,
width: 360.0,
height: 640.0,
child: GeneratedRectangle14Widget10(),
),
],
),
),
),
);
  }
}*/
/*
Positioned(
left: 0.0,
top: 0.0,
right: null,
bottom: null,
width: 360.0,
height: 640.0,
child: GeneratedRectangle13Widget10(),
),
Positioned(
left: 0.0,
top: 0.0,
right: null,
bottom: null,
width: 360.0,
height: 640.0,
child: GeneratedRectangle3Widget12(),
),
Positioned(
left: 71.0,
top: 768.0,
right: null,
bottom: null,
width: 91.0,
height: 19.0,
child: GeneratedSignUphereWidget11(),
),
Positioned(
left: 42.0,
top: 850.0,
right: null,
bottom: null,
width: 156.0,
height: 19.0,
child: GeneratedCustomerComplimentWidget11(),
),
Positioned(
left: 77.0,
top: 791.0,
right: null,
bottom: null,
width: 50.0,
height: 19.0,
child: GeneratedBillPayWidget11(),
),
Positioned(
left: 189.0,
top: 768.0,
right: null,
bottom: null,
width: 45.0,
height: 19.0,
child: GeneratedLoginWidget20(),
),
Positioned(
left: 159.0,
top: 221.0,
right: null,
bottom: null,
width: 48.0,
height: 24.0,
child: GeneratedShowWidget23(),
),
Positioned(
left: 65.0,
top: 443.0,
right: null,
bottom: null,
width: 45.0,
height: 24.0,
child: GeneratedRightWidget16(),
),
Positioned(
left: 291.0,
top: 120.0,
right: null,
bottom: null,
width: 48.0,
height: 24.0,
child: GeneratedShowWidget24(),
),
Positioned(
left: 6.0,
top: 598.0,
right: null,
bottom: null,
width: 348.0,
height: 138.0,
child: GeneratedGroup261Widget(),
),
Positioned(
left: 0.0,
top: 607.0,
right: null,
bottom: null,
width: 360.0,
height: 33.0,
child: GeneratedBackgroundWidget15(),
),
Positioned(
left: 105.0,
top: 613.0,
right: null,
bottom: null,
width: 149.65757751464844,
height: 22.77370834350586,
child: GeneratedGroup22Widget12(),
),
Positioned(
left: 0.0,
top: 52.0,
right: null,
bottom: null,
width: 360.0,
height: 78.0,
child: GeneratedGroup242Widget(),
),
Positioned(
left: 0.0,
top: 130.0,
right: null,
bottom: null,
width: 360.0,
height: 37.0,
child: GeneratedRectangle20Widget1(),
),
Positioned(
left: 42.0,
top: 72.0,
right: null,
bottom: null,
width: 278.0,
height: 50.0,
child:
GeneratedCustomerNo01866355255ComplaintStatisticsWidget(),
),
Positioned(
left: 0.0,
top: 195.0,
right: null,
bottom: null,
width: 360.0,
height: 47.0,
child: GeneratedGroup344Widget(),
),
Positioned(
left: 6.0,
top: 252.0,
right: null,
bottom: null,
width: 348.0,
height: 165.0,
child: GeneratedRectangle15Widget7(),
),
Positioned(
left: 26.0,
top: 262.0,
right: null,
bottom: null,
width: 305.0,
height: 170.0,
child:
GeneratedComplaintID0000141SubmitDate25032021ContactNo01776414431(),
),
Positioned(
left: 125.0,
top: 393.0,
right: null,
bottom: null,
width: 63.0,
height: 13.0,
child: GeneratedGroup99Widget1(),
),
Positioned(
left: 226.0,
top: 393.0,
right: null,
bottom: null,
width: 63.0,
height: 13.0,
child: GeneratedGroup346Widget(),
),
Positioned(
left: 6.0,
top: 426.0,
right: null,
bottom: null,
width: 348.0,
height: 162.0,
child: GeneratedRectangle15Widget8(),
),
Positioned(
left: 26.0,
top: 436.0,
right: null,
bottom: null,
width: 305.0,
height: 170.0,
child:
GeneratedComplaintID0000141SubmitDate25032021ContactNo01776414432(),
),
Positioned(
left: 0.0,
top: 0.0,
right: null,
bottom: null,
width: 360.0,
height: 50.0,
child: GeneratedGroup258Widget(),
),
Positioned(
left: 350.0,
top: 284.0,
right: null,
bottom: null,
width: 4.0,
height: 193.0,
child: GeneratedGroup342Widget(),
),
Positioned(
left: 0.0,
top: 132.0,
right: null,
bottom: null,
width: 360.0,
height: 61.0,
child: GeneratedRectangle43Widget(),
),
Positioned(
left: 20.0,
top: 147.0,
right: null,
bottom: null,
width: 320.2200012207031,
height: 45.83333206176758,
child: GeneratedGroup345Widget(),
),
Positioned(
left: 125.0,
top: 567.0,
right: null,
bottom: null,
width: 63.0,
height: 13.0,
child: GeneratedGroup347Widget(),
),
Positioned(
left: 226.0,
top: 567.0,
right: null,
bottom: null,
width: 63.0,
height: 13.0,
child: GeneratedGroup348Widget(),
)
]),
),
));
}
}
*/
//////////////////////////////////
//to show data
//widget
// */
 // {
      //   child: ClipRRect(
      // borderRadius: BorderRadius.zero,
      // child: Container(
      //   width: 360.0,
      //   height: 640.0,
      //   child: Stack(fit: StackFit.expand, alignment: Alignment.center, overflow: Overflow.visible, children: [
      //     ClipRRect(
      //       borderRadius: BorderRadius.zero,
      //       child: Container(
      //         color: Color.fromARGB(255, 255, 255, 255),
      //       ),
      //     ),
      //     Positioned(
      //       left: 0.0,
      //       top: 0.0,
      //       right: null,
      //       bottom: null,
      //       width: 360.0,
      //       height: 640.0,
      //       child: GeneratedRectangle14Widget10(),
      //     ),
      //     Positioned(
      //       left: 0.0,
      //       top: 0.0,
      //       right: null,
      //       bottom: null,
      //       width: 360.0,
      //       height: 640.0,
      //       child: GeneratedRectangle13Widget10(),
      //     ),
      //     Positioned(
      //       left: 0.0,
      //       top: 0.0,
      //       right: null,
      //       bottom: null,
      //       width: 360.0,
      //       height: 640.0,
      //       child: GeneratedRectangle3Widget12(),
      //     ),
      //     Positioned(
      //       left: 71.0,
      //       top: 768.0,
      //       right: null,
      //       bottom: null,
      //       width: 91.0,
      //       height: 19.0,
      //       child: GeneratedSignUphereWidget11(),
      //     ),
  // {
     //data table
//   return  Container(
//       width: 348.0,
//       height: 165.0,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(6.0),
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(6.0),
//         child: Container(
//           color: Color.fromARGB(255, 255, 255, 255),
//           child:
//           Text(
//             '''Complaint ID:       0000141
// Submit Date:        25/03/2021
// Contact No:          0177641443
// Complaint:            Oaver Billing Complaint
// Message:              Over Bill Problem 500 taka
// Fault Address:      house: 203, Road: 10, Mujgunni R/A
// Fault Location:                          File:
// ''',
//             overflow: TextOverflow.visible,
//             textAlign: TextAlign.left,
//             style: TextStyle(
//               height: 1.75,
//               fontSize: 12.0,
//               fontFamily: 'Inter',
//               fontWeight: FontWeight.w400,
//               color: Color.fromARGB(255, 0, 0, 0),
//
//               /* letterSpacing: 0.0, */
//             ),
//           ),
//         ),
//       ),
//     );
   /////////////////////////////////////////
    //     ]),
    //   ),
    // ));
 // }
//}
class CustomerComplaintSubmission extends StatefulWidget {
 final bool isVisible;
 // const CustomerComplaintSubmission({Key? key}) : super(key: key);
  CustomerComplaintSubmission({this.isVisible=true});
  @override
  _CustomerComplaintSubmissionState createState() => _CustomerComplaintSubmissionState();
}

class _CustomerComplaintSubmissionState extends State<CustomerComplaintSubmission> {
  List<Widget> submittedWidgets = [];
  String? ticketName;
  TicketApi ticketApi=TicketApi();
  //fetching saved login data
  void getSharedData() async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
     ticketApi.postData();
    setState(() {
      //_mobileNo=prefs.getString('mobileNo');
     // ticketName = prefs.getString('ticketName');
      //  _customerNo=prefs.getString('customerNo');
      //  _meterNo=prefs.getString('meterNo');
    });
  }
  @override
  Widget build(BuildContext context) {
   ticketApi.postData();
    print(ticketName);
      //data table
    return  Column(
      // crossAxisAlignment: CrossAxisAlignment.baseline,
      // textBaseline: TextBaseline.alphabetic,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0,left: 6,right: 6),
          child: FittedBox(
            fit:BoxFit.contain,
            child: Container(
            width: 348.0,
      //  height: 165.0,
              //edit by nabila
            //  height: 175.0,
              height: 200.0,

            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            ),
            child: ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Container(
            color: Color.fromARGB(255, 255, 255, 255),
            child:
            Padding(
              padding: const EdgeInsets.only(top:10.0,left:20,right:16),
              child: Column(
              //  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FittedBox(
                    fit:BoxFit.contain,
                    child: Text(
                    '''Complaint ID:       0000141
Submit Date:        25/03/2021
Contact No:          0177641443
Complaint:            Oaver Billing Complaint
Message:              Over Bill Problem 500 taka
Fault Address:      house: 203, Road: 10, Mujgunni R/A
''',
               //     Fault Location:                          File:
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.left,
                    style: kCustomerComplaintDataTable,
                    ),
                  ),
                  //to add the view map and view file button
                  Row(
                   // crossAxisAlignment: CrossAxisAlignment.center,
                 //  mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      FittedBox(
                        fit:BoxFit.contain,
                        child: Text('''Fault Location:''',
                         style: kCustomerComplaintDataTable,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      //view map button
                      //sizedbox used here to resize
                      SizedBox(
                        height:25,
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
                        style: kCustomerComplaintDataTable,
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
                  ],
                  ),
                ],
              ),
            ),
            ),
            ),
            ),
          ),
        ),
        ///////2nd container data table for another complaint id
//         SizedBox(height: 10,),
//         Container(
//         width: 348.0,
//         height: 162.0,
//     decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(6.0),
//     ),
//     child: ClipRRect(
//     borderRadius: BorderRadius.circular(6.0),
//     child: Container(
//     color: Color.fromARGB(255, 255, 255, 255),
//       child:
//       Text(
//         '''Complaint ID:       0000141
// Submit Date:        25/03/2021
// Contact No:          0177641443
// Complaint:            Oaver Billing Complaint
// Message:              Over Bill Problem 500 taka
// Fault Address:      house: 203, Road: 10, Mujgunni R/A
// Fault Location:                          File:
// ''',
//         overflow: TextOverflow.visible,
//         textAlign: TextAlign.left,
//         style: kCustomerComplaintDataTable,
//       ),
//     ),
//     ),
//     ),
        //////////////////////////////////////

      ],
    );
  }
}
