import 'package:flutter/material.dart';

import 'package:wzpdcl_app_flutter/components/GapRF.dart';
import 'package:wzpdcl_app_flutter/language/Languages%20.dart';

import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';
import 'customer_complaint_entry.dart';
import 'ledger&usage/usage_graph_screen.dart';

class LedgerList extends StatefulWidget {
  @override
  _LedgerListState createState() => _LedgerListState();

  LedgerList() : super(key: GlobalKey());
}

class _LedgerListState extends State<LedgerList> {
  ScrollController scrollController = ScrollController();

  // bool isPending = true;
  int status = 0;

  // List<Complaint> titles;

  @override
  void initState() {
    // titles = [];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CommonOperation.commonAppbar(),
        body: SafeArea(
          child: body(),
        ));
  }

  body() {
    return Container(
      // height: ScreenRF.height(context) - 150,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0),
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.green.shade400,
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Languages.of(context)!.AccountNo +' : '+ "0463463654",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                      GapRF(5),
                      Text(Languages.of(context)!.AccountNo+' : '+ "1183124t6834r236",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),

                    ],
                  ),
                ) ,
                Align(
                  alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Languages.of(context)!.Tarrif+" : "+"A" ,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                        GapRF(5),
                        Text(Languages.of(context)!.SanctionLoad + " :"+"4 Kw",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),

                      ],
                    ),
                  )

              ],),
          ),
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      status = 0;
                      // rf.msg(this.context, "Marks added successfully 0", color: Colors.black,backgroundColor: Colors.transparent, type: MessageType.info);
                      scrollController.animateTo(0,
                          duration: Duration(microseconds: 2000),
                          curve: Curves.bounceIn);
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: status == 0 ? Colors.orange : Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Languages.of(context)!.Ledger,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              /*Text(
                                '10',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              ),*/
                            ],
                          )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //  rf.msg(this.context, "Marks added successfully 1", color: Colors.black,backgroundColor: Colors.transparent, type: MessageType.info);
                      status = 1;
                      scrollController.animateTo(0,
                          duration: Duration(microseconds: 2000),
                          curve: Curves.bounceIn);
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: status == 1
                                ? Colors.indigo.shade500
                                : Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.indigo.shade500,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Languages.of(context)!.UsageGraph,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                             /* Text(
                                '10',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              ),*/
                            ],
                          )),
                    ),
                  ),
                  GapRF(5),
                ],
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            controller: scrollController,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              key: GlobalKey(),
              children: [
                status == 0
                    ? Container(width: ScreenRF.width(context), child: list1())
                    : Container(
                            child: UsageGraphScreen(),
                            width: ScreenRF.width(context),
                          )
                        ,
              ],
            ),
          )),
        ],
      ),
    );
  }

  list1() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(12),
            width: ScreenRF.width(context),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.white70],
                  begin: FractionalOffset(0, 0),
                  end: FractionalOffset(0, 1),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 5,
                    color: Colors.black.withOpacity(0.4)),
              ],
            ),
            child: Column(
              children: [
                 Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Languages.of(context)!.BillMonth+' : '+ "Oct-2016",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(Languages.of(context)!.DueDate+' : '+ "Oct-2016",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(Languages.of(context)!.PayDate+' : '+ "Oct-2016",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),

                        ],
                      ),
                    ) ,
                    Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Languages.of(context)!.CurrentBill+" : "+"4003.7" ,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14)),
                          GapRF(5),
                          Text(Languages.of(context)!.TotalBill+" : "+"4043",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14)),

                          GapRF(5),
                          Text(Languages.of(context)!.PaidAmount+" : "+"4043",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14)),

                        ],
                      ),
                    )

                  ],),
              ],
            ),
          );
        });
  }

  filter(){
    return Column(children: [

      Container(
        child:list2(),
        width: ScreenRF.width(context),
      )


    ],);
  }

  list2() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(12),
            width: ScreenRF.width(context),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.white70],
                  begin: FractionalOffset(0, 0),
                  end: FractionalOffset(0, 1),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 5,
                    color: Colors.black.withOpacity(0.4)),
              ],
            ),
            child: Column(
              children: [
                    Stack(
                      children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Languages.of(context)!.AccountNo+' : '+ "0463463654",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12)),
                            GapRF(5),
                            Text(Languages.of(context)!.Consumptions+' : '+ "139.0 KHW",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12)),

                          ],
                        ),
                      ) ,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: Column(
                            children: [
                              Text("12-11-2021" ,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14)),
                              GapRF(5),
                              Text("৳ "+"667",
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),

                            ],
                          ),
                        ),)

                    ],),
              ],
            ),
          );
        });
  }

}
