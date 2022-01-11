import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:wzpdcl_app_flutter/components/custom_button.dart';
import 'package:wzpdcl_app_flutter/components/custom_flexible_header.dart';
import 'package:wzpdcl_app_flutter/components/custom_textfield.dart';
import 'package:wzpdcl_app_flutter/components/mycustom_appbar.dart';
import 'package:wzpdcl_app_flutter/components/network_helper_get.dart';
import 'package:wzpdcl_app_flutter/language/Languages%20.dart';
import 'package:wzpdcl_app_flutter/screens/status_&_payment_check.dart';
import 'package:wzpdcl_app_flutter/screens/status_data_table.dart';
import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';

import '../constants.dart';


/// This login screen is shown when the want to check the status and payment data
/// that is retrieved from the API.
///
/// In order to check the status data and payment the guest user or usual user
/// have to login with their tracking and PIN number. After successful login
/// the user will be taken to page where status of new connection can be checked
/// The front-end validation is completed and the screen is fully functional and
/// retrieves data from the statusCheck API provide.
/// The Functionalities are fully completely, but if there is a scope for improvement
/// please change accordingly.

class OfficerContactListLogin extends StatefulWidget {

  @override
  _OfficerContactListLoginState createState() => _OfficerContactListLoginState();
}

class _OfficerContactListLoginState extends State<OfficerContactListLogin> {
  /// [getStatusInformation] calls the [kGetStatusData] along with the user provided
  ///
  /// [_trackNumber] and [_pinNumber]. If the provided data is valid, the user is
  /// redirected to the status and payment page. Otherwise the alert is shown.
  /// This method is only called after the frontend validations are confirmed.
  String? _pinNumber;
  String? _trackNumber;
  final trackController = TextEditingController();
  final pinController = TextEditingController();
  newConnectionValidation _validate = newConnectionValidation.Correct;
  bool obscurePasswordField = true;
  Icon passwordShowIcon =Icon(Icons.remove_red_eye, color: Color(0xFFB2B2B2),);
  Icon passwordHideIcon = Icon(CupertinoIcons.eye_slash_fill, color:Colors.red,);
  late Icon passwordIcon = passwordShowIcon;
  final String kGetStatusData = 'http://27.147.146.251:9998/api/WzappApi/StatusData/';


  getStatusInformation() async{
    // This function is only called after validating
    GetNetworkHelper helper = GetNetworkHelper(url: kGetStatusData+_trackNumber!+'/'+_pinNumber!);
    var data = await helper.getData();
    print(data['data'].length);
    if (data['data'].length == 0){
      errorPinOrTrackAlert(context);
    }else{
      pinController.clear();
      trackController.clear();
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return StatusDataTable(data: data,);
      }));
    }
  }


  /// Returns an error Text if the tracking no provided by user is not valid
  showTrackErrorText(){
    if (_validate == newConnectionValidation.trackEmpty){
      return Languages.of(context)!.EmptyField;
    }
    else if (_validate == newConnectionValidation.wrongTrackLength){
      return Languages.of(context)!.PleaseEnter17digitTrackingNumber;
    }
    else{
      return null;
    }
  }

  /// Returns an error Text if the PIN  provided by user is not valid
  showPinErrorText(){
    if (_validate == newConnectionValidation.pinEmpty){
      return Languages.of(context)!.EmptyField;
    }
    else if (_validate == newConnectionValidation.wrongPinLength){
      return Languages.of(context)!.PleaseEnter6digitPinNumber;
    }
    else{
      return null;
    }
  }

  /// Alert to show that PIN or Track Number doesn't match the data in retrieved
  /// from the API
  errorPinOrTrackAlert(context) async {
    await Alert(
      context: context,
      title: Languages.of(context)!.PinTrackError,
      desc: Languages.of(context)!.PleaseProvideCorrectPINTrackNumber,
      buttons: [
        DialogButton(
          child: Text(
            "Try Again",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: (){
            trackController.clear();
            pinController.clear();
            return Navigator.pop(context);
          },
          width: 120,
        )
      ],
    ).show();

    // Code will continue after alert is closed.
    debugPrint("Alert closed now.");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFF6F6F6),
        appBar: CommonOperation.commonAppbar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomFlexibleHeader(
                leftWidget: SizedBox(
                  width: 0,
                ),
                headerTextSize: 20,
                headerText: Languages.of(context)!.NewConnectionStatusCheckPayment,
                alignment: MainAxisAlignment.start,
              ),
              SizedBox(height: 34,),
              CustomTextField(
                Languages.of(context)!.TrackingNumber,
                align: TextAlign.center,
                controller: trackController,
                keyboardType: TextInputType.number,
                errorText: showTrackErrorText(),
                suffixIcon: SizedBox(),
                prefixIcon: Icon(
                  Icons.location_on_outlined,
                  color: Color(0xFFB2B2B2),
                ),
                onChanged: (value){
                  setState(() {
                    _validate = newConnectionValidation.Correct;
                  });
                  _trackNumber = value;
                },
              ),
              SizedBox(height: 6,),
              CustomTextField(
                Languages.of(context)!.PinNumber,
                controller: pinController,
                obscureText: obscurePasswordField,
                errorText: showPinErrorText(),
                align: TextAlign.center,
                keyboardType: TextInputType.number,
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: Color(0xFFB2B2B2),
                ),
                onChanged: (value){
                  setState(() {
                    _validate = newConnectionValidation.Correct;
                  });
                  _pinNumber = value;
                },
                suffixIcon: GestureDetector(
                  onTap: (){
                    setState(() {
                      if (obscurePasswordField){
                        obscurePasswordField = false;
                        passwordIcon = passwordHideIcon;
                      }else{
                        obscurePasswordField = true;
                        passwordIcon = passwordShowIcon;
                      }
                    });
                  },
                  child: passwordIcon,
                ),
              ),
              SizedBox(height: 27,),
              MyCustomButton(buttonText: Languages.of(context)!.CheckStatusMakePayment,onTap: (){
                print('clicked');
                setState((){
                  // check if track empty
                  if (trackController.text.isEmpty){
                    _validate = newConnectionValidation.trackEmpty;
                  }else if (pinController.text.isEmpty){
                    _validate = newConnectionValidation.pinEmpty;
                  }else if (trackController.text.length < 17 ){
                    _validate = newConnectionValidation.wrongTrackLength;
                  }else if (pinController.text.length < 6 || pinController.text.length > 6){
                    _validate = newConnectionValidation.wrongPinLength;
                  }else{
                    getStatusInformation();
                  }
                  print(_validate.toString());
                });

              },)
            ],
          ),
        ));
  }
}

