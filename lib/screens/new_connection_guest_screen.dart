import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:wzpdcl_app_flutter/components/GapRF.dart';
import 'package:wzpdcl_app_flutter/components/gesture_icons.dart';
import 'package:wzpdcl_app_flutter/components/mycustom_appbar.dart';
import 'package:wzpdcl_app_flutter/constants.dart';
import 'package:wzpdcl_app_flutter/language/Languages%20.dart';
import 'package:wzpdcl_app_flutter/screens/new_connection_PIN_retrieve.dart';
import 'package:wzpdcl_app_flutter/screens/new_connection_tracking_retrieve.dart';
import 'package:wzpdcl_app_flutter/screens/status_&_check_payment_login.dart';
import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';

/// This screen is shown when users want to apply for new connection
///
/// This class will carry forward the user information from the previous pages
/// The user have to login to so that their data can be retrieved from the API
/// and it can be shown in the front end
/// This screen is partially developed, functionalities need to be added.

class ConnectionGuestScreen extends StatefulWidget {
  /// Should be able to receive data from the previous page after login,
  /// A constructor is required so that user data can be shown in the front en
  const ConnectionGuestScreen({Key? key}) : super(key: key);

  @override
  _ConnectionGuestScreenState createState() => _ConnectionGuestScreenState();
}

class _ConnectionGuestScreenState extends State<ConnectionGuestScreen> {
  /// [vectors] creates a [Map]<[String], [GestureIcons]>

  var vectors;
  List<Column> iconsAndText = [];
  bodyMenu(){
    vectors = Map<String, GestureIcons>();

     vectors = {
      Languages.of(context)!.ApplyNewConnection: GestureIcons(
        svgName: 'new_connectionIcon.svg',
        commonPath: kCommonMenuVectorPath,
        onTapIcon: (context){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> WebviewScaffold(
            url: kApplyNewConnectionUrl,
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
          ),));
        },
      ),
 /*      Languages.of(context)!.ChecknBill: GestureIcons(
        svgName: 'check_bill.svg',
        commonPath: kGuestPageVectorPath,
        onTapIcon: (context){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> OfficerContactListLogin()));
        },
      ),*/
       Languages.of(context)!.PinRetrieval: GestureIcons(
        svgName: 'pin_retrieve.svg',
        commonPath: kGuestPageVectorPath,
        onTapIcon: (context){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> OCLRetrievePin()));
        },
      ),
       Languages.of(context)!.StatusCheckPayment: GestureIcons(
        svgName: 'statusCheck_payment.svg',
        commonPath: kGuestPageVectorPath,
        onTapIcon: (context){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> OfficerContactListLogin()));
        },
      ),
       Languages.of(context)!.TrackingNoRetrieval: GestureIcons(
        svgName: 'track_retrieve.svg',
        commonPath: kGuestPageVectorPath,
        onTapIcon: (context){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> OCLTrackingRetrieve()));
        },
      )
    };
  }
  void createIconDisplay() {
    for (String key in vectors.keys) {
      iconsAndText.add(
        Column(
          children: [
            vectors[key]!,
            GapRF(5),
            Text(key,
                textAlign: TextAlign.center, style: TextStyle(fontSize: 12))
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    bodyMenu();
    createIconDisplay();
    return Scaffold(
      appBar: CommonOperation.commonAppbar(),
      body: SafeArea(
        child: Column(
          children: [
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
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: iconsAndText.take(2).toList(),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: iconsAndText.skip(2).take(2).toList(),
                  )

                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
