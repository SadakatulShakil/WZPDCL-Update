import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wzpdcl_app_flutter/api/NetworkCall.dart';
import 'package:wzpdcl_app_flutter/components/GapRF.dart';
import 'package:wzpdcl_app_flutter/components/gesture_icons.dart';
import 'package:wzpdcl_app_flutter/components/mycustom_appbar.dart';
import 'package:wzpdcl_app_flutter/constants.dart';
import 'package:wzpdcl_app_flutter/language/Languages%20.dart';
import 'package:wzpdcl_app_flutter/models/FeederIncharge.dart';
import 'package:wzpdcl_app_flutter/screens/BillList.dart';
import 'package:wzpdcl_app_flutter/screens/ComplaintList.dart';
import 'package:wzpdcl_app_flutter/screens/ComplaintListAdmin.dart';
import 'package:wzpdcl_app_flutter/screens/FaqPage.dart';
import 'package:wzpdcl_app_flutter/screens/LedgerList.dart';
import 'package:wzpdcl_app_flutter/screens/NewsUpdate.dart';
import 'package:wzpdcl_app_flutter/screens/office_location_map/office_circle_list.dart';
import 'package:wzpdcl_app_flutter/screens/office_location_map/office_contact_list.dart';
import 'package:wzpdcl_app_flutter/screens/user_login_screen.dart';
import 'package:wzpdcl_app_flutter/screens/feeder/feeder_incharge_complaint_stat.dart';
import 'package:wzpdcl_app_flutter/screens/ledger&usage/ledger_large_screen_stat.dart';
import 'package:wzpdcl_app_flutter/screens/new_connection_guest_screen.dart';
import 'package:wzpdcl_app_flutter/utils/AppConstant.dart';
import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';
import 'customer_complaint_entry.dart';
import 'development_in_process.dart';
import 'package:wzpdcl_app_flutter/components/loginAPI.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import 'manage_account.dart';

/// This screen is partially built. The navigation needs to be fixed when the design
/// of all the pages are complete. This screen is the main screen for a logged in user
class AdminHomeScreen extends StatefulWidget {
  FeederIncharge? feederIncharge;

