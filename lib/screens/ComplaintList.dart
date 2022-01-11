import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:wzpdcl_app_flutter/components/GapRF.dart';
import 'package:wzpdcl_app_flutter/language/Languages%20.dart';
import 'package:wzpdcl_app_flutter/utils/AppColor.dart';
import 'package:wzpdcl_app_flutter/utils/AppConstant.dart';

import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';
import 'customer_complaint_entry.dart';

class ComplaintList extends StatefulWidget {
  List<String>? customerNo;
  @override
  _ComplaintListState createState() => _ComplaintListState();

  ComplaintList({Key? key, required this.customerNo}) : super(key: key);
}

class _ComplaintListState extends State<ComplaintList> {
  ScrollController scrollController = ScrollController();

  // bool isPending = true;
  int status = 0;
  String? _mobileNo = "";

  // List<Complaint> titles;

  @override
  void initState() {
    // titles = [];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_mobileNo == "") {
      getSharedData();
    }
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CommonOperation.commonAppbar(),
        body: SafeArea(
          child: body(),
        ));
  }

  void getSharedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _mobileNo = await prefs.getString(AppConstant.MOBILE_NO);

    setState(() {

    });
  }

  body() {
    return Container(
      //color: AppColor.colorPrimary(),
      // height: ScreenRF.height(context) - 150,
      child: Column(
        children: [
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            margin: const EdgeInsets.only(left: 5, right: 5),
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.green.shade400,
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
            child: Column(
              children: [
                Text(Languages.of(context)!.ComplaintStatistics,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 5,
                ),
                Text(Languages.of(context)!.CustomerNo + ' ' + _mobileNo!,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            margin: const EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0),
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 5.0, bottom: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColor.colorPrimary(),
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                    color: Colors.green.shade600,
                    onPressed: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return CustomerComplaintEntry(mobileNo: _mobileNo, customerNo: widget.customerNo );
                          }));
                    },
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 5.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Container(
                              child: Center(
                                child: Text(
                                  Languages.of(context)!.CreateANewComplaint,
                                  // align: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // GapRF(5),
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
                          height: 50,
                          width: 110,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Languages.of(context)!.Submission,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              Text(
                                '10',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              ),
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
                          height: 50,
                          width: 110,
                          decoration: BoxDecoration(
                            color: Colors.indigo.shade500,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Languages.of(context)!.Progress,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              Text(
                                '10',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              ),
                            ],
                          )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      status = 2;
                      scrollController.animateTo(500,
                          duration: Duration(microseconds: 800),
                          curve: Curves.bounceIn);
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: status == 2
                                ? Colors.green.shade500
                                : Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Container(
                          height: 50,
                          width: 110,
                          decoration: BoxDecoration(
                            color: Colors.green.shade500,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Languages.of(context)!.Solved,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              Text(
                                '10',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              ),
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
                        ? Container(
                        width: ScreenRF.width(context), child: list1())
                        : status == 1
                        ? Container(
                      child: list2(),
                      width: ScreenRF.width(context),
                      /*child: ListViewRF(
                    dataSource: performanceBenDataSource,
                    builder: (model, index) => beneficaryCardPerformance(model, index),
                    onTap: (model, index) {
                   */ /*   rf.page.call(
                          context,
                          FollowUpInfoEntryTemp(
                              beneficiaryModel: model,
                              followUpCategory: "Performance"));*/ /*
                    },
                    */ /*onItemDelete: (_) {
                      setState(() => AppBarModel.dataSource = performanceBenDataSource);
                    },*/ /*
                  ),*/
                    )
                        : Container(
                      child: list3(),
                      width: ScreenRF.width(context),
                      /*child: ListViewRF(
                    dataSource: dataSource,
                    builder: (model, index) => card(model, index),
                    onTap: (model, index) {
                    */ /*  rf.page.call(
                          context, FollowUpInfoEntryTemp(followUpModel: model));*/ /*
                    },
                    onItemDelete: (_) {
                      //setState(() => AppBarModel.dataSource = dataSource);
                    },
                  ),*/
                    ),
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
            padding: const EdgeInsets.all(8),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GapRF(10),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Languages.of(context)!.ComplaintID,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(Languages.of(context)!.SubmitDate,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(Languages.of(context)!.ContactNo,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(Languages.of(context)!.Complaint,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(Languages.of(context)!.Message,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(Languages.of(context)!.FaultAddress,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                        ],
                      ),
                    ),
                    GapRF(10),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(":  " + "00000141",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(":  " + "25/10/2021",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(":  " + "01725560908",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(":  " + "Over Billing Complaint",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(":  " + "Over Bill Problem 500 Taka",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(":  " + "House 203, Road 01, Mohammadpur",
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                        ],
                      ),
                    )
                  ],
                ),
                GapRF(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GapRF(5),
                    Column(
                      children: [
                        Text('- ' + Languages.of(context)!.FaultLocation + ' -',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 12)),
                        ElevatedButton(
                          style: ButtonStyle(
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blue.shade900),
                          ),
                          onPressed: () {},
                          child: Text(Languages.of(context)!.ViewMap,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                        )
                        /* TextButton(
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade600),

                      ),
                      onPressed: () { },
                      child: Text('View Map'),
                    ),*/
                      ],
                    ),
                    GapRF(50),
                    Column(
                      children: [
                        Text('- ' + Languages.of(context)!.File + ' - ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 12)),
                        ElevatedButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                            ),
                            onPressed: () {},
                            child: Text(
                              Languages.of(context)!.ViewFile,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12),
                            ))
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  list2() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(8),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GapRF(10),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Languages.of(context)!.ComplaintID,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(Languages.of(context)!.SubmitDate,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(Languages.of(context)!.ContactNo,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(Languages.of(context)!.Complaint,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(Languages.of(context)!.Message,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(Languages.of(context)!.FaultAddress,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(Languages.of(context)!.Instructions,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(Languages.of(context)!.ActionTakenTime,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                        ],
                      ),
                    ),
                    GapRF(10),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(":  " + "00000141",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(":  " + "25/10/2021",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(":  " + "01725560908",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(":  " + "Over Billing Complaint",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(":  " + "Over Bill Problem 500 Taka",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(":  " + "House 203, Road 01, Mohammadpur",
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(":  " + "Please stay at home",
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.red.shade300,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(":  " + "15-11-2021 10:25 AM",
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                        ],
                      ),
                    )
                  ],
                ),
                GapRF(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GapRF(5),
                    Column(
                      children: [
                        Text('- ' + Languages.of(context)!.FaultLocation + ' - ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 12)),
                        ElevatedButton(
                          style: ButtonStyle(
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blue.shade900),
                          ),
                          onPressed: () {},
                          child: Text(Languages.of(context)!.ViewMap,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                        )
                        /* TextButton(
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade600),

                      ),
                      onPressed: () { },
                      child: Text('View Map'),
                    ),*/
                      ],
                    ),
                    GapRF(50),
                    Column(
                      children: [
                        Text('- ' + Languages.of(context)!.File + ' - ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 12)),
                        ElevatedButton(
                          style: ButtonStyle(
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          onPressed: () {},
                          child: Text(Languages.of(context)!.ViewFile,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  list3() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(8),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GapRF(10),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Languages.of(context)!.ComplaintID,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(Languages.of(context)!.SubmitDate,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(Languages.of(context)!.ContactNo,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(Languages.of(context)!.Complaint,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(Languages.of(context)!.Message,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(Languages.of(context)!.FaultAddress,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(Languages.of(context)!.Instructions,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(Languages.of(context)!.ActionTakenTime,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                        ],
                      ),
                    ),
                    GapRF(10),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(":  " + "00000141",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(":  " + "25/10/2021",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(":  " + "01725560908",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(":  " + "Over Billing Complaint",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(":  " + "Over Bill Problem 500 Taka",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(":  " + "House 203, Road 01, Mohammadpur",
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(":  " + "Please stay at home",
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.red.shade300,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(":  " + "15-11-2021 10:25 AM",
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                        ],
                      ),
                    )
                  ],
                ),
                GapRF(10),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  margin: const EdgeInsets.only(
                    left: 50.0,
                    right: 50.0,
                  ),
                  alignment: Alignment.center,
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new FlatButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(15.0),
                          ),
                          color: Colors.green.shade600,
                          onPressed: () async {},
                          //LOGIN //Drawer Main
                          child: new Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 10.0,
                            ),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Expanded(
                                  child: Container(
                                    child: Center(
                                      child: Text(
                                        Languages.of(context)!.Feedback,
                                        // align: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /* Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                ],)*/
              ],
            ),
          );
        });
  }



}
