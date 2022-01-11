import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:wzpdcl_app_flutter/components/custom_button.dart';
import 'package:wzpdcl_app_flutter/components/mycustom_appbar.dart';
import 'customer_complaint_progress_screen.dart';
import 'customer_complaint_solved_screen.dart';
import 'customer_complaint_submission_screen.dart';
import 'package:wzpdcl_app_flutter/constants.dart';
import 'package:wzpdcl_app_flutter/components/green_header_container.dart';

/// This screen is in Development
class CustomerComplaintStatScreen extends StatefulWidget {
  const CustomerComplaintStatScreen({Key? key}) : super(key: key);

  @override
  _CustomerComplaintStatScreenState createState() =>
      _CustomerComplaintStatScreenState();
}

class _CustomerComplaintStatScreenState
    extends State<CustomerComplaintStatScreen> {
//    bool isVisible=false;
  bool visibility() {
    if (TabBarView == CustomerComplaintSubmission)
      return false;
    else
      return true;
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    //  isVisible=visibility();
    visibility();
  }

  @override
  Widget build(BuildContext context) {
    visibility();
    //final useful
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: MyCustomAppBar(context: context,),
//
//         body: Scaffold(
//           appBar: AppBar(
//             //appBar: MyCustomAppBar(context: context,),
//            // backgroundColor: Colors.white,
//             elevation: 0,
//             bottom: TabBar(
//
//               indicator: BoxDecoration(
//                 shape: BoxShape.rectangle,
//                 // color: Color(0xFFFA9D30),
//                 //border: ShapeDecoration
//                 border: Border.all(width: 1),
//
//               ),
//               tabs: [
//                 Tab(
//                   child: Container(
//                     // height: 115,
//                     // width: 47,
//                     // margin: EdgeInsets.only(left: 0, top: 132),
//                     // decoration: BoxDecoration(
//                     //   color: Color(0xFFFA9D30),
//                     //   shape: BoxShape.rectangle,
//                     // ),
//
//                     child: Text("Submitted", textAlign: TextAlign.center,),
//
//                   ),
//                 ),
//                 Tab(
//                   child: Container(
//                     // decoration: BoxDecoration(
//                     //   color: Color(0xFF09607D),
//                     //   shape: BoxShape.rectangle,
//                     //   border: Border.all(width: 1.0),
//                     // ),
//
//                     child: Text("Progress", textAlign: TextAlign.center,),
//
//                   ),
//                 ),
//                 Tab(
//                   child: Container(
//                     // decoration: BoxDecoration(
//                     //   color: Color(0xFF33AF04),
//                     //   shape: BoxShape.rectangle,
//                     // ),
//
//                     child: Text("Solved", textAlign: TextAlign.center,),
//
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//
//           body: TabBarView(
//             children: [
//               CustomerComplaintSubmission(),
//               CustomerComplaintProgress(),
//               CustomerComplaintSolved(),
//             ],
//           ),
//
//         ),
//       ),
//     );
//   }
// }
    //in order to modify
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: MyCustomAppBar(context: context,),
//
//         body: Scaffold(
//           //to avoid bottom overflow
//         //  resizeToAvoidBottomInset: false,
//           appBar: AppBar(
//             //appBar: MyCustomAppBar(context: context,),
//             // backgroundColor: Colors.white,
//             flexibleSpace: FittedBox(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   //green container
//               Container(
//               // height: 40,
//               // width: double.infinity,
//               // //margin: EdgeInsets.only(top:52),
//               // color: Color(0xFF00A74C),
//               // child: Row(
//               // children: [
//               // /*  Container(
//               //     height:48 ,
//               //     width: 276,
//               //     margin: EdgeInsets.only(top:72,left:42),
//               //     color: Color(0xFF00A74C),*/
//               //   Text('Customer No. 01866355255 Complaint Statistics',textAlign: TextAlign.center,
//               //   style: kCustomerComplaintStatistics,),
//               //      ],
//               // ),
// ///////figma
//                 width: 360.0,
//               //  height: 78.0,
//                 height: 78.0,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.zero,
//                   child: Container(
//                     color: Color.fromARGB(255, 0, 167, 76),
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 360.0,
//                 height: 61.0,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.zero,
//                   child: Container(
//                     color: Color.fromARGB(255, 45, 49, 146),
//                     child: Container(
//                       width: 320.2200012207031,
//                       height: 33.44444274902344,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30.0),
//                         //
//                         color: Color(0x00A74C)
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(30.0),
//                         child: Container(
//                           color: Color.fromARGB(255, 0, 167, 76),
//                     ),
//                   ),
//                 ),
//               ),
//                 ),
//               ),
//
//           //this tabbar is useful,need to comment out
//           //        TabBar(
//           //         indicator: BoxDecoration(
//           //           shape: BoxShape.rectangle,
//           //           // color: Color(0xFFFA9D30),
//           //           //border: ShapeDecoration
//           //           border: Border.all(width: 1),
//           //
//           //         ),
//           //         tabs: [
//           //           Tab(
//           //             child: Container(
//           //               // height: 115,
//           //               // width: 47,
//           //               // margin: EdgeInsets.only(left: 0, top: 132),
//           //               // decoration: BoxDecoration(
//           //               //   color: Color(0xFFFA9D30),
//           //               //   shape: BoxShape.rectangle,
//           //               // ),
//           //
//           //               child: Text("Submitted", textAlign: TextAlign.center,),
//           //
//           //             ),
//           //           ),
//           //           Tab(
//           //             child: Container(
//           //               // decoration: BoxDecoration(
//           //               //   color: Color(0xFF09607D),
//           //               //   shape: BoxShape.rectangle,
//           //               //   border: Border.all(width: 1.0),
//           //               // ),
//           //
//           //               child: Text("Progress", textAlign: TextAlign.center,),
//           //
//           //             ),
//           //           ),
//           //           Tab(
//           //             child: Container(
//           //               // decoration: BoxDecoration(
//           //               //   color: Color(0xFF33AF04),
//           //               //   shape: BoxShape.rectangle,
//           //               // ),
//           //
//           //               child: Text("Solved", textAlign: TextAlign.center,),
//           //
//           //             ),
//           //           ),
//           //
//           //         ],
//           //       ),
//           //     ],
//           //   ),
//           //   elevation: 0,
//           //
//           // ),
//           //
//           // body: TabBarView(
//           //   children: [
//           //     CustomerComplaintSubmission(),
//           //     CustomerComplaintProgress(),
//           //     CustomerComplaintSolved(),
//               ],
//           ),
//             ),
//
//         ),
//       ),
//       ),
    return Container(
      width: 360.0,
      height: 640.0,
      child: ClipRRect(
        borderRadius: BorderRadius.zero,
        child: Container(
          color: Color.fromARGB(255, 246, 246, 246),
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: MyCustomAppBar(
                context: context,
              ),
              body:
                  //to avoid bottom overflow
                  //  resizeToAvoidBottomInset: false,

                  //appBar: MyCustomAppBar(context: context,),
                  // backgroundColor: Colors.white,
                  Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //green container
                  GreenHeaderContainer(
                    text: '''Customer No. 01866355255
Complaint Statistics''',
                  ),
                  //blue one
                  Visibility(
                    visible: visibility(),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Container(
                        width: 360.0,
                        height: 61.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.zero,
                          child: Container(
                            color: Color.fromARGB(255, 45, 49, 146),
                            child: Container(
                              width: 320.2200012207031,
                              height: 33.44444274902344,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  //
                                  color: Color(0x00A74C)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 15,
                                    bottom: 12.56,
                                    left: 20,
                                    right: 19.78),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: Container(
                                    color: Color.fromARGB(255, 0, 167, 76),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        '''Create A New Complaint''',
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          height: 1.171875,
                                          fontSize: 12.0,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          /* letterSpacing: 0.0, */
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //this tabbar is useful,need to comment out
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Container(
                      width: double.infinity,
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          shape: BoxShape.rectangle,
                          // color: Color(0xFFFA9D30),
                          //border: ShapeDecoration
                          border: Border.all(width: 1),
                        ),
                        tabs: [
                          Tab(
                            child: Container(
                              width: 115.0,
                              height: 47.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.zero,
                                child: Container(
                                  color: Color.fromARGB(255, 249, 156, 47),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      '''Submission 
3''',
                                      overflow: TextOverflow.visible,
                                      textAlign: TextAlign.center,
                                      style: kCustomerComplaintTabBarText,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //   ),

                          Tab(
                            child: Container(
                              width: 118.0,
                              height: 47.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.zero,
                                child: Container(
                                  color: Color.fromARGB(255, 9, 96, 125),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      '''Progress
2''',
                                      overflow: TextOverflow.visible,
                                      textAlign: TextAlign.center,
                                      style: kCustomerComplaintTabBarText,

                                      /* letterSpacing: 0.0, */
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            //  ),
                          ),
                          Tab(
                            child: Container(
                              width: 119.0,
                              height: 47.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.zero,
                                child: Container(
                                  color: Color.fromARGB(255, 50, 175, 3),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      '''Solved 
4''',
                                      overflow: TextOverflow.visible,
                                      textAlign: TextAlign.center,
                                      style: kCustomerComplaintTabBarText,

                                      /* letterSpacing: 0.0, */
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //  ),
                          //      ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 430,
                    child: TabBarView(
                      children: [
                        CustomerComplaintSubmission(),
                        CustomerComplaintProgress(),
                        CustomerComplaintSolved(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/////////////////////////////
//           appBar: MyCustomAppBar(context: context,),
//           body:
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 //hold the tabbar
//                 SizedBox(
//                   child: Container(
//                     height:47,
//                     width: 115,
//                     margin: EdgeInsets.only(left:0 ,top:132),
//                     color: Colors.white,
//                     child: SizedBox(
//                       child: TabBar(
//                         indicator: BoxDecoration(
//                           shape: BoxShape.rectangle,
//                           // color: Color(0xFFFA9D30),
//                           //border: ShapeDecoration
//                           border: Border.all(width: 1),
//
//                         ),
//                         tabs: [
//                           Tab(
//                             child: Container(
//                              // height:115 ,
//                               width: 115,
//                               margin: EdgeInsets.only(left:0 ,top:132),
//                               decoration: BoxDecoration(
//                                 color: Color(0xFFFA9D30),
//                                 shape: BoxShape.rectangle,
//                               ),
//
//                               child:Text( "Submitted",textAlign: TextAlign.center,),
//
//                             ),
//                           ),
//                           Tab(
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: Color(0xFF09607D),
//                                 shape: BoxShape.rectangle,
//                                 border: Border.all(width: 1.0),
//                               ),
//
//                               child:Text( "Progress",textAlign: TextAlign.center,),
//
//                             ),
//                           ),
//                           Tab(
//
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   color: Color(0xFF33AF04),
//                                   shape: BoxShape.rectangle,
//                                 ),
//
//                                 child:Text( "Solved",textAlign: TextAlign.center,),
//
//                               ),
//                             ),
//
//
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//
//         TabBarView(
//             children: [
//               CustomerComplaintSubmission(),
//               CustomerComplaintProgress(),
//               CustomerComplaintSolved(),
//             ],
//           ),
//               ],
//             ),

//         ),
//
//     );
//
//
//   }
// }
///////////////////////////////////
// body: Scaffold(
//   appBar: AppBar(
//     //appBar: MyCustomAppBar(context: context,),
//     backgroundColor: Colors.white,
//     elevation: 0,
//bottom:
// body:
// Padding(
//   padding: const EdgeInsets.only(top:132),
//   child: Column(
//     children: [
//       SizedBox(
//         child: TabBar(
//               indicator: BoxDecoration(
//                 shape: BoxShape.rectangle,
//                 // color: Color(0xFFFA9D30),
//                 //border: ShapeDecoration
//                 border: Border.all(width: 1),
//
//               ),
//               tabs: [
//                 Tab(
//                   child: Container(
//                     height:47,
//                     width: 115,
//                     margin: EdgeInsets.only(left: 0, top: 132),
//                     decoration: BoxDecoration(
//                       color: Color(0xFFFA9D30),
//                       shape: BoxShape.rectangle,
//                     ),
//
//                     child: Text("Submitted", textAlign: TextAlign.center,),
//
//                   ),
//                 ),
//                 Tab(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Color(0xFF09607D),
//                       shape: BoxShape.rectangle,
//                       border: Border.all(width: 1.0),
//                     ),
//
//                     child: Text("Progress", textAlign: TextAlign.center,),
//
//                   ),
//                 ),
//                 Tab(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Color(0xFF33AF04),
//                       shape: BoxShape.rectangle,
//                     ),
//
//                     child: Text("Solved", textAlign: TextAlign.center,),
//
//                   ),
//                 ),
//
//               ],
//             ),
//       ),
//
//    TabBarView(
//     children: [
//       CustomerComplaintSubmission(),
//       CustomerComplaintProgress(),
//       CustomerComplaintSolved(),
//     ],
//   ),
//     ],
//   ),
// ),
//latest
//         body: Scaffold(
//           appBar: AppBar(
//             //appBar: MyCustomAppBar(context: context,),
//             backgroundColor: Colors.white,
//             elevation: 0,
//             leading:   Container(
//                 height: 78,
//                 width: 360,
//                 margin: EdgeInsets.only(top:52),
//                 color: Color(0xFF00A74C),
//                 child: Column(
//                   children: [
//                   /*  Container(
//                 height:48 ,
//                 width: 276,
//                 margin: EdgeInsets.only(top:72,left:42),
//                 color: Color(0xFF00A74C),*/
//                   Text('Customer No. 01866355255 Complaint Statistics',textAlign: TextAlign.center,
//                   style: kCustomerComplaintStatistics,),
//               ],
//             ),
//           ),
//             bottom: TabBar(
//
//               indicator: BoxDecoration(
//                 shape: BoxShape.rectangle,
//                 // color: Color(0xFFFA9D30),
//                 //border: ShapeDecoration
//                 border: Border.all(width: 1),
//
//               ),
//               automaticIndicatorColorAdjustment: true,
//               tabs: [
//                 Tab(
//                   child: Container(
//                     height: 47,
//                     width:115,
//                   //  margin: EdgeInsets.only(left: 0, top: 132),
//                   //   decoration: BoxDecoration(
//                   //     color: Color(0xFFFA9D30),
//                   //     shape: BoxShape.rectangle,
//                   //   ),
//                     color: Color(0xFFFA9D30),
//
//                     child:
//                     Align(
//                       alignment: Alignment.center,
//                       child: Text("Submitted",style:
//                       kComplaintSubmitted),
//                     ),
//
//                   ),
//                 ),
//                 Tab(
//                   child: Container(
//                     height: 47,
//                     width:115,
//                     decoration: BoxDecoration(
//                       color: Color(0xFF09607D),
//                       shape: BoxShape.rectangle,
//                       border: Border.all(width: 1.0),
//                     ),
//
//                     child:
//                     Align(
//                       alignment: Alignment.center,
//                       child: Text("Progress", style:
//                       kComplaintSubmitted),
//                     ),
//
//                   ),
//                 ),
//                 Tab(
//               child:  Container(
//                 height: 47,
//                 width: 115,
//                 decoration: BoxDecoration(
//                   color: Color(0xFF33AF04),
//                   shape: BoxShape.rectangle,
//                 ),
//
//                 child:
//                 Align(
//                   alignment: Alignment.center,
//                     child:
//                     Text("Solved",),
//                 ),
//              //     style: kComplaintSubmitted,),
//
//               ),
//                 ),
//
//               ],
//             ),
//           ),
//           body: TabBarView(
//             children: [
//               CustomerComplaintSubmission(),
//               CustomerComplaintProgress(),
//               CustomerComplaintSolved(),
//             ],
//           ),
//
//         ),
//       ),
//     );
//   }
// }

//         ),
//       ),
//     );
//   }
// }
