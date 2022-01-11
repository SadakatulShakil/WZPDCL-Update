import 'package:flutter/material.dart';
import 'package:wzpdcl_app_flutter/components/appbar_for_login_page.dart';
import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';

class DevelopmentInProcess extends StatefulWidget {
  DevelopmentInProcess() : super(key: GlobalKey());

  @override
  _DevelopmentInProcessState createState() => _DevelopmentInProcessState();
}

class _DevelopmentInProcessState extends State<DevelopmentInProcess> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CommonOperation.commonAppbar(),
      body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
          child: Image.asset('assets/images/development.jpg'),
      ),
    );
  }
}
