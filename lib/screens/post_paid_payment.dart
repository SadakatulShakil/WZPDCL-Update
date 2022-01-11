import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart' show JavascriptMode, WebView;
import 'package:wzpdcl_app_flutter/utils/AppConstant.dart';
import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';

class PostPaidPayment extends StatefulWidget {
  String? customerNo;

  PostPaidPayment({Key? key, this.customerNo}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<PostPaidPayment> {
  bool showProgress = true;
  String? _accountNo = "";
  String? _webUrl;

  @override
  void initState() {
    // titles = [];
    setState(() {
      getSharedData();
      print("newCustomerId: "+widget.customerNo.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
      appBar: CommonOperation.commonAppbar(),
      body: WebView(
        initialUrl: "https://eportal.dutchbanglabank.com/wzpdcl/home/"+widget.customerNo.toString(),
        javascriptMode: JavascriptMode.unrestricted,

      ),
    );
  }

  getSharedData()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _accountNo = prefs.getString(AppConstant.ACCOUNT_NUM);
    _webUrl = "https://eportal.dutchbanglabank.com/wzpdcl/home/"+_accountNo!;
    print("URL: "+ _webUrl!);
    setState(() {
    });
  }
}
