import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:wzpdcl_app_flutter/components/custom_button.dart';
import 'package:wzpdcl_app_flutter/components/custom_flexible_header.dart';
import 'package:wzpdcl_app_flutter/components/custom_textfield.dart';
import 'package:wzpdcl_app_flutter/components/mycustom_appbar.dart';
import 'package:wzpdcl_app_flutter/components/network_helper_get.dart';
import 'package:wzpdcl_app_flutter/components/new_connection_status&payment_tablebody.dart';
import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';
import '../constants.dart';


/// This screen is shown when the user/guest click on PIN retrieval
///
/// The user/guest can get the PIN using the tracking number [data] is
/// retrieved from the API provided.
///
class OCLRetrievePin extends StatefulWidget {
  @override
  _OCLRetrievePinState createState() => _OCLRetrievePinState();
}

class _OCLRetrievePinState extends State<OCLRetrievePin> {
  /// This class is used for PIN Number retrieval. It does not take any
  /// data from [OCLRetrievePin].
  ///
  /// Methods:
  ///
  /// * [getTrackingData] is used to call the API and retrieve Data from it
  /// If no data is present with the Tracking number provided than a Alert is shown
  /// to provide a correct tracking number
  ///
  /// * [errorPinOrTrackAlert] is used to alert a pop up Alert saying that the track
  /// number is irrelevant and asks the user to enter the data again
  ///
  /// * [showTrackErrorText] returns a String which is used for frontend validation
  ///
  /// * [build] is used to created the frontend.
  List<Widget> trackingInfo = [];
  String? _trackingNumber;
  String? _pinNumber;
  newConnectionValidation _validate = newConnectionValidation.Correct;
  final trackController = TextEditingController();
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
          'Tracking Number',
          style: kTableHeadTextStyle,
        ),
        Text(
          'PIN',
          style: kTableHeadTextStyle,
        ),
      ],
    ),
  );
  bool clicked = false;

  @override
  void initState() {
    super.initState();
  }

  void getTrackingData() async {
    GetNetworkHelper helper = GetNetworkHelper(
        url: 'http://27.147.146.251:9998/api/WzappApi/getPinByTracking/' +
            _trackingNumber!);
    var data = await helper.getData();
    print(data);
    if (data.length > 0) {
      _trackingNumber = data[0]['Tracking'];
      _pinNumber = data[0]['PIN'];
      print(_trackingNumber);
      setState(() {
        TableBody body = TableBody(
          firstNumber: _trackingNumber!,
          secondNumber: _pinNumber!,
          last: true,
        );
        trackingInfo.add(tableHead);
        trackingInfo.add(body);
        trackingInfo = trackingInfo.toList();
        clicked = true;
      });
      trackController.clear();
    } else {
      errorPinOrTrackAlert(context);
    }
  }

  errorPinOrTrackAlert(context) async {
    await Alert(
      context: context,
      title: "Track Number Error",
      desc: "Please provide a correct Track Number",
      buttons: [
        DialogButton(
          child: Text(
            "Try Again",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            trackController.clear();
            return Navigator.pop(context);
          },
          width: 120,
        )
      ],
    ).show();

    // Code will continue after alert is closed.
    debugPrint("Alert closed now.");
  }

  showTrackErrorText() {
    if (_validate == newConnectionValidation.trackEmpty) {
      return 'Tracking Number cannot be empty';
    } else if (_validate == newConnectionValidation.wrongTrackLength) {
      return 'Please Enter your 17 or more digit Tracking Number';
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
              headerText: 'New Connection Application\n-Retrieve pin',
              headerTextSize: 20.0,
            ),
            SizedBox(
              height: 25,
            ),
            CustomTextField('Tracking Number',
                errorText: showTrackErrorText(),
                controller: trackController,
                keyboardType: TextInputType.number, onChanged: (value) {
              setState(() {
                _validate = newConnectionValidation.Correct;
              });
              _trackingNumber = value;
            },
                prefixIcon: Icon(
                  Icons.location_on_outlined,
                  color: Color(0xFFB2B2B2),
                )),
            SizedBox(
              height: 13,
            ),
            MyCustomButton(
                buttonText: 'Retrieve Pin',
                onTap: () {
                  if (!clicked) {
                    setState(() {
                      print('clicked');
                      // check if track empty
                      if (trackController.text.isEmpty) {
                        _validate = newConnectionValidation.trackEmpty;
                      } else if (trackController.text.length < 17) {
                        _validate = newConnectionValidation.wrongTrackLength;
                      } else {
                        getTrackingData();
                      }
                    });
                  } else {
                    print(_validate);
                    Alert(
                            context: context,
                            title: "Pin Already Retrieved",
                            desc:
                                "The corresponding PIN is shown for $_trackingNumber")
                        .show();
                  }
                }),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView(
                children: trackingInfo,
              ),
            )
          ],
        ),
      ),
    );
  }
}
