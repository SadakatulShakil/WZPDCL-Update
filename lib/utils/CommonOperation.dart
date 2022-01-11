import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:wzpdcl_app_flutter/components/GapRF.dart';
import 'package:wzpdcl_app_flutter/language/Languages%20.dart';
import 'package:wzpdcl_app_flutter/models/Faq.dart';
import 'package:wzpdcl_app_flutter/utils/AppColor.dart';

import 'AppConstant.dart';

class CommonOperation {
  static String getDate(String date) {
    String dateTemp = "";
    if (date != null) {
      if (date.isNotEmpty) {
        dateTemp = date.split("T").first;
      }
    }
    return dateTemp;
  }

  static bool isValidMobile(String mobileNumber) {
    bool valid = false;
    if (mobileNumber != null) {
      if (mobileNumber.length > 7) {
        //var code = ["011", "013", "014", "015", "016", "017", "018", "019"];
        //String userCode = mobileNumber.substring(0, 3);
        /* for (String tempCode in code) {
          if (tempCode == userCode) {
            valid = true;
            break;
          }
        }*/
        valid = true;
      } else {
        valid = false;
      }
    }
    return valid;
  }

  static bool isEmail(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(email);
  }

  static callNumber(String phoneNumber) async {
    await FlutterPhoneDirectCaller.callNumber(phoneNumber);
  }

  static commonAppbar() {
    return AppBar(
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
    );
  }

  static webView(String url) {
    return WebviewScaffold(url: url, appBar: commonAppbar());
  }

  static pdfView(String url) {
    return Scaffold(
      appBar: commonAppbar(),
      body: SfPdfViewer.network(url,),
    );
  }

