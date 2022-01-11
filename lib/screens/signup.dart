import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wzpdcl_app_flutter/api/NetworkCall.dart';
import 'package:wzpdcl_app_flutter/components/custom_button.dart';
import 'package:wzpdcl_app_flutter/language/Languages%20.dart';
import 'package:wzpdcl_app_flutter/models/login/LoginWithArray.dart';
import 'package:wzpdcl_app_flutter/screens/verify_phone_screen.dart';
import 'package:wzpdcl_app_flutter/utils/AppConstant.dart';
import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';
import '../components/mycustom_appbar.dart';
import '../components/custom_textfield.dart';
import 'package:wzpdcl_app_flutter/models/SignUpRes/SignUpResponse.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
//TODO: add VALIDATION
/// The requirement of this page is not yet decided. Delete the class and the
/// page if not required. The validation is required and the functionality of this
/// page is same as the functionality of the SignUpRes in Home Screen.
/// The page is partially built, some functionalities need to be added to make it
/// fully functional
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  List<String> accountNoList =[];
  NetworkCall networkCall = NetworkCall();
  bool subsCheckBox = false;
  String accountNumber = "";
  String mobileNumber = "";
  String email = "";
  final mobileNumberController = TextEditingController();
  final accountNumberController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(context: context,),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Column(
            children: [
              //headline row
              Container(
                margin: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.clear,
                      color: Colors.grey,
                    ),
                    Text(
                      Languages.of(context)!.signup,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 30.0,
                        color: Color(0XFF2D3192),
                      ),
                    ),
                    Text(
                      Languages.of(context)!.login,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: Color(0XFF2D3192),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: Languages.of(context)!.account,
                  ),
                  controller: accountNumberController,

                  onChanged: (value) {
                    accountNumber = value;
                  },
                ),
              ),
              SizedBox(
                height: 6.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: Languages.of(context)!.mobile,
                  ),
                  controller: mobileNumberController,

                  onChanged: (value) {
                    mobileNumber = value;
                  },
                ),
              ),
              SizedBox(
                height: 6.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: Languages.of(context)!.e_mail,
                  ),
                  controller: emailController,

                  onChanged: (value) {
                    email = value;
                  },
                ),
              ),
              SizedBox(
                height: 6.0,
              ),
             /* Container(
                  child: Row(
                children: [
                  Checkbox(
                      value: this.subsCheckBox,
                      onChanged: (value) {
                        setState(() {
                          subsCheckBox = value!;
                        });
                      }),
                  Text(
                    'I would like to receive your newsletter and other promotional\ninformation and agree with all sorts of terms and conditions.',
                    style: TextStyle(fontSize: 10.0, color: Color(0xFF666666)),
                  ),
                ],
              )),*/
              //320.22px
              SizedBox(
                height: 6.0,
              ),
              //TODO: Add Button functionalities
              MyCustomButton(buttonText: Languages.of(context)!.signup_btn, onTap: (){
                CommonOperation.showProgressDialog(
                    context,
                    Languages.of(context)!
                        .PleasewaitProcessing,
                    true);
                signUpCall();
                //openCaptcha();
              })
            ],
          ),
        ),
      ),
    );
  }

  // void openCaptcha() async{
  //   String tokenResult = await GCaptcha.reCaptcha("6LdFytodAAAAAN952kptWje8XE9LcAvFOF2Zky4a");
  //   print('tokenResult: $tokenResult');
  //   //Fluttertoast.showToast(msg: tokenResult, timeInSecForIosWeb: 4);
  //   /*AlertDialog alert = AlertDialog(
  //     title: Text("Verify !"),
  //     content: Container(
  //       height: 200,
  //       child: WebViewPlus(
  //         javascriptMode: JavascriptMode.unrestricted,
  //         onWebViewCreated: (controller){
  //           controller.loadUrl("assets/webpages/index.html");
  //         },
  //         javascriptChannels: Set.from([
  //           JavascriptChannel(name: 'Captcha', onMessageReceived: (JavascriptMessage message){
  //
  //             print("Verified !");
  //           })
  //         ]),
  //   ),
  //     ));
  //
  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );*/
  // }

  void signUpCall() async{

    SignUpRes? signUpData =
    await networkCall.signUpRes(accountNumber, mobileNumber, email);

    if(signUpData!.ok!){
      accountNumberController.clear();
      mobileNumberController.clear();
      emailController.clear();
      if(accountNumber == "" || accountNumber == null){
        showToastMessage(Languages.of(context)!
            .validedCustomerNo);
      }else if(mobileNumber == "" || mobileNumber == null){
        showToastMessage(Languages.of(context)!
            .validedMobileNo);
      }else if(email == "" || email == null){
        showToastMessage(Languages.of(context)!
            .validedEmail);
      }else{
        getLoginInformation2();
      }

    print("output: "+signUpData.msg.toString());
    }

  }

  getLoginInformation2() async {
    LoginWithArray? login =
    await networkCall.login3(mobileNumber);

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
          await networkCall.sendSMSBiaWZAPI(mobileNumber, otp);

          if (apiData != null) {
            bool status = apiData["ok"];

            if (status) {
              CommonOperation.hideProgressDialog(context);

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return VerifyPhoneScreen(
                  phoneNumber: mobileNumber,
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
            mobileNumberController.clear();
            accountNumberController.clear();
            emailController.clear();
            return Navigator.pop(context);
          },
          width: 120,
        )
      ],
    ).show();

    // Code will continue after alert is closed.
    debugPrint("Alert closed now.");
  }

  void showToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        //message to show toast
        toastLength: Toast.LENGTH_LONG,
        //duration for message to show
        gravity: ToastGravity.CENTER,
        //where you want to show, top, bottom
        timeInSecForIosWeb: 1,
        //for iOS only
        textColor: Colors.white,
        //message text color
        fontSize: 16.0 //message font size
    );
  }

}



