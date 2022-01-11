import 'dart:async';
import 'dart:ui';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:marquee/marquee.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wzpdcl_app_flutter/api/NetworkCall.dart';
import 'package:wzpdcl_app_flutter/components/GapRF.dart';
import 'package:wzpdcl_app_flutter/components/appbar_for_login_page.dart';
import 'package:wzpdcl_app_flutter/components/custom_button.dart';
import 'package:wzpdcl_app_flutter/components/custom_textfield.dart';
import 'package:wzpdcl_app_flutter/components/gesture_icons.dart';
import 'package:wzpdcl_app_flutter/constants.dart';
import 'package:wzpdcl_app_flutter/language/Languages%20.dart';
import 'package:wzpdcl_app_flutter/models/login/Login.dart';
import 'package:wzpdcl_app_flutter/models/login/LoginWithArray.dart';
import 'package:wzpdcl_app_flutter/screens/CustomerGuideLine.dart';
import 'package:wzpdcl_app_flutter/screens/FaqPage.dart';
import 'package:wzpdcl_app_flutter/screens/new_connection_guest_screen.dart';
import 'package:wzpdcl_app_flutter/screens/office_location_map/office_contact_list.dart';
import 'package:wzpdcl_app_flutter/screens/signup.dart';
import 'package:wzpdcl_app_flutter/screens/verify_phone_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wzpdcl_app_flutter/utils/AppColor.dart';
import 'package:wzpdcl_app_flutter/utils/AppConstant.dart';
import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';

import 'NewsUpdate.dart';
import 'faq_list.dart';
import 'office_location_map/office_circle_list.dart';

class CommonMenu extends StatefulWidget {
  String? customerMobileNoField;
  String? customerHomeNoField;

  CommonMenu({Key? key}) : super(key: key);

  @override
  _CommonMenuState createState() => _CommonMenuState();
}

class _CommonMenuState extends State<CommonMenu> {
  final customerNoController = TextEditingController();
  final mobileNoController = TextEditingController();

  loginValidation _validate = loginValidation.Correct;
  List<String> accountNoList =[];
  NetworkCall networkCall = NetworkCall();
  bool _useRtlText = false;

