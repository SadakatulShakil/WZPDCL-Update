import 'package:flutter/material.dart';
import 'package:wzpdcl_app_flutter/api/NetworkCall.dart';

import 'package:wzpdcl_app_flutter/components/GapRF.dart';
import 'package:wzpdcl_app_flutter/language/Languages%20.dart';
import 'package:wzpdcl_app_flutter/models/FeederIncharge.dart';
import 'package:wzpdcl_app_flutter/models/complaint/Complaint.dart';
import 'package:wzpdcl_app_flutter/utils/AppConstant.dart';

import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';
import 'customer_complaint_entry.dart';

class ComplaintListAdmin extends StatefulWidget {

  FeederIncharge? feederIncharge;
  @override
  _ComplaintListAdminState createState() => _ComplaintListAdminState();

  //ComplaintListAdmin(this.feederIncharge);
  ComplaintListAdmin(this.feederIncharge) : super(key: GlobalKey());
}

class _ComplaintListAdminState extends State<ComplaintListAdmin> {
  ScrollController scrollController1 = ScrollController();
  ScrollController scrollController2 = ScrollController();
  ScrollController scrollController3 = ScrollController();

  // bool isPending = true;
  int status = 0;
  String feederInchargeId = "";

  // List<Complaint> titles;
  NetworkCall networkCall = NetworkCall();

  List<Complaint>? complaintList1;
  List<Complaint>? complaintList2;
  List<Complaint>? complaintList3;

  int totalRecord = 0;
  int pageNum = 1;
  bool isPageLoading = false;

  final _scaffoldKey1 = new GlobalKey<ScaffoldState>();
  final _scaffoldKey2 = new GlobalKey<ScaffoldState>();
  final _scaffoldKey3 = new GlobalKey<ScaffoldState>();

