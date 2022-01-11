import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:wzpdcl_app_flutter/components/mycustom_appbar.dart';
import 'package:wzpdcl_app_flutter/models/complaint/Complaint.dart';
import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';

class Webview extends StatefulWidget {
  @override
  _WebviewState createState() => _WebviewState();
  String url = "";

  Webview({url}) : super(key: GlobalKey());
 // Webview({this.contextX, this.model, this.callFrom, this.caregiverId});
}

class _WebviewState extends State<Webview> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        url: widget.url,
        appBar: CommonOperation.commonAppbar()
    );
  }


}
