import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wzpdcl_app_flutter/api/NetworkCall.dart';
import 'package:wzpdcl_app_flutter/components/GapRF.dart';
import 'package:wzpdcl_app_flutter/components/custom_button.dart';
import 'package:wzpdcl_app_flutter/components/custom_flexible_header.dart';
import 'package:wzpdcl_app_flutter/components/custom_textfield.dart';
import 'package:wzpdcl_app_flutter/language/Languages%20.dart';
import 'package:wzpdcl_app_flutter/screens/customer_home_screen.dart';
import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';
import '../components/mycustom_appbar.dart';

class VerifyPhoneScreen extends StatefulWidget {

  String phoneNumber;
  String otp;
  List<String>? customerNo;
  //const VerifyPhoneScreen({Key? key}) : super(key: key);

  @override
  _VerifyPhoneScreenState createState() => _VerifyPhoneScreenState();
  VerifyPhoneScreen({required this.phoneNumber,required this.otp, required this.customerNo });
}


class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {
  /// [verificationCode] is hardCoded, remove it when a OTP API is available
  String verificationCode = '';
  String actualCode = "";
  final customerverificationCodeController = TextEditingController();

  NetworkCall? networkCall;
  @override
  void initState() {
    networkCall = NetworkCall();
    // TODO: implement initState
    startTimer(30);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    verificationCode = widget.otp;
    //customerverificationCodeController.text = widget.otp;
    //actualCode = widget.otp;
    return Scaffold(
      appBar: CommonOperation.commonAppbar(),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Column(
            children: [
              //headline row

              CustomFlexibleHeader(
                leftWidget: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.clear,
                    color: Colors.grey,
                  ),
                ),
                headerText: Languages.of(context)!.VerifyPhone,
                rightWidget: SizedBox(width: 22.0),
              ),

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      Languages.of(context)!.WeSentCodeToVerify,
                      style: TextStyle(fontSize: 14.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    Languages.of(context)!.SentTo+' '+ widget.phoneNumber,
                    style: TextStyle(color: Color(0xFF9C9C9C)),
                  )
                ],
              ),
              SizedBox(
                height: 18.0,
              ),
              CustomTextField(
                Languages.of(context)!.Code,
                keyboardType: TextInputType.number,
                controller: customerverificationCodeController,
                onChanged: (value) {
                  actualCode = value;
                },
              ),
              SizedBox(
                height: 13.55,
              ),
              // TODO: Requires functionality to resend the code again
              /// Requires functionality to resend the code again
              /*Text(
                'Din’t get it?\nSend a new code',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF9C9C9C), fontSize: 12.0),
              ),*/
              SizedBox(
                height: 23.0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                Text("$_timeDisplay "+Languages.of(context)!.Second),
                GapRF(30),
                RaisedButton(
                  onPressed: () async {
                    if(_timeDisplay == 0){

                      CommonOperation.showProgressDialog(context, Languages.of(context)!.Codeissending, true);
                      final apiData = await networkCall!.sendSMSBiaWZAPI(widget.phoneNumber, widget.otp);

                      if(apiData != null){

                        bool status = apiData["ok"];
                        if(status){
                          CommonOperation.hideProgressDialog(context);
                          CommonOperation.snackbar(context: context, message: Languages.of(context)!.CodeSent);
                          startTimer(30);
                        }
                      }

                    }else{

                      CommonOperation.snackbar(context: context, message: Languages.of(context)!.PleaseWaitFor+" ${_timeDisplay} "+ Languages.of(context)!.Second);
                    }

                  },
                  child: Text(Languages.of(context)!.ResendSMS),
                ),


              ],),


              GapRF(10),

              MyCustomButton(
                buttonText: Languages.of(context)!.VERIFY,
                onTap: () {
                  print('clicked');
                  print("Demo CustomerList : "+ widget.customerNo.toString());
                  if (actualCode.isEmpty) {
                    CommonOperation.snackbar(context: context, message:Languages.of(context)!.PleaseWriteCode);
                    return;
                  }

                  if (actualCode != verificationCode) {
                    final snackBar = SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(Languages.of(context)!.InvalidCode,
                      style: TextStyle(fontWeight: FontWeight.bold),),
                      action: SnackBarAction(
                        label: 'Undo',
                        textColor: Colors.white70,
                        onPressed: () {
                          customerverificationCodeController.text = "";
                          // Some code to undo the change.
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    return;
                  }
                  if (actualCode == verificationCode) {

                    CommonOperation.resetAndOpenPage(context, CustomerHomeScreen(
                      customerNo: widget.customerNo
                    ));
                  /*  Navigator.push(context, MaterialPageRoute(
                            builder: (context) => CustomerHomeScreen()));*/
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Timer? _timer;
  int? _timeDisplay = 0;

  void startTimer(int _start) {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
            _timeDisplay = _start;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
}
