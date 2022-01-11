import 'package:flutter/material.dart';
import 'package:wzpdcl_app_flutter/components/mycustom_appbar.dart';
import 'package:wzpdcl_app_flutter/constants.dart';
import 'package:wzpdcl_app_flutter/screens/ledger&usage/ledger_screen.dart';
import 'package:wzpdcl_app_flutter/screens/ledger&usage/usage_graph_screen.dart';
import 'ledger_screen.dart';

class LedgerLargeScreenStat extends StatefulWidget {
  const LedgerLargeScreenStat({Key? key}) : super(key: key);

  @override
  _LedgerLargeScreenStatState createState() => _LedgerLargeScreenStatState();
}

class _LedgerLargeScreenStatState extends State<LedgerLargeScreenStat> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 360.0,
        height: 640.0,
        child: ClipRRect(
        borderRadius: BorderRadius.zero,
        child: Container(
        color: Color.fromARGB(255, 246, 246, 246),

    child: DefaultTabController(
    length: 2,
    child: Scaffold(
    appBar: MyCustomAppBar(context: context,),

    body:
    //green container
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:2.0),
            child: Container(
            width: 360.0,
            height: 87.0,
            child: ClipRRect(
              borderRadius: BorderRadius.zero,
              child: Container(
                color: Color.fromARGB(255, 0, 167, 76),
                child:
                //left text
                Padding(
                  padding: const EdgeInsets.only(top: 14.0,left:9.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '''Account No: 45755555
Meter Number: 15454253651''',
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.left,
                        style: kLedgerLargeScreenStatGreenContainerText
                      ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '''Tarrif: A
Sanction Load: 4 KW''',
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.left,
                    style: kLedgerLargeScreenStatGreenContainerText,
                  ),
                    ],
                  ),
                ),
              ),
            ),
    ),
          ),
      Container(
        width: 360.0,
       //figma height
       // height: 87.0,
        //nabila
        height: 60.0,
        child: ClipRRect(
          borderRadius: BorderRadius.zero,
          child: Container(
            color: Color.fromARGB(255, 255, 255, 255),
            //tabBar
            child:
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:2.0),
                  child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator:
                      BoxDecoration(
                        shape: BoxShape.rectangle,
                        // color: Color(0xFFFA9D30),
                      //  border:BoxBorder
                       color: Color.fromARGB(255, 249, 156, 47),
                        border: Border.all(width: 1),
                      ),

                      tabs: [
                     Tab(
                         child:
                         Container(
                        width: 181.0,
                        height: 35.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.zero,
                          child: Container(
                          //  color: Color.fromARGB(255, 249, 156, 47),
                            child:
                            Text(
                              '''Ledger''',
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                height: 1.171875,
                                fontSize: 12.0,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 45, 49, 146),

                                /* letterSpacing: 0.0, */
                              ),
                            ),
                          ),
                        ),
                     ),
                  ),
                        Tab(
                          child:
                          Container(
                            width: 181.0,
                            height: 35.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.zero,
                              child: Container(
                                //  color: Color.fromARGB(255, 249, 156, 47),
                                //text
                                child:
                                Text(
                                  '''Usuage Graph''',
                                  overflow: TextOverflow.visible,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    height: 1.171875,
                                    fontSize: 12.0,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                  //  color: Color.fromARGB(255, 255, 255, 255),
                                    color: Color.fromARGB(255, 45, 49, 146),

                                    /* letterSpacing: 0.0, */
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
          ],
          ),
                ),
//bill ledger text
            /////////
              ],
            ),
        ),
      ),
      ),
          //tabBar view
          SizedBox(
           height: 450,
            child: TabBarView(
              children: [
               LedgerScreen(),
                UsageGraphScreen(),
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