  @override
  void initState() {


    //feederInchargeId = widget.feederIncharge!.feederInchargeUserId.toString();
    feederInchargeId = widget.feederIncharge!.feederInchargeUserId!;
    print("ID : "+feederInchargeId);


    scrollController1 = new ScrollController()..addListener(pagination1);
    scrollController2 = new ScrollController()..addListener(pagination2);
    scrollController3 = new ScrollController()..addListener(pagination3);


    complaintList1 = <Complaint>[];
    complaintList2 = <Complaint>[];
    complaintList3 = <Complaint>[];

    // titles = [];
    Future.delayed(const Duration(milliseconds: 100), () {
      getComplaintList(feederInchargeId,AppConstant.Complaint_Flug_Open, pageNum);
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController1.removeListener(pagination1);
    scrollController1.removeListener(pagination2);
    scrollController1.removeListener(pagination3);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    print("ID : "+feederInchargeId);
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
                Text(
                    Languages.of(context)!.FeederInchargeID +
                        ' : ' +
                        feederInchargeId,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
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
                      scrollController1.animateTo(0,
                          duration: Duration(microseconds: 2000),
                          curve: Curves.bounceIn);

                      complaintList1!.clear();
                      pageNum = 1;
                      getComplaintList(feederInchargeId,AppConstant.Complaint_Flug_Open, pageNum);
                      //setState(() {});
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
                                Languages.of(context)!.Inbox,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              /*Text(
                                '',
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
                      scrollController1.animateTo(0,
                          duration: Duration(microseconds: 2000),
                          curve: Curves.bounceIn);
                      complaintList2!.clear();
                      pageNum = 1;
                      getComplaintList(feederInchargeId,AppConstant.Complaint_Flug_Open, pageNum);
                      //setState(() {});
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
                             /* Text(
                                '',
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
                      status = 2;
                      scrollController1.animateTo(500,
                          duration: Duration(microseconds: 800),
                          curve: Curves.bounceIn);

                      complaintList3!.clear();
                      pageNum = 1;
                      getComplaintList(feederInchargeId,AppConstant.Complaint_Flug_Solved, pageNum);
                      //setState(() {});
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
                             /* Text(
                                '',
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
            controller: scrollController1,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              key: GlobalKey(),
              children: [
                status == 0
                    ? Container(width: ScreenRF.width(context), child: list1())
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
        itemCount:  complaintList1!.length,
        key: _scaffoldKey1,
        physics: ScrollPhysics(),
        controller: scrollController1,
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                         /* GapRF(5),
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
                                  fontSize: 12)),*/
                        ],
                      ),
                    ),
                    GapRF(10),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              ":  " +
                                  complaintList1![index].complaintId.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(
                              ":  " +
                                  complaintList1![index]
                                      .submittedDate
                                      .toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(
                              ":  " +
                                  complaintList1![index]
                                      .contactNumber
                                      .toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(
                              ":  " +
                                  complaintList1![index].ticketType.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                         /* GapRF(5),
                          Text(
                              ":  " + complaintList1![index].message.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(
                              ":  " +
                                  complaintList1![index]
                                      .faultAddress
                                      .toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),*/
                        ],
                      ),
                    )
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(Languages.of(context)!.Message+" :",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 12)),
                    Text(complaintList1![index].message.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                    GapRF(5),
                    Text(Languages.of(context)!.FaultAddress+" :",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 12)),
                    Text(complaintList1![index].faultAddress.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),

                  ],),
                ),

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
                    GapRF(10),
                    Column(
                      children: [
                        Text('- ' + Languages.of(context)!.File + '- ',
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
                    ),
                    GapRF(20),
                    Column(
                      children: [
                        Text('- ' + Languages.of(context)!.Response + '- ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 12)),
                        ElevatedButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red),
                            ),
                            onPressed: () {},
                            child: Text(
                              Languages.of(context)!.TakeAction,
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
        itemCount: complaintList2!.length,
        key: _scaffoldKey2,
        physics: ScrollPhysics(),
        controller: scrollController2,
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                       /*   GapRF(5),
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
                                  fontSize: 12)),*/

                        ],
                      ),
                    ),
                    GapRF(10),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              ":  " +
                                  complaintList2![index].complaintId.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(
                              ":  " +
                                  complaintList2![index]
                                      .submittedDate
                                      .toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(
                              ":  " +
                                  complaintList2![index]
                                      .contactNumber
                                      .toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(
                              ":  " +
                                  complaintList2![index].ticketType.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),


                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Languages.of(context)!.Message+" :",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 12)),
                      Text(complaintList2![index].message.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                      GapRF(5),
                      Text(Languages.of(context)!.FaultAddress+" :",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 12)),
                      Text(complaintList2![index].faultAddress.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                      GapRF(5),
                      Text(Languages.of(context)!.Instructions +":  " ,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 12)),

                      Text(complaintList2![index].instruction.toString(),
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.red.shade300,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),

                    ],),
                ),
                GapRF(20),
                Container(
                  width: MediaQuery.of(context).size.width,
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
                                        Languages.of(context)!.Solve,
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
              ],
            ),
          );
        });
  }

  list3() {
    return ListView.builder(
        itemCount: complaintList3!.length ,
        key: _scaffoldKey3,
        physics: ScrollPhysics(),
        controller: scrollController3,
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          /*GapRF(5),
                          Text(Languages.of(context)!.Message,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),*/
                          GapRF(5),
                          Text(Languages.of(context)!.FeederName,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                     /*     GapRF(5),
                          Text(Languages.of(context)!.Instructions,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(Languages.of(context)!.SolvedTime,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(Languages.of(context)!.Customerfeedback,
                              style: TextStyle(
                                  color: Colors.green.shade400,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),*/
                        ],
                      ),
                    ),
                    GapRF(10),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              ":  " +
                                  complaintList3![index].complaintId.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(
                              ":  " +
                                  complaintList3![index]
                                      .submittedDate
                                      .toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(
                              ":  " +
                                  complaintList3![index]
                                      .contactNumber
                                      .toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          GapRF(5),
                          Text(
                              ":  " +
                                  complaintList3![index].ticketType.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                         /* GapRF(5),
                          Text(":  " + complaintList3![index].message.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),*/
                          GapRF(5),
                          Text(":  " + complaintList3![index].feederName.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),

/*                            GapRF(5),
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
                          GapRF(5),
                          Text(":  " + "Very Good",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),*/
                        ],
                      ),
                    )
                  ],
                ),


                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Languages.of(context)!.Message+" :",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 12)),
                      Text(complaintList3![index].message.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                      GapRF(5),
                      Text(Languages.of(context)!.FaultAddress+" :",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 12)),
                      Text(complaintList3![index].faultAddress.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                      GapRF(5),
                      Text(Languages.of(context)!.Instructions +":  " ,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 12)),

                      Text(complaintList3![index].instruction.toString(),
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.red.shade300,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),

                      GapRF(5),
                      Text(Languages.of(context)!.Customerfeedback+ ":  " ,
                          style: TextStyle(
                              color: Colors.green.shade400,
                              fontWeight: FontWeight.normal,
                              fontSize: 12)),
                      Text( complaintList3![index].feedback.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),

                    ],),
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

  void getComplaintList(String employeeId, String status, int pageNumber) async {
    CommonOperation.showProgressDialog(
        context, Languages.of(context)!.DataLoading, true);
    final apiData = await networkCall.complaintList(employeeId, status, pageNumber);
    if (apiData != null) {

      for (int i = 0; i < apiData.length; i++) {
        Complaint complaint = Complaint();

        complaint.complaintId = apiData[i]['id'];
        complaint.customerName = apiData[i]['cus_name'];
        complaint.contactNumber = apiData[i]['cus_contact'];
        complaint.ticketType = apiData[i]['ticket_type'];
        complaint.message = apiData[i]['problem'];
        complaint.faultAddress = apiData[i]['fault_address'];
        complaint.faultLocation = apiData[i]['fault_location'];
        complaint.faultLocation = apiData[i]['fault_location'];
        complaint.complaintType = apiData[i]['status'];
        complaint.dataFrom = apiData[i]['from'];

        if (complaint.complaintType == AppConstant.Complaint_Flug_New) {
          complaintList1!.add(complaint);
        }else if (complaint.complaintType == AppConstant.Complaint_Flug_Open) {
          complaintList2!.add(complaint);
        }else if (complaint.complaintType == AppConstant.Complaint_Flug_Solved) {
          complaintList3!.add(complaint);
        }
      }

      CommonOperation.hideProgressDialog(context);
      setState(() {});
    }
  }

  void pagination1() async{

      print("Scroll");

      print("scrollController.position.extentAfter = ");
/*
      if (totalRecord == complaintList1!.length) {
        return;
      }
      print(scrollController.position.extentAfter);
      if (scrollController.position.extentAfter <= 0 && isPageLoading == false) {
        getComplaintList("xenkln1", AppConstant.Complaint_Flug_Open, 2);
      }*/

      if ((scrollController1.position.pixels ==
          scrollController1.position.maxScrollExtent) && (complaintList2!.length < totalRecord)) {
        setState(() {
          print("scrollController.position.extentAfter = Iner" );
         // load = true;
          pageNum += 1;
          getComplaintList(feederInchargeId, AppConstant.Complaint_Flug_Open, pageNum);
          //add api for load the more data according to new page
        });
      }
  }
  void pagination2() async{

      print("Scroll");

      print("scrollController.position.extentAfter = ");
/*
      if (totalRecord == complaintList1!.length) {
        return;
      }
      print(scrollController.position.extentAfter);
      if (scrollController.position.extentAfter <= 0 && isPageLoading == false) {
        getComplaintList("xenkln1", AppConstant.Complaint_Flug_Open, 2);
      }*/

      if ((scrollController2.position.pixels ==
          scrollController2.position.maxScrollExtent) ) {

        print("end");
        pageNum = pageNum+1;
        getComplaintList(feederInchargeId, AppConstant.Complaint_Flug_Open, pageNum);
        setState(() {

        });

        /* setState(() {
          print("scrollController.position.extentAfter = Iner" );
         // load = true;
          pageNum += 1;
          getComplaintList("xenkln1", AppConstant.Complaint_Flug_Open, pageNum);
          //add api for load the more data according to new page
        });*/
      }
  }
  void pagination3() async{

      print("Scroll");

      print("scrollController.position.extentAfter = ");
/*
      if (totalRecord == complaintList1!.length) {
        return;
      }
      print(scrollController.position.extentAfter);
      if (scrollController.position.extentAfter <= 0 && isPageLoading == false) {
        getComplaintList("xenkln1", AppConstant.Complaint_Flug_Open, 2);
      }*/

      if ((scrollController3.position.pixels ==
          scrollController3.position.maxScrollExtent) ) {
        print("Scroll End");

       /* setState(() {
          print("scrollController.position.extentAfter = Iner" );
         // load = true;
          pageNum += 1;
          getComplaintList("xenkln1", AppConstant.Complaint_Flug_Open, pageNum);
          //add api for load the more data according to new page
        });*/
      }
  }

 
}

