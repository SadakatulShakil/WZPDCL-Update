import 'package:flutter/material.dart';
import 'package:wzpdcl_app_flutter/api/NetworkCall.dart';
import 'package:wzpdcl_app_flutter/components/GapRF.dart';
import 'package:wzpdcl_app_flutter/components/mycustom_appbar.dart';
import 'package:wzpdcl_app_flutter/language/Languages%20.dart';
import 'package:wzpdcl_app_flutter/models/Faq.dart';
import 'package:wzpdcl_app_flutter/models/NewsResponse.dart';
import 'package:wzpdcl_app_flutter/models/complaint/Complaint.dart';
import 'package:wzpdcl_app_flutter/utils/AppColor.dart';
import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';

class NewsUpdateDetails extends StatefulWidget {
  NewsResponse? newsResponse;

  @override
  _NewsUpdateDetailsState createState() => _NewsUpdateDetailsState();

  NewsUpdateDetails({this.newsResponse}) : super(key: GlobalKey());
}

class _NewsUpdateDetailsState extends State<NewsUpdateDetails> {
  ScrollController scrollController = ScrollController();
  bool isEn = true;
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isEn = CommonOperation.isEn(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CommonOperation.commonAppbar(),
        body: SingleChildScrollView(
          child: SafeArea(
            child: body(),
          ),
        ));
  }

  body() {
    return Container(
      // height: ScreenRF.height(context) - 150,
      child: Column(
        children: [
          Stack(children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
               'Date : '+ widget.newsResponse!.date.toString(),
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
            ),
              ),)
          ],),
          Container(
            /*width: double.infinity,
            height: 60,*/
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child:
                widget.newsResponse!.file.toString() == null?
                    Image.asset('assets/images/news.png'):
                widget.newsResponse!.file.toString().endsWith('pdf') || widget.newsResponse!.file.toString().endsWith('PDF') ? Image.asset('assets/images/news.png'):
            Image.network(widget.newsResponse!.file.toString()),
            //child: Image.network(widget.newsResponse!.file.toString()),
          ),
          GapRF(20),
          Text(
            isEn?
            widget.newsResponse!.newsHeader.toString(): widget.newsResponse!.newsHeaderBn.toString(),
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColor.colorPrimary()),
          ),
          GapRF(20),
          Text(
            isEn?
            widget.newsResponse!.newsBody.toString(): widget.newsResponse!.newsBodyBn.toString(),
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColor.colorPrimary()),
          )
        ],
      ),
    );
  }
}
