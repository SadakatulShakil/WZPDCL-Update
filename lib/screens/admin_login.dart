import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wzpdcl_app_flutter/api/NetworkCall.dart';
import 'package:wzpdcl_app_flutter/language/Languages%20.dart';
import 'package:wzpdcl_app_flutter/models/FeederIncharge.dart';
import 'package:wzpdcl_app_flutter/screens/AdminProfileFeederList.dart';
import 'package:wzpdcl_app_flutter/screens/admin_home_screen.dart';
import 'package:wzpdcl_app_flutter/utils/AppConstant.dart';
import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';
import '../components/custom_textfield.dart';
import '../components/custom_button.dart';
import '../constants.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {

  var userIdController = TextEditingController();
  var passwordController = TextEditingController();

  bool hidePassword = true;

  @override
  void initState() {
    userIdController.text = "ae2kln1";
    passwordController.text = "1234";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CommonOperation.commonAppbar(),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Column(
            children: [
              //headline row
              Container(
                margin: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   /* Icon(
                      Icons.clear,
                      color: Colors.grey,
                    ),*/
                    Text(
                      Languages.of(context)!.login,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 30.0,
                        color: Color(0XFF2D3192),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(Languages.of(context)!.Email, controller: userIdController,),
              SizedBox(
                height: 6.0,
              ),
              CustomTextField(
                Languages.of(context)!.Password,
                controller: passwordController,
                obscureText: hidePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    hidePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 13.55,
              ),
              /*Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 24.0),
                child: kForgotPasswordStyle,
              ),*/
              //320.22px
              SizedBox(height: 48,),
              //TODO: Add Button functionalities
              MyCustomButton(buttonText: Languages.of(context)!.login, onTap: () async {

                if(userIdController.text.isEmpty){

                  CommonOperation.snackbar(context: context,message: "Write user id", backgroundColor: Colors.deepOrange );
                  return;
                }

                if(passwordController.text.isEmpty){
                  CommonOperation.snackbar(context: context,message: "Write password", backgroundColor: Colors.deepOrange );
                  return;
                }

                login();
              /*  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => AdminHomeScreen()));*/
              },)
            ],
          ),
        ),
      ),
    );
  }

  void login()  async {
    CommonOperation.showProgressDialog(
        context,
        Languages.of(context)!
            .PleasewaitLoginProcessing,
        true);
    NetworkCall networkCall = NetworkCall();

    final apiData = await networkCall.adminLogin(userIdController.text, passwordController.text);

    if(apiData != null){
      print("feeder_incharge _PRE");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(AppConstant.ADMIN_LOGIN_DATA, apiData.toString());
      CommonOperation.hideProgressDialog(context);
      if(apiData["designation"] == AppConstant.Office_Head){
        CommonOperation.resetAndOpenPage(context, AdminProfileFeederList(apiData));
      }else if(apiData["designation"] == AppConstant.Feeder_Supervisor){
        CommonOperation.resetAndOpenPage(context, AdminProfileFeederList(apiData));
      }else if(apiData["designation"]== AppConstant.Feeder_Incharge){

        FeederIncharge feederIncharge = FeederIncharge();
        feederIncharge.subDesignation = apiData['data']['sub_designation'];
        feederIncharge.feederInchargeUserId = apiData['data']['feeder_incharge_user_id'];
        feederIncharge.feederNo = apiData['data']['feeder_no'];
        feederIncharge.feederName = apiData['data']['feeder_name'];
        feederIncharge.feederNameBn = apiData['data']['feeder_name_bn'];
        feederIncharge.feederLocation = apiData['data']['feeder_location'];
        feederIncharge.feederLocationBn = apiData['data']['feeder_location_bn'];
        feederIncharge.feederEmail =apiData['data']['feeder_email'];
        feederIncharge.feederInchargeMobileNo =
        apiData['data']['feeder_incharge_mobile_no'];
        CommonOperation.resetAndOpenPage(context, AdminHomeScreen(feederIncharge));
        print("feeder_incharge");
      }

     /* setState(() {
        *//*  _mobileNo = loginApi.mobileNo;
        _customerNo = loginApi.customerNo;*//*
      });*/
      //CommonOperation.resetAndOpenPage(context, AdminHomeScreen());
    }




  }
}
