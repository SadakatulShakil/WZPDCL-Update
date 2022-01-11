import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wzpdcl_app_flutter/api/NetworkCall.dart';
import 'package:wzpdcl_app_flutter/components/gesture_icons.dart';
import 'package:wzpdcl_app_flutter/components/mycustom_appbar.dart';
import 'package:wzpdcl_app_flutter/constants.dart';
import 'package:wzpdcl_app_flutter/language/Languages%20.dart';
import 'package:wzpdcl_app_flutter/models/UserAuth/UserAuth.dart';
import 'package:wzpdcl_app_flutter/models/login/LoginWithArray.dart';
import 'package:wzpdcl_app_flutter/screens/BillList.dart';
import 'package:wzpdcl_app_flutter/screens/ComplaintList.dart';
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
import 'package:url_launcher/url_launcher.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import 'manage_account.dart';

/// This screen is partially built. The navigation needs to be fixed when the design
/// of all the pages are complete. This screen is the main screen for a logged in user
class CustomerHomeScreen extends StatefulWidget {
  List<String>? customerNo;

  @override
  _CustomerHomeScreenState createState() => _CustomerHomeScreenState();
  CustomerHomeScreen({Key? key, required this.customerNo}) : super(key: key);
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  List<Column> iconsAndText = [];
  NetworkCall networkCall = NetworkCall();
  CommonMenu customer = CommonMenu();
  LoginApi loginApi = LoginApi();
  String? _mobileNo = "";
  String? _meterNo = "";
  String? _customerName = "";
  String? _accountNo = "";
  bool? isEn;
  String? _selectedAccountNo;
  List<String>? customerNoList;
  bool _showCircle = true;


  var vectors;

