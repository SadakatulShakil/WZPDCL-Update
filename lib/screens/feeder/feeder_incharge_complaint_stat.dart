import 'package:flutter/material.dart';
import 'package:wzpdcl_app_flutter/components/green_header_container.dart';
import 'package:wzpdcl_app_flutter/components/mycustom_appbar.dart';
import 'package:wzpdcl_app_flutter/constants.dart';
import 'feeder_incharge_complaint_inbox.dart';
import 'feeder_incharge_complaint_progress.dart';
import 'feeder_incharge_complaint_solved.dart';
class FeederInchargeComplaintStatScreen extends StatefulWidget {
  const FeederInchargeComplaintStatScreen({Key? key}) : super(key: key);

  @override
  _FeederInchargeComplaintStatScreenState createState() => _FeederInchargeComplaintStatScreenState();
}

class _FeederInchargeComplaintStatScreenState extends State<FeederInchargeComplaintStatScreen> {
  @override
  Widget build(BuildContext context) {
    return  Container(
     //  width: 360.0,
     // // height: 129.0,
     //  height: 78,
     //  child: ClipRRect(
     //    borderRadius: BorderRadius.zero,
     //    child: Container(
     //      color: Color.fromARGB(255, 0, 167, 76),
     //      child: Container(
     //        width: 260.0,
     //        height: 48.0,
     //        child: Stack(
     //            clipBehavior: Clip.none, fit: StackFit.expand,
     //            alignment: Alignment.center,
     //            children: [
     //              Positioned(
     //                left: 0.0,
     //                top: 0.0,
     //                right: null,
     //                bottom: null,
     //                width: 262.0,
     //                height: 50.0,
     //                child:
//                     Text(
//                       '''Feeder Incharge ID: seakh1
// Complaint Statistics''',
//                       overflow: TextOverflow.visible,
//                       textAlign: TextAlign.center,
//                       style: kFeederInchargeIDComplaintStat,
//                   ),
//                   ),
//                 ],
//             ),
//           ),
//         ),
//       ),
//     );
          width: 360.0,
          height: 640.0,
          child: ClipRRect(
            borderRadius: BorderRadius.zero,
            child: Container(
              color: Color.fromARGB(255, 246, 246, 246),

              child: DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: MyCustomAppBar(context: context,),

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
//                       Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 2.0),
//                           child: Container(
// ///////figma
//                             width: 360.0,
//                             //  height: 78.0,
//                             height: 78.0,
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.zero,
//                               child: Container(
//                                 color: Color.fromARGB(255, 0, 167, 76),
//                                 child:
//                                 Padding(
//                                   padding: const EdgeInsets.only(top:10,bottom: 10,left: 42,right: 42),
//                                   child: FittedBox(
//                                     fit:BoxFit.contain,
//                                     child: Text(
//                       '''Feeder Incharge ID: seakh1
// Complaint Statistics''',
//                       overflow: TextOverflow.visible,
//                       textAlign: TextAlign.center,
//                       style: kComplaintStat,
//                   ),
//                                   ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
                    GreenHeaderContainer(text:'''Feeder Incharge ID: seakh1
Complaint Statistics'''),
                      //this tabbar is useful,need to comment out
                      Padding(
                        padding: const EdgeInsets.only(top:2),
                        child: Container(
                          width: double.infinity,
                          child: TabBar(
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicator:

                            BoxDecoration(
                              shape: BoxShape.rectangle,
                              // color: Color(0xFFFA9D30),
                              //border: ShapeDecoration
                              // border: Border.all(
                              //   color: Colors.transparent,
                              //     width: 0),

                            ),
                            tabs: [
                              Tab(
                                child:
                          Container(
                         //   constraints: BoxConstraints.expand(width: 115.0,height:47.0),
                          width: 115.0,
                            height: 47.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.zero,
                              child: Container(
                                color: Color.fromARGB(255, 249, 156, 47),
                                child:
                                Padding(
                                  padding: const EdgeInsets.only(top: 6.0),
                                  child: Text(
                                    '''Inbox
3''',
                                    overflow: TextOverflow.visible,
                                    textAlign: TextAlign.center,
                                    style: kCustomerComplaintTabBarText,
                                  ),
                                ),
                              ),
                            ),
                          ),
                                //   ),
                              ),
                              Tab(
                                child:Container(
                                  width: 118.0,
                                  height: 47.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.zero,
                                    child: Container(
                                      color: Color.fromARGB(255, 9, 96, 125),
                                      child:
                                      Padding(
                                        padding: const EdgeInsets.only(top:6.0),
                                        child: Text(
                                          '''Progress
2''',
                                          overflow: TextOverflow.visible,
                                          textAlign: TextAlign.center,
                                          style:  kCustomerComplaintTabBarText,

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
                                      child:
                                      Padding(
                                        padding: const EdgeInsets.only(top:6.0),
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
                        //to align the column items positioned
                        height: 490,
                        child:
                        TabBarView(
                          children: [
                            FeederInchargeComplaintInbox(),
                            FeederInchargeComplaintProgress(),
                            FeederInchargeComplaintSolved() ,
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
