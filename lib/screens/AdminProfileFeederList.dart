import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wzpdcl_app_flutter/components/GapRF.dart';

import 'package:wzpdcl_app_flutter/components/mycustom_appbar.dart';
import 'package:wzpdcl_app_flutter/language/Languages%20.dart';
import 'package:wzpdcl_app_flutter/models/FeederIncharge.dart';
import 'package:wzpdcl_app_flutter/models/complaint/Complaint.dart';
import 'package:wzpdcl_app_flutter/screens/admin_home_screen.dart';
import 'package:wzpdcl_app_flutter/utils/AppConstant.dart';
import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';

class AdminProfileFeederList extends StatefulWidget {
  final apiData;

  @override
  _AdminProfileFeederListState createState() => _AdminProfileFeederListState();

  AdminProfileFeederList(this.apiData) : super(key: GlobalKey());
}

class _AdminProfileFeederListState extends State<AdminProfileFeederList> {
  ScrollController scrollController = ScrollController();

  bool isEn = true;

  String? designation = "";
  String? _name = "";
  String? _mobileNo = "";
  String? _userId;
  String? _email;
  String? _customerNo;
  String? _unitOffice;

  List<FeederIncharge>? feederList;

  @override
  void initState() {
    feederList = <FeederIncharge>[];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isEn = CommonOperation.isEn(context);
    getData();
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  designation == AppConstant.Feeder_Supervisor
                      ? Row(
                          children: [
                            Text(
                              Languages.of(context)!.Name + " : ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            GapRF(5),
                            Text('$_name'),
                          ],
                        )
                      : Container(),
                  GapRF(5),
                  Row(
                    children: [
                      Text(
                        Languages.of(context)!.MobileNo,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GapRF(5),
                      Text('$_mobileNo'),
                    ],
                  ),
                  GapRF(5),
                  Row(
                    children: [
                      Text(
                        Languages.of(context)!.Email + " : ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GapRF(5),
                      Text('$_email'),
                    ],
                  ),
                  GapRF(5),
                  Row(
                    children: [
                      Text(
                        Languages.of(context)!.UnitOffice,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GapRF(5),
                      Text('$_unitOffice'),
                    ],
                  ),
                  GapRF(5),
                  designation == AppConstant.Feeder_Supervisor
                      ? Row(
                          children: [
                            Text(
                              Languages.of(context)!.UserId,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            GapRF(5),
                            Text('$_userId'),
                          ],
                        )
                      : Container(),
                ],
              ) /*Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child:,
                  ),
                ],
              )*/
              ,
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Text(
              Languages.of(context)!.SelectFeederIncharge,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo.shade500),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: SingleChildScrollView(
            controller: scrollController,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              key: GlobalKey(),
              children: [
                Container(width: ScreenRF.width(context), child: list())
              ],
            ),
          )),
        ],
      ),
    );
  }

  list() {
    return ListView.builder(
        itemCount: feederList!.length,
        itemBuilder: (context, index) {
          return InkWell(
              child: Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(15),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text((index + 1).toString() + "."),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                isEn
                                    ? feederList![index].feederName.toString()
                                    : feederList![index]
                                        .feederNameBn
                                        .toString(),
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        // Align(alignment: Alignment.centerRight,child: Image.asset('assets/images/pdf.png',height: 40,width: 40,),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(Languages.of(context)!.MobileNo),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          isEn
                              ? feederList![index]
                                  .feederInchargeMobileNo
                                  .toString()
                              : feederList![index]
                                  .feederInchargeMobileNo
                                  .toString(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(Languages.of(context)!.Email),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          feederList![index].feederEmail.toString(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(Languages.of(context)!.UserId),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          feederList![index].feederInchargeUserId.toString(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              onTap: () {
                CommonOperation.openNewPage(
                    context, AdminHomeScreen(feederList![index]));

                /* Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                      CommonOperation.pdfView("http://www.africau.edu/images/default/sample.pdf")
                  ));*/
              });
        });
  }

  void getData() async {
    /* SharedPreferences prefs = await SharedPreferences.getInstance();

    String? data = prefs.getString(AppConstant.ADMIN_LOGIN_DATA);*/

    if (widget.apiData != null) {
      designation = widget.apiData['designation'];

      if (widget.apiData['designation'] == AppConstant.Office_Head) {
        _mobileNo = widget.apiData["data"]["office_head_mobile_no"];
        _unitOffice = isEn
            ? widget.apiData["data"]["unit_office_name"]
            : widget.apiData["data"]["unit_office_name_bn"];
        _email = widget.apiData["data"]["office_head_email_address"];
      } else if (widget.apiData['designation'] ==
          AppConstant.Feeder_Supervisor) {
        _mobileNo = widget.apiData["data"]["feeder_supervisor_mobile_no"];
        _unitOffice = isEn
            ? widget.apiData["data"]["substation_name"]
            : widget.apiData["data"]["substation_name_bn"];
        _email = widget.apiData["data"]["office_supervisor_email"];
        _userId = widget.apiData["data"]["feeder_supervisor_user_id"];
        _name = isEn
            ? widget.apiData["data"]["office_supervisor_name"]
            : widget.apiData["data"]["office_supervisor_name_bn"];
      }

      final feederListData = widget.apiData["feeder_incharge"];
      final feederProfileData = widget.apiData["data"];

      for (int i = 0; i < feederListData.length; i++) {
        FeederIncharge feederIncharge = FeederIncharge();
        feederIncharge.subDesignation = feederListData[i]['sub_designation'];
        feederIncharge.feederInchargeUserId =
            feederListData[i]['feeder_incharge_user_id'];
        feederIncharge.feederNo = feederListData[i]['feeder_no'];
        feederIncharge.feederName = feederListData[i]['feeder_name'];
        feederIncharge.feederNameBn = feederListData[i]['feeder_name_bn'];
        feederIncharge.feederLocation = feederListData[i]['feeder_location'];
        feederIncharge.feederLocationBn =
            feederListData[i]['feeder_location_bn'];
        feederIncharge.feederEmail = feederListData[i]['feeder_email'];
        feederIncharge.feederInchargeMobileNo =
            feederListData[i]['feeder_incharge_mobile_no'];
        feederList!.add(feederIncharge);
      }
    }
  }
}