  String newHeadlines = "News loading";
  String newHeadlinesBn = "নিউজ লোড হচ্ছে.....";
  bool isEn = true;

  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    Future.delayed(const Duration(milliseconds: 100), () {
      getList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //setDemoLogin();
    isEn = CommonOperation.isEn(context);
    setMenu();
    createIconDisplay();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarUserLogin(context: context),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /* CustomTextField(
                    Languages.of(context)!.Enter9DigitCustomerNo,
                    errorText: showCustomerNoError(),
                    controller: customerNoController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _validate = loginValidation.Correct;

                        widget.customerHomeNoField = value;
                      });
                      //  _customerNo = value;
                    },
                    suffixIcon: GestureDetector(
                      child: Icon(Icons.clear),
                      onTap: () {
                        setState(() {
                          customerNoController.clear();
                        });
                      },
                    ),
                  ),*/
                  SizedBox(
                    height: 15.0,
                  ),
                  CustomTextField(
                    Languages.of(context)!.EnterValidMobileNo,
                    errorText: showMobileNoError(),
                    controller: mobileNoController,
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      setState(() {
                        _validate = loginValidation.Correct;
                        widget.customerMobileNoField = value;
                      });
                      //  _mobileNo = value;
                    },
                    suffixIcon: GestureDetector(
                      child: Icon(Icons.clear),
                      onTap: () {
                        setState(() {
                          mobileNoController.clear();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10.0),
                    child: MyCustomButton(
                        width: 100,
                        buttonText: Languages.of(context)!.login,
                        onTap: () {
                          print('clicked');
                          setState(() {
                            // check if track empty
                            /*   if (customerNoController.text.isEmpty) {
                              _validate = loginValidation.customerNoEmpty;
                            } else if (mobileNoController.text.isEmpty) {
                              _validate = loginValidation.mobileNoEmpty;
                            } else if (customerNoController.text.length < 9 ||
                                customerNoController.text.length > 9) {
                              _validate = loginValidation.wrongCustomerNoLength;
                            } else if (mobileNoController.text.length < 11 ||
                                mobileNoController.text.length > 11) {
                              _validate = loginValidation.wrongMobileNoLength;
                            } else {
                              CommonOperation.showProgressDialog(context, Languages.of(context)!.PleasewaitLoginProcessing, true);

                              // c.showProgress(context);
                              //progressDialog.show();
                              getLoginInformation2();
                            }*/

                            if (mobileNoController.text.isEmpty) {
                              _validate = loginValidation.mobileNoEmpty;
                            } else if (mobileNoController.text.length < 11 ||
                                mobileNoController.text.length > 11) {
                              _validate = loginValidation.wrongMobileNoLength;
                            } else {
                              CommonOperation.showProgressDialog(
                                  context,
                                  Languages.of(context)!
                                      .PleasewaitLoginProcessing,
                                  true);

                              // c.showProgress(context);
                              //progressDialog.show();
                              getLoginInformation2();
                            }

                            print(_validate.toString());
                          });
                        })),
                SizedBox(
                  child: Text(Languages.of(context)!.or),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10.0),
                  child: MyCustomButton(
                    // buttonText: 'Sign Up',
                    buttonText: Languages.of(context)!.signup,
                    onTap: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                      /*   TicketParams  ticketParams = TicketParams();
                      ticketParams.employeeId = "xenkln1";
                      ticketParams.UserID = 140;
                      ticketParams.circleId = "78";
                      List<Ticket>? list =  await networkCall.getTicketList2(ticketParams);

                      if(list != null) {
                        if (list.length > 0) {
                          print(list.first.cusName);
                        }
                      }*/

                      //  networkCall.sendSMSBiaWZAPI("+8801670497887", "1234");
                      // networkCall.getFeedbackFromSheet();

                      //CommonOperation.getFaqData();

                      //networkCall.getNewsList();
                      //networkCall.getNews();
                      //networkCall.postComplaint();
                     // networkCall.adminLogin();

                     /* Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => new WebviewScaffold(
                              url: kSignUpUrl,
                              appBar: AppBar(
                                title: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.bolt,
                                        color: Colors.white,
                                      ),
                                      Text('WZPDCL'),
                                    ]),
                                centerTitle: true,
                              ),
                            ),
                          ));*/
                    },
                    width: 100,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: iconsAndText.take(3).toList(),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: iconsAndText.skip(3).take(3).toList(),
                  ),
                ],
              ),
            )),
            Text('-'+Languages.of(context)!.NewsUpdate+'-',
                      style: TextStyle(
                        color: AppColor.colorPrimary(),
                      )),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewsUpdate()));
              },
              child: Container(
                height: 35,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green.shade500,
                 // borderRadius: BorderRadius.only(),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),

                      /// changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     /*Text('-News-',
                      style: TextStyle(
                        color: Colors.white,
                      )),*/
                    /* Marquee(
                    text: 'There once was a boy who told this story about a boy: "',
                  ),*/

                    Expanded(
                      child: Marquee(
                        key: Key("$_useRtlText"),
                        text: isEn? newHeadlines: newHeadlinesBn,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                        scrollAxis: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        blankSpace: 20.0,
                        velocity: 30.0,
                        pauseAfterRound: Duration(seconds: 1),
                        startPadding: 10.0,
                        accelerationDuration: Duration(seconds: 1),
                        accelerationCurve: Curves.linear,
                        decelerationDuration: Duration(milliseconds: 500),
                        decelerationCurve: Curves.easeOut,
                      ),
                    ),

                    /* Expanded(
                    child: ListView(
                      shrinkWrap: true,
                        padding: EdgeInsets.only(top: 5.0),
                        children: [
                          _buildMarquee(),
                          _buildComplexMarquee(),
                        ].map(_wrapWithStuff).toList()),
                  ),*/
                  ],
                ),
              ),
            ),
            GapRF(10),
            Container(
                alignment: Alignment.center,
                height: 40,
                width: double.infinity,
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Icon(
                        Icons.bolt,
                        size: 15,
                        color: Color(0xFF2D3192),
                      ),
                      Icon(
                        Icons.bolt,
                        size: 15,
                        color: Color(0xFF2D3192),
                      ),
                      Icon(
                        Icons.bolt,
                        size: 15,
                        color: Color(0xFF2D3192),
                      )
                    ]),
                    Text(
                        Languages.of(context)!
                            .WestZonePowerDistributionCompanyLimited,
                        style:
                            TextStyle(fontSize: 9.0, color: Color(0xFF969696))),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void getList() async {
    CommonOperation.showProgressDialog(
        context, Languages.of(context)!.DataLoading, true);
    final apiData = await networkCall.getNewsHeadLine();
    if (apiData != null) {
      newHeadlines = apiData["news_header"]["news_en"].toString();
      newHeadlinesBn = apiData["news_header"]["news_bn"].toString();
      CommonOperation.hideProgressDialog(context);
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() async {
    //setMenu();
    super.didChangeDependencies();
  }

  var vectors;
  List<Column> iconsAndText = [];

  setMenu() {
    print("setMenu ABCD");
    vectors = Map<String, GestureIcons>();
    vectors = {
      Languages.of(context)!.ApplyNewConnection: GestureIcons(
        svgName: 'new_connectionIcon.svg',
        //screen: ConnectionGuestScreen(),
        commonPath: kCommonMenuVectorPath,
        onTapIcon: (context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ConnectionGuestScreen()));
        },
      ),
      Languages.of(context)!.CustomerGuideline: GestureIcons(
        svgName: 'customer_guide_icon.svg',
        //screen: CustomerGuideLine(),
        commonPath: kCommonMenuVectorPath,
        onTapIcon: (context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CustomerGuideLine()));
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
      Languages.of(context)!.CallCenter: GestureIcons(
        svgName: 'call_center_icon.svg',
        //screen: DevelopmentInProcess(),
        commonPath: kCommonMenuVectorPath,
        onTapIcon: (context) {
          CommonOperation.callNumber(AppConstant.PHONE_NUMBER);

          ///Navigator.push(context, MaterialPageRoute(builder: (context)=> DevelopmentInProcess()));
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
      Languages.of(context)!.Faq: GestureIcons(
        svgName: 'faq_icon.svg',
        // screen: DevelopmentInProcess(),
        commonPath: kCommonMenuVectorPath,
        onTapIcon: (context) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FaqPage()));
        },
      ),
    };
  }

  void createIconDisplay() {
    iconsAndText.clear();
    for (String key in vectors!.keys) {
      iconsAndText.add(
        Column(
          children: [
            vectors![key]!,
            GapRF(5),
            Text(key,
                textAlign: TextAlign.center, style: TextStyle(fontSize: 12))
          ],
        ),
      );
    }
  }

  /* getLoginInformation() async {
    Login? login = await networkCall.login2(
        widget.customerMobileNoField, widget.customerHomeNoField);

    if (login != null) {

      if (login.ok!) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(
            AppConstant.CUSTOMER_NAME, login.data!.cUSTOMERNAME.toString());
        await prefs.setString(
            AppConstant.MOBILE_NO, login.data!.mOBILENO.toString());
        await prefs.setString(
            AppConstant.METER_NUM, login.data!.mETERNUM.toString());
        await prefs.setString(
            AppConstant.ACCOUNT_NUM, login.data!.aCCOUNTNUM.toString());
        await prefs.setBool(AppConstant.IS_LOGGED_IN, true);
        await prefs.setBool(AppConstant.IS_VERIFIED, false);

        print(prefs.getString(AppConstant.CUSTOMER_NAME));

        String otp = CommonOperation.getOtp();

        final apiData = await networkCall.sendSMSBiaWZAPI(mobileNoController.text, otp);

        if(apiData != null){

          bool status = apiData["ok"];

          if(status){
            CommonOperation.hideProgressDialog(context);

            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return VerifyPhoneScreen(
                phoneNumber: mobileNoController.text, otp: otp,
              );
            }));

            setState(() {
              */ /*  _mobileNo = loginApi.mobileNo;
        _customerNo = loginApi.customerNo;*/ /*
            });
          }


        }else {
          CommonOperation.hideProgressDialog(context);
          errorMobileOrCustomerAlert(context);
        }


      } else {
        CommonOperation.hideProgressDialog(context);
        errorMobileOrCustomerAlert(context);
      }
    } else {
      CommonOperation.hideProgressDialog(context);
      //progressDialog.hide();
      errorMobileOrCustomerAlert(context);
    }
  }*/

  getLoginInformation2() async {
    LoginWithArray? login =
        await networkCall.login3(widget.customerMobileNoField);

    if (login != null) {
      if (login.data!.length != 0) {
        if (login.ok!) {
          //Data? userData = login.data[0];

          SharedPreferences prefs = await SharedPreferences.getInstance();
          for(int i =0; i<login.data!.length; i++){
            accountNoList.add(login.data![i].aCCOUNTNUM.toString());
          }
          await prefs.setString(AppConstant.CUSTOMER_NAME,
              login.data![0].cUSTOMERNAME.toString());
          await prefs.setString(
              AppConstant.MOBILE_NO, login.data![0].mOBILENO.toString());
          await prefs.setString(
              AppConstant.METER_NUM, login.data![0].mETERNUM.toString());
          await prefs.setString(
              AppConstant.ACCOUNT_NUM, login.data![0].aCCOUNTNUM.toString());
          await prefs.setString(
              AppConstant.CUSTOMER_ADDRESS, login.data![0].cUSTOMERADDRESS.toString());
          await prefs.setString(
              AppConstant.CUSTOMER_DISTRICT, login.data![0].dISTRICT.toString());
          await prefs.setString(
              AppConstant.CUSTOMER_UPAZILA, login.data![0].uPAZILA.toString());
          await prefs.setString(
              AppConstant.TARIFF, login.data![0].tARIFF.toString());
          await prefs.setString(
              AppConstant.SANC_LOAD, login.data![0].sANCLOAD.toString());
          await prefs.setString(
              AppConstant.CUSTOMER_EMAIL, login.data![0].eMAIL.toString());
          await prefs.setBool(AppConstant.IS_LOGGED_IN, true);
          await prefs.setBool(AppConstant.IS_VERIFIED, false);
          await prefs.setStringList("accNoList", accountNoList);

          print("AccountNo: "+accountNoList.toString());
          print("AccountNoOne: "+accountNoList[0].toString());
          print("UserName: "+prefs.getString(AppConstant.CUSTOMER_NAME).toString());

          //String otp = CommonOperation.getOtp();
          String otp = "123456";

          final apiData =
              await networkCall.sendSMSBiaWZAPI(mobileNoController.text, otp);

          if (apiData != null) {
            bool status = apiData["ok"];

            if (status) {
              CommonOperation.hideProgressDialog(context);

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return VerifyPhoneScreen(
                  phoneNumber: mobileNoController.text,
                  otp: otp,
                  customerNo: accountNoList,
                );
              }));

              setState(() {
                /*  _mobileNo = loginApi.mobileNo;
        _customerNo = loginApi.customerNo;*/
              });
            }
          } else {
            CommonOperation.hideProgressDialog(context);
            errorMobileOrCustomerAlert(context);
          }
        } else {
          CommonOperation.hideProgressDialog(context);
          errorMobileOrCustomerAlert(context);
        }
      } else {
        CommonOperation.hideProgressDialog(context);
        errorMobileOrCustomerAlert(context);
      }
    } else {
      CommonOperation.hideProgressDialog(context);
      //progressDialog.hide();
      errorMobileOrCustomerAlert(context);
    }
  }

  errorMobileOrCustomerAlert(context) async {
    await Alert(
      context: context,
      title: Languages.of(context)!.Error,
      desc: Languages.of(context)!.PleaseProvideCcorrectInformation,
      buttons: [
        DialogButton(
          child: Text(
            Languages.of(context)!.TryAgain,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            mobileNoController.clear();
            customerNoController.clear();
            return Navigator.pop(context);
          },
          width: 120,
        )
      ],
    ).show();

    // Code will continue after alert is closed.
    debugPrint("Alert closed now.");
  }

  showCustomerNoError() {
    if (_validate == loginValidation.customerNoEmpty) {
      return Languages.of(context)!.EmptyField;
    } else if (_validate == loginValidation.wrongCustomerNoLength) {
      return Languages.of(context)!.Enter9DigitCustomerNo;
    } else {
      return null;
    }
  }

  showMobileNoError() {
    if (_validate == loginValidation.mobileNoEmpty) {
      return Languages.of(context)!.EmptyField;
    } else if (_validate == loginValidation.wrongMobileNoLength) {
      return Languages.of(context)!.EnterValidMobileNo;
    } else {
      return null;
    }
  }

  void setDemoLogin() {
    customerNoController.text = '201129724';
    widget.customerHomeNoField = '201129724';
    mobileNoController.text = '01716000444';
    widget.customerMobileNoField = '01716000444';
  }
}
