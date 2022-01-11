import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:wzpdcl_app_flutter/components/custom_button.dart';
import 'package:wzpdcl_app_flutter/components/custom_flexible_header.dart';
import 'package:wzpdcl_app_flutter/components/custom_textfield.dart';
import 'package:wzpdcl_app_flutter/components/mycustom_appbar.dart';
import 'package:wzpdcl_app_flutter/components/network_helper_get.dart';
import 'package:wzpdcl_app_flutter/components/new_connection_status&payment_tablebody.dart';
import 'package:wzpdcl_app_flutter/constants.dart';
import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';

/// This screen is shown when the user/guest click on Tracking Number retrieval
///
/// The user/guest can get the tracking numbers using the phone number [data] is
/// retrieved from the API provided.
class OCLTrackingRetrieve extends StatefulWidget {

  @override
  _OCLTrackingRetrieveState createState() => _OCLTrackingRetrieveState();
}

class _OCLTrackingRetrieveState extends State<OCLTrackingRetrieve> {
  /// This class is used for Tracking Number retrieval. It does not take any
  /// data from [OCLTrackingRetrieve].
  ///
  /// Methods:
  ///
  /// * [getTrackingNumbers] is used to call the API and retrieve Data from it
  /// If no data is present with the mobile number provided than a Alert is shown
  /// to provide a correct user number
  ///
  /// * [errorMobileAlert] is used to alert a pop up Alert saying that the mobile
  /// number is irrelevant and asks the user to enter the data again
  ///
  /// * [showMobileErrorText] returns a String which is used for frontend validation
  ///
  /// * [build] is used to created the frontend.
  final mobileController = TextEditingController();
  newConnectionValidation _validate = newConnectionValidation.Correct;
  String? _mobileNumber;
  List<Widget> trackingNumberWidgets = [];
  bool clicked = false;
  int scrollCount = 1;
  Container tableHead = Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
      color: Color(0xFFE1E1E1),
    ),
    height: 40.0,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Mobile Number',
          style: kTableHeadTextStyle,
        ),
        Text(
          'Tracking Number',
          style: kTableHeadTextStyle,
        ),
      ],
    ),
  );


  @override
  void initState() {
    super.initState();
  }


  void getTrackingNumbers() async {
    GetNetworkHelper helper = GetNetworkHelper(
        url: 'http://27.147.146.251:9998/api/WzappApi/getTracking/' +
            _mobileNumber!);
    var data = await helper.getData();
    print(data['data']);
    if (data['data'].length > 0) {
      int i = 0;
      trackingNumberWidgets.add(tableHead);
        for (var info in data['data']){
          String trackNumber = info['Tracking']; //data[0].Tracking
          if (i == data['data'].length -1 ){
            TableBody body = TableBody(firstNumber: _mobileNumber!, secondNumber: trackNumber, last: true,);
            trackingNumberWidgets.add(body);
          }else {
            TableBody body = TableBody(
                firstNumber: _mobileNumber!, secondNumber: trackNumber);
            trackingNumberWidgets.add(body);
          }
          i++;
        }
        setState(() {
          trackingNumberWidgets = trackingNumberWidgets.toList();
          mobileController.clear();
          clicked = true;
        });
      }else{
      errorMobileAlert(context);
    }

    }

  errorMobileAlert(context) async {
    await Alert(
      context: context,
      title: "Mobile Number Error",
      desc: "Please provide a registered Mobile Number",
      buttons: [
        DialogButton(
          child: Text(
            "Try Again",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            mobileController.clear();
            return Navigator.pop(context);
          },
          width: 120,
        )
      ],
    ).show();

    // Code will continue after alert is closed.
    debugPrint("Alert closed now.");
  }


  showMobileErrorText(){
    if (_validate == newConnectionValidation.trackEmpty) {
      return 'Mobile Number cannot be empty';
    } else if (_validate == newConnectionValidation.wrongTrackLength) {
      return 'Please Enter your 11 digit Mobile Number';
    } else {
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonOperation.commonAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          children: [
            CustomFlexibleHeader(
              alignment: MainAxisAlignment.start,
              leftWidget: SizedBox(
                width: 0,
              ),
              headerText: 'New Connection Application-\nRetrieve Tracking Number',
              headerTextSize: 20.0,
            ),
            SizedBox(
              height: 25,
            ),
            CustomTextField('Mobile Number',
                errorText: showMobileErrorText(),
                controller: mobileController,
                keyboardType: TextInputType.phone, onChanged: (value) {
                  setState(() {
                    _validate = newConnectionValidation.Correct;
                  });
                  _mobileNumber = value;
                },
                prefixIcon: Icon(
                  Icons.phone,
                  color: Color(0xFFB2B2B2),
                )),
            SizedBox(
              height: 13,
            ),
            MyCustomButton(
                buttonText: 'Retrieve Tracking Numbers',
                onTap: () {
                  if (!clicked) {
                    setState(() {
                      print('clicked');
                      // check if mobile field empty
                      if (mobileController.text.isEmpty) {
                        _validate = newConnectionValidation.trackEmpty;
                      } else if (mobileController.text.length < 11) {
                        _validate = newConnectionValidation.wrongTrackLength;
                      } else {
                        getTrackingNumbers();
                      }
                    });
                  } else {
                    print(_validate);
                    Alert(
                        context: context,
                        title: "Tracking Numbers Already Retrieved",
                        desc:
                        "The corresponding Tracking Numbers is shown for $_mobileNumber")
                        .show();
                  }
                }),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Scrollbar(
                isAlwaysShown: true,
                child: ListView(
                  children: trackingNumberWidgets,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