  AdminHomeScreen(this.feederIncharge,{Key? key}) : super(key: key);

  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {



  var vectors;

  bodyMenu() {

    vectors = Map<String, GestureIcons>();

    vectors = {
      Languages.of(context)!.ComplaintDashboard: GestureIcons(
        svgName: 'post_comp.svg',
        commonPath: kCommonMenuVectorPath,
        onTapIcon: (context) {
          print(feederInchargeData!.feederInchargeUserId);
          CommonOperation.openNewPage(context, ComplaintListAdmin(feederInchargeData!));
         /* Navigator.push(
              context, MaterialPageRoute(builder: (context) => ));*/
        },
      ),
      Languages.of(context)!.NewConnectionDashboard: GestureIcons(
        svgName: 'new_connectionIcon.svg',
        commonPath: kCommonMenuVectorPath,
        onTapIcon: (context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ConnectionGuestScreen()));
        },
      ),
      Languages.of(context)!.ChecknBill: GestureIcons(
        svgName: 'check_bill.svg',
        commonPath: kCommonMenuVectorPath,
        onTapIcon: (context) {

          CommonOperation.snackbar(context: context);
          /*Navigator.push(context,
              MaterialPageRoute(builder: (context) => DevelopmentInProcess()));*/
        },
      ),
      Languages.of(context)!.BillCalculator: GestureIcons(
        svgName: 'bill.svg',
        commonPath: kCommonMenuVectorPath,
        onTapIcon: (context) {
          CommonOperation.snackbar(context: context);
         /* Navigator.push(context,
              MaterialPageRoute(builder: (context) => DevelopmentInProcess()));*/
        },
      ),
      Languages.of(context)!.MasterDataUpdate: GestureIcons(
        svgName: 'manage_account.svg',
        commonPath: kCommonMenuVectorPath,
        onTapIcon: (context) {
          CommonOperation.snackbar(context: context);
         /* Navigator.push(
              context, MaterialPageRoute(builder: (context) => ManageAccount()));*/
        },
      ),

      Languages.of(context)!.CallCenter: GestureIcons(
        svgName: 'call_center_icon.svg',
        //screen: DevelopmentInProcess(),
        commonPath: kCommonMenuVectorPath,
        onTapIcon: (context){
          CommonOperation.callNumber(AppConstant.PHONE_NUMBER);
          ///Navigator.push(context, MaterialPageRoute(builder: (context)=> DevelopmentInProcess()));
        },
      ),

      Languages.of(context)!.UpdateNews: GestureIcons(
        svgName: 'news.svg',
        // screen: DevelopmentInProcess(),
        commonPath: kCommonMenuVectorPath,
        onTapIcon: (context) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewsUpdate()));
        },
      ),


    };
  }

  List<Column> iconsAndText = [];
  CommonMenu customer = CommonMenu();
  LoginApi loginApi = LoginApi();
  String? _mobileNo = "";
  String? _userId;
  String? _email;
  String? _name;
  String? _customerNo;
  String? _unitOffice;
  late List<String> feederList;


  bool isEn = true;

  void createIconDisplay() {
    iconsAndText.clear();
    for (String key in vectors.keys) {
      iconsAndText.add(
        Column(
          children: [
            vectors[key]!,
            SizedBox(
              height: 5,
            ),
            Text(key,
                textAlign: TextAlign.center, style: TextStyle(fontSize: 10))
          ],
        ),
      );
    }
  }

  FeederIncharge? feederInchargeData;

  //to pass API data from app home screen

  @override
  void initState() {

    if(widget.feederIncharge == null){
      print("null");
    }else{
      feederInchargeData = widget.feederIncharge;
      print("Not Null");
    }
    super.initState();

  }



  void getSharedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _mobileNo = prefs.getString(AppConstant.MOBILE_NO);
    _customerNo = prefs.getString(AppConstant.CUSTOMER_NO);
    _customerNo = prefs.getString(AppConstant.ACCOUNT_NUM);
    _unitOffice = prefs.getString(AppConstant.UNIT_OFFICE);
    feederList = ["Abcd", "Mnop"];
    setState(() {});
  }

  void getData()  async {
    /*_mobileNo = widget.apiData["data"]["feeder_supervisor_mobile_no"];
    _unitOffice = isEn?widget.apiData["data"]["substation_name"]: widget.apiData["data"]["substation_name_bn"];
    _email = widget.apiData["data"]["office_supervisor_email"];
    _userId = widget.apiData["data"]["feeder_supervisor_user_id"];
    _name =isEn? widget.apiData["data"]["office_supervisor_name"]:widget.apiData["data"]["office_supervisor_name_bn"];*/
  }

  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   loginApiRetrieveData();
    // });
    isEn = CommonOperation.isEn(context);
    getData();
    bodyMenu();
    createIconDisplay();


   /* if(_mobileNo == ""){
      getSharedData();
    }*/



    return Scaffold(
      appBar: MyCustomAppBar(
        context: context,
      ),
      body: SafeArea(
        child: Column(
          //changes bcz of renderflex overflow
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          boxShadow: [BoxShadow(color: Colors.white)],
                          /* border:
                              Border.all(width: 2, color: Color(0xFF2D3192)),
                          shape: BoxShape.rectangle,*/
                        ),
                        child: ClipRRect(
                          child: Image.asset('assets/images/user.png'),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              GapRF(20),
                              Text(
                                Languages.of(context)!.Name+" : ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              GapRF(5),
                              Text( isEn? widget.feederIncharge!.feederName.toString(): widget.feederIncharge!.feederNameBn.toString())
                            ],
                          ),
                          GapRF(5),
                          Row(
                            children: [
                              GapRF(20),
                              Text(
                                Languages.of(context)!.MobileNo,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              GapRF(5),
                              Text(widget.feederIncharge!.feederInchargeMobileNo.toString())
                            ],
                          ),
                          GapRF(5),
                          Row(
                            children: [
                              GapRF(20),
                              Text(
                                Languages.of(context)!.UserId,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              GapRF(5),
                              Text(widget.feederIncharge!.feederInchargeUserId.toString()),
                            ],
                          ),
                          GapRF(5),
                          Row(
                            children: [
                              GapRF(20),
                              Text(
                                Languages.of(context)!.Email +" : ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              GapRF(5),
                              Text(widget.feederIncharge!.feederEmail.toString()),
                            ],
                          ),
                        /*  Row(
                            children: [
                              GapRF(20),
                              Text(
                                Languages.of(context)!.CustomerNo,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              GapRF(5),
                              Text('$_customerNo'),
                            ],
                          ),
                          GapRF(5),*/
                        /*  Row(
                            children: [
                              GapRF(20),
                              Text(
                                Languages.of(context)!.UnitOffice,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              GapRF(5),
                              Text(widget.feederIncharge.feederNo.toString()),
                            ],
                          ),*/

                         /* Row(
                            children: [
                              GapRF(20),
                              Text(
                                Languages.of(context)!.Feeder,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              GapRF(5),
                              DropdownButton<String>(
                                items: feederList.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (_) {},
                              )
                            ],
                          ),*/

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 7.0,
              child: Divider(
                thickness: 7.0,
                color: Colors.white60,
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: iconsAndText.take(4).toList(),
                  ),
                  Flexible(
                    child: SizedBox(
                      height: 49.0,
                    ),
                  ),
                  Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: iconsAndText.skip(4).take(4).toList()),
                  Flexible(
                    child: SizedBox(
                      height: 49.0,
                    ),
                  ),


                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