  static sendEmail(String address) async {
    final Email email = Email(
      body: 'Email body',
      subject: 'Email subject',
      recipients: ['customercare@wzpdcl.gov.bd'],
      attachmentPaths: ['/path/to/attachment.zip'],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
  }

  static showProgressDialog(
      BuildContext context, String text, bool isCancelAble) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          GapRF(10),
          Container(
              margin: EdgeInsets.only(left: 5),
              child: Text(
                text,
                style: TextStyle(fontSize: 14),
              )),
        ],
      ),
    );
    showDialog(
      barrierDismissible: isCancelAble,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static hideProgressDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static bool isEn(BuildContext context) {
    if (Languages.of(context)!.switchLanguage == "English") {
      return false;
    }
    return true;
  }

  static snackbar(
      {required BuildContext context,
      String? message,
      Color? backgroundColor}) {
    String messageDefault = Languages.of(context)!.ComingSoon;
    if (message != null) {
      messageDefault = message;
    }

    Color backgroundColorDefault = AppColor.colorPrimary();
    if (backgroundColor != null) {
      backgroundColorDefault = backgroundColor;
    }

    final snackBar = SnackBar(
      backgroundColor: backgroundColorDefault,
      content: Text(
        messageDefault,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      /* action: actionSeenSnackBarAction(
        label: 'Undo',
        textColor: Colors.white70,
        onPressed: () {

        },
      ),*/
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

/*  _onShare(BuildContext context) async {

    final RenderBox box = context.findRenderObject() as RenderBox;

    if (imagePaths.isNotEmpty) {
      await Share.shareFiles(imagePaths,
          text: text,
          subject: subject,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } else {
      await Share.share(text,
          subject: subject,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }
  }*/

  static shareWithEmptyOrigin(BuildContext context, String text) async {
    await Share.share(text);
  }

  static resetAndOpenPage(BuildContext context, Widget widget) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget),
        (Route<dynamic> route) => false);
  }

  static openNewPage(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  static replacePage(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(builder: (context) => widget),
    );
  }

  static openNewWebview(BuildContext context, String url) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => webView(url)));
  }

  static const _credentials = {
    "type": "service_account",
    "project_id": "wwzpdcl",
    "private_key_id": "403dd5abf175c5eaf05e25c77a05454d712dafe4",
    "private_key":
        "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC68HSleXAKm3mp\n3A/thaMSU7Nir4Gyli09E1A4O2tqmITTFGDBPNvFmqjmuaGc3RwhBRnnBbASQbLc\ntMEWneQQFZwfyxRIlNO5WzVcpu9UOmZu7frQB8agA2Ja93Zud4yXSAJpsPKGhrZt\niz4RqoZgiIa7f6GYMm8YbFjgx40QMMaNsdjaM9G1+uDxzBDEEoSnfmA7f5SCUl/I\nKr628xiDeHK7nVzIuvJ9E+e5ad31/W6PoadrLCKK+s/B4nYBCsZGrWkVbpC/U8TV\nDRQPt7PA5dW9DYgxIK3rFv3ztOSUcHtZ7ZT82d/LCxIbyutFGRU2aJomCgc56B8T\npg2aPFu7AgMBAAECggEAEr3py+9FYuLci0GTXTphM4Stvu6en7N7vJxTlheq+Mhq\nxKjN3IHH/OM5HMyuncXzPIJA6w8AbIwmrQb4NtbElzI7cVqQYYh+Q56X1n6sDvM9\n8tAsLbAh40gDk+AsgP2+XCpth4AkiIU4A/qKUgYZK9N0QpcUsegYiEfQj1SiWWWG\nLbks2qaH+n49fvU+U0XXZ4tcb/ZjW2HD2HXcvj/aqJhaNWxjUvOckjMDtO0x3ojn\nl1UFjqLARbBBqX1Bx+yru7aTtAoW1XKpqNPcIw/UgHsZnep2jrUB0Bg8qvWNbjqb\nZXDAh7kx7H7PG93RQCiCUEmR5rE++N3qA6wFDzuWqQKBgQD70UrN/WeYAPdOzyKx\nFeo09DfcnhFftoQFxEpAhwajpLpmfRnr8JxOPRcdRtMnUGcx6o0jhnrmdhjawKMV\nRgJfanY9w1DNJN0yaer+0LpDN6CJXDbmyAFWc9fTTMUN3GzvUpKI2TFOGqGCL5xF\nsyTukc58VM/5aKYZ57IjXNkwIwKBgQC+C05qWIG0nKJ6V2MsMPxG/ynCx38uZVTH\n/wSfTPJS6qoRZVrVLXztx1aVHGOabes/Q/t8hfus3AkymCGUsuk+2cmrcV80q3Nk\ncZSh+t290yODtCfUEvmRNBz8l2HnhRvGyBhTes7I/QCsH89NV3EuYobmngte/Yrs\nO45GBkUTiQKBgQCKlDkYd1XlPtLamf87eRX0olmDnbFt/OFW0xkRvb0XnXW/JSV4\nxGcgX1ozEGDvh73iqHOXk1BbN66h49VbxbVUkSAVCUGUQ68/KS7boD6A80Hzlb3Y\n70RdMU8ax2rCIAYLBmQBz5TkqJ8tJ8pWSSoP6Em7/midlsuiAfH0qAoWBQKBgQCx\nKE8IGcuHt4BK9c2QM3XpJRIj7d7kPDflXBhN++flXbX+E3KySP4tlmZjCBzdp9vl\nlRUJxsiPIms8i866FHIUUeeKd1wd+DnQh4Tb3sT4oKt5qeZ67tlQ/7iJywDMVyxG\niN8Mau37NMZ8rgaMfZgXemdw8iF9gnMPtpDxPAUGqQKBgHh/XhpyGyNYZrMy6wYo\nteZb5DW8c0L9NLRGdWAQYP6TUMYsC4Ks81rT4BKlbLRbLCos4LosaSvT3astqSoz\nXM5pncwc7YhMECBxnR4Wn92TD1joqHvWBkjdnAN6K5Hu7Ci6WBlIa4OJtlexlvFr\nk4N6R3oRJ9BqKWTKILI5ElWI\n-----END PRIVATE KEY-----\n",
    "client_email": "faq-656@wwzpdcl.iam.gserviceaccount.com",
    "client_id": "105208701699359367834",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url":
        "https://www.googleapis.com/robot/v1/metadata/x509/faq-656%40wwzpdcl.iam.gserviceaccount.com"
  };

  static String id = "1j8PHjPD_mmR_yQQyfLZeibjm_fuHY9CVsK0C0d1MVX4";

  static Future<List<Faq>> getFaqData() async {
    final gsheets = GSheets(_credentials);
    // fetch spreadsheet by its id
    final ss = await gsheets.spreadsheet(id);

    var sheet = ss.worksheetByTitle('Sheet1');

    //  var a = ss.sheets;

    /*if(a != null){
      print("Sheet : "+a.toString());
    }*/

    List data = await sheet!.values.allRows();

    List<Faq> list = <Faq>[];

    for (int i = 1; i < data.length; i++) {
      Faq faq = Faq();
      faq.sn = data[i][0];
      faq.questionEn = data[i][1];
      faq.questionBn = data[i][2];
      faq.ansEn = data[i][3];
      faq.ansBn = data[i][4];
      list.add(faq);
    }

    // print(data);
    // print(list[0].questionEn);

    return list;
  }

  static String getBanglaNumber(String number) {
    String banglaNumber = "";

    var numbers = number.split("");

    for (int i = 0; i < numbers.length; i++) {
      if (numbers[i] == "0") {
        numbers[i] = "০";
      } else if (numbers[i] == "1") {
        numbers[i] = "১";
      } else if (numbers[i] == "2") {
        numbers[i] = "২";
      } else if (numbers[i] == "3") {
        numbers[i] = "৩";
      } else if (numbers[i] == "4") {
        numbers[i] = "৪";
      } else if (numbers[i] == "5") {
        numbers[i] = "৫";
      } else if (numbers[i] == "6") {
        numbers[i] = "৬";
      } else if (numbers[i] == "7") {
        numbers[i] = "৭";
      } else if (numbers[i] == "8") {
        numbers[i] = "৮";
      } else if (numbers[i] == "9") {
        numbers[i] = "৯";
      }
      banglaNumber = banglaNumber + numbers[i];
    }

    return banglaNumber;
  }





