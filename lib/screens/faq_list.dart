import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wzpdcl_app_flutter/components/GapRF.dart';

import 'package:wzpdcl_app_flutter/components/location.dart';
import 'package:wzpdcl_app_flutter/components/mycustom_appbar.dart';
import 'package:wzpdcl_app_flutter/models/complaint/Complaint.dart';
import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';

class FaqtList extends StatefulWidget {
  @override
  _FaqtListState createState() => _FaqtListState();

  FaqtList() : super(key: GlobalKey());
}

class _FaqtListState extends State<FaqtList> {
  ScrollController scrollController = ScrollController();

  int showSub = -1;
  int showAns = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CommonOperation.commonAppbar(),
        body: SafeArea(
          child: body(),
        ));
  }

  body() {
    return Container(
      // height: ScreenRF.height(context) - 150,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
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
            child: Text(
              'FAQ',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo.shade500),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: SingleChildScrollView(
            controller: scrollController,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              key: GlobalKey(),
              children: [
                Container(width: ScreenRF.width(context), child: list())
              ],
            ),
          )),
        ],
      ),
    );
  }

  list() {
    return ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return InkWell(
              child: Container(
                margin: const EdgeInsets.all(1),
                padding: const EdgeInsets.all(10),
                width: ScreenRF.width(context),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.white70],
                      begin: FractionalOffset(0, 0),
                      end: FractionalOffset(0, 1),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.4)),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Text((index+1).toString()+"."),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Khulna Circle",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        //  Align(alignment: Alignment.centerRight,child: Image.asset('assets/images/pdf.png',height: 30,width: 30,),)
                        Align(
                            alignment: Alignment.centerRight,
                            child: index == showSub
                                ? Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Colors.black,
                                    size: 24.0,

                                    /// semanticLabel: 'Text to announce in accessibility modes',
                                  )
                                : Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.black,
                                    size: 24.0,

                                    /// semanticLabel: 'Text to announce in accessibility modes',
                                  )),

                        Align(
                          alignment: Alignment.bottomLeft,
                          child: index == showSub
                              ? Row(
                                  children: [
                                    Expanded(
                                        child: SingleChildScrollView(
                                      controller: scrollController,
                                      physics: NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      child: Column(
                                        key: GlobalKey(),
                                        children: [
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Container(
                                              width: ScreenRF.width(context),
                                              child: list2())
                                        ],
                                      ),
                                    ))
                                  ],
                                )
                              : Container(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              onTap: () {
                if (showSub == index) {
                  showSub = -1;
                  showAns = -1;
                } else {
                  showSub = index;
                  showAns = -1;
                }

                setState(() {});
              });
        });
  }

  list2() {
    return ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
              child: Container(
                margin: const EdgeInsets.only(
                    left: 10, right: 20, top: 1, bottom: 1),
                padding: const EdgeInsets.all(5),
                width: ScreenRF.width(context),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.white70],
                      begin: FractionalOffset(0, 0),
                      end: FractionalOffset(0, 1),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.4)),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Text((index+1).toString()+"."),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Barguna ESU",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        //  Align(alignment: Alignment.centerRight,child: Image.asset('assets/images/pdf.png',height: 30,width: 30,),)
                        Align(
                            alignment: Alignment.centerRight,
                            child: index == showAns
                                ? Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Colors.black,
                                    size: 24.0,

                                    /// semanticLabel: 'Text to announce in accessibility modes',
                                  )
                                : Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.black,
                                    size: 24.0,

                                    /// semanticLabel: 'Text to announce in accessibility modes',
                                  )),

                        Align(
                          alignment: Alignment.bottomLeft,
                          child: index == showAns
                              ? Row(
                                  children: [
                                    Expanded(
                                        child: SingleChildScrollView(
                                      controller: scrollController,
                                      physics: NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      child: Column(
                                        key: GlobalKey(),
                                        children: [
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Container(
                                              width: ScreenRF.width(context),
                                              child: addressAndMap())
                                        ],
                                      ),
                                    ))
                                  ],
                                )
                              : Container(),
                        )
                      ],
                    )
                  ],
                ),
              ),
              onTap: () {
                if (showAns == index) {
                  showAns = -1;
                } else {
                  showAns = index;
                }

                setState(() {});
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CommonOperation.pdfView("http://www.africau.edu/images/default/sample.pdf")
                    ));*/
              });
        });
  }

  addressAndMap() {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(8),
      width: ScreenRF.width(context),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.white, Colors.white70],
            begin: FractionalOffset(0, 0),
            end: FractionalOffset(0, 1),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 5,
              color: Colors.black.withOpacity(0.4)),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GapRF(10),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Address',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14)),
                    GapRF(5),
                    Text('Office Phone',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14)),
                    GapRF(5),
                    Text('Office Email',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14)),
                    GapRF(5),
                    Text('Website',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14)),
                  ],
                ),
              ),
              GapRF(15),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(":  " + "Rd no -16, Town...",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                    GapRF(5),
                    Text(":  " + "016704978",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                    GapRF(5),
                    Text(":  " + "xyz@wzpdcl.gov.com",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                    GapRF(5),
                    Text(":  " + "wzpdcl.gov.com",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ],
                ),
              )
            ],
          ),
          GapRF(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GapRF(5),
              Column(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blue.shade900),
                    ),
                    onPressed: () {},
                    child: Text('Call'),
                  )
                ],
              ),
              GapRF(50),
              Column(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                    ),
                    onPressed: () {},
                    child: Text('Mail'),
                  )
                ],
              )
            ],
          ),
          Container(height: 150, width: double.infinity, child: Container()),
        ],
      ),
    );
  }
}