  bodyMenu() {
    vectors = Map<String, GestureIcons>();

    vectors = {
      Languages.of(context)!.PayBill: GestureIcons(
        svgName: 'money.svg',
        onTapIcon: (context) {
          //print("HomeAccount: "+ _selectedAccountNo!);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => BillList(customerNo: widget.customerNo)));
        },
        commonPath: kCommonMenuVectorPath,
      ),
      Languages.of(context)!.LedgerNusuage: GestureIcons(
        svgName: 'ledgerIcon.svg',
        commonPath: kCommonMenuVectorPath,
        onTapIcon: (context) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LedgerList()));
        },
      ),
      Languages.of(context)!.BillCalculator: GestureIcons(
        svgName: 'bill.svg',
        commonPath: kCommonMenuVectorPath,
        onTapIcon: (context) {
          print("Bill clicked !");
          //CommonOperation.snackbar(context: context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DevelopmentInProcess()));
        },
      ),
      Languages.of(context)!.ManageAccount_: GestureIcons(
        svgName: 'manage_account.svg',
        commonPath: kCommonMenuVectorPath,
        onTapIcon: (context) {
         /* print("Manage clicked !");
          CommonOperation.snackbar(context: context);*/
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DevelopmentInProcess()));
        },
      ),
      Languages.of(context)!.DailComplaint: GestureIcons(
        svgName: 'dial.svg',
        commonPath: kCommonMenuVectorPath,
        onTapIcon: (context) {
          CommonOperation.callNumber(AppConstant.PHONE_NUMBER);
        },
      ),
      Languages.of(context)!.ComplaintList: GestureIcons(
        svgName: 'post_comp.svg',
        // screen: CustomerComplaintEntry(),
        commonPath: kCommonMenuVectorPath,
        onTapIcon: (context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ComplaintList(customerNo: widget.customerNo)));
        },
      ),
      Languages.of(context)!.SupportEmail: GestureIcons(
        svgName: 'mail.svg',
        commonPath: kCommonMenuVectorPath,
        onTapIcon: (context) async{
          launch('mailto:customercare@wzpdcl.gov.bd?subject=Need Support for WZPDCL&body= "Type your message here"');
        },
      ),
      Languages.of(context)!.OfficerLocation: GestureIcons(
        svgName: 'location_icon.svg',
        //screen: DevelopmentInProcess(),
        commonPath: kCommonMenuVectorPath,
        onTapIcon: (context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => OfficeCircleList()));
        },
      ),
      Languages.of(context)!.OfficerInfo: GestureIcons(
        svgName: 'office_info_icon.svg',
        //screen: DevelopmentInProcess(),
        commonPath: kCommonMenuVectorPath,
        onTapIcon: (context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => OfficeContactList()));
        },
      ),
      Languages.of(context)!.ApplyNewConnection: GestureIcons(
        svgName: 'new_connectionIcon.svg',
        // screen: ConnectionGuestScreen(),
        commonPath: kCommonMenuVectorPath,
        onTapIcon: (context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ConnectionGuestScreen()));
        },
      ),
      Languages.of(context)!.Survey: GestureIcons(
        svgName: 'survey.svg',
        //screen: DevelopmentInProcess(),
        commonPath: kCommonMenuVectorPath,
        onTapIcon: (context) {
          String url = AppConstant.getSurveyOrQuizUrl(
              _mobileNo!,
              _accountNo!,
              AppConstant.SURVEY,
              isEn! ? AppConstant.English : AppConstant.Bangla);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CommonOperation.webView(url)));
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
      Languages.of(context)!.Faq: GestureIcons(
        svgName: 'faq_icon.svg',
        // screen: DevelopmentInProcess(),
        commonPath: kCommonMenuVectorPath,
        onTapIcon: (context) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FaqPage()));
        },
      ),
      Languages.of(context)!.Quiz: GestureIcons(
        svgName: 'quiz.svg',
        // screen: DevelopmentInProcess(),
        commonPath: kCommonMenuVectorPath,
        onTapIcon: (context) {
          String url = AppConstant.getSurveyOrQuizUrl(
              _mobileNo!,
              _accountNo!,
              AppConstant.QUIZ,
              isEn! ? AppConstant.English : AppConstant.Bangla);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CommonOperation.webView(url)));
        },
      )
    };
  }

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
                textAlign: TextAlign.center, style: TextStyle(fontSize: 12))
          ],
        ),
      );
    }
  }

  //to pass API data from app home screen

  @override
  void initState() {
    super.initState();
    getSharedData();
    getUserData(widget.customerNo![0].toString());
  }


  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   loginApiRetrieveData();
    // });
    bodyMenu();
    createIconDisplay();
    if (_mobileNo == '') {
      getSharedData();
    }
    isEn = CommonOperation.isEn(context);
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
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Wrap(
                              direction: Axis.vertical,
                              spacing: 4,
                              children: [
                                Text(
                                  Languages.of(context)!.CustomerName,
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Text(
                                  Languages.of(context)!.MobileNo,
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Text(
                                  Languages.of(context)!.MeterNo,
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Text(
                                  Languages.of(context)!.CustomerNo,
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ]),
                          Wrap(
                            direction: Axis.vertical,
                            spacing: .5,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  strutStyle: StrutStyle(fontSize: 12.0),
                                  text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12),
                                      text: ":  ""${this._customerName}"),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(":  "'$_mobileNo',
                                  style: TextStyle(fontSize: 12),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text(":  "'$_meterNo',
                                  style: TextStyle(fontSize: 12),),
                              ),
                              /* Text(":  "'$_accountNo',
                                  style: TextStyle( fontSize: 12),),*/
                              Container(
                                height: 30,
                                child: DropdownButton<String>(
                                  // Not necessary for Option 1
                                  hint: Text(":  "+ widget.customerNo![0].toString(), style: TextStyle(fontSize: 12.0),),
                                  value: _selectedAccountNo,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedAccountNo = newValue;
                                      setDynamicPref(_selectedAccountNo!);
                                      getUserData(_selectedAccountNo.toString());
                                      print("Accoutn no: " + _selectedAccountNo.toString());
                                    });
                                  },
                                  items: widget.customerNo!.map((customerNo) {
                                    return DropdownMenuItem(
                                      child: new Text(': ' + customerNo,
                                        style: TextStyle(fontSize: 12),),
                                      value: customerNo,
                                    );
                                  }).toList(),
                                ),
                              )

                            ],
                          ),
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
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 5),
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
                      Row(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: iconsAndText.skip(8).take(4).toList()),
                      Flexible(
                        child: SizedBox(
                          height: 49.0,
                        ),
                      ),
                      Wrap(
                          spacing: 47.05,
                          textDirection: TextDirection.ltr,
                          verticalDirection: VerticalDirection.up,
                          alignment: WrapAlignment.start,
                          children: iconsAndText.skip(12).take(2).toList()),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void getSharedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    /* _mobileNo = prefs.getString(AppConstant.MOBILE_NO);
    _customerName = prefs.getString(AppConstant.CUSTOMER_NAME);
    _accountNo = prefs.getString(AppConstant.ACCOUNT_NUM);
    _meterNo = prefs.getString(AppConstant.METER_NUM);*/
    customerNoList = prefs.getStringList("accNoList")!;
    await prefs.setString(AppConstant.ACCOUNT_NUM, customerNoList![0].toString());
    setState(() {
      //getUserData(customerNoList![0].toString());
    });
  }

  void getUserData(String customerID) async {
    UserAuth? userData =
    await networkCall.userData(customerID);

    if (userData != null) {
      if (userData.ok!) {
        _mobileNo = userData.data!.mOBILENO.toString();
        _customerName = userData.data!.cUSTOMERNAME.toString();
        _meterNo = userData.data!.mETERNUM.toString();
      } else {
        print("Something went wrong for false!");
      }
    } else {
      print("There is no data !");
    }
    setState(() {

    });
  }

  void setDynamicPref(String selectedAccountNo) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstant.ACCOUNT_NUM, selectedAccountNo);
  }
}