/*  static showDialog(BuildContext context){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Erase Everything on Phone?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This action cannot be undone'),
                Text('If in doubt press the cancel button to go back'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('ERASE'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }*/

  static showDialogSocial(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 300,
            // width:  350,
            margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Material(
                // needed
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        Languages.of(context)!.SocialMedia,
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColor.colorPrimary(),
                            fontWeight: FontWeight.bold),
                      ),
                      GapRF(30),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                CommonOperation.openNewWebview(context, AppConstant.Facebook);
                              }, // needed
                              child: Image.asset(
                                'assets/images/facebook.png',
                                width: 70,
                                height: 70,
                              ),
                            ),
                          ),
                          GapRF(20),
                          Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  CommonOperation.openNewWebview(context, AppConstant.Twitter);
                                }, // needed
                                child: Image.asset(
                                  'assets/images/twitter.png',
                                  width: 70,
                                  height: 70,
                                ),
                              )),
                          GapRF(20),
                          Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  CommonOperation.openNewWebview(context, AppConstant.Instagram);
                                }, // needed
                                child: Image.asset(
                                  'assets/images/instagram.png',
                                  width: 70,
                                  height: 70,
                                ),
                              )),
                        ],
                      ),
                      GapRF(30),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                CommonOperation.openNewWebview(context, AppConstant.Linkedin);
                              }, // needed
                              child: Image.asset(
                                'assets/images/linkedin.png',
                                width: 70,
                                height: 70,
                              ),
                            ),
                          ),
                          GapRF(20),
                          Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  CommonOperation.openNewWebview(context, AppConstant.Youtube);
                                }, // needed
                                child: Image.asset(
                                  'assets/images/youtube.png',
                                  width: 70,
                                  height: 70,
                                ),
                              )),
                          GapRF(20),
                          Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  CommonOperation.openNewWebview(context, AppConstant.Wikipedia);
                                }, // needed
                                child: Image.asset(
                                  'assets/images/wikipedia.png',
                                  width: 70,
                                  height: 70,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                )),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  static String getOtp (){
    int minimum = 100000;
    int maximum = 99999;

    Random random = new Random();
    int randomNumber = minimum + random.nextInt(maximum);
    return randomNumber.toString();
  }


}
