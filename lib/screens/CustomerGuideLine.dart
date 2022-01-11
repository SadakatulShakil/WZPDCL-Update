import 'package:flutter/material.dart';
import 'package:wzpdcl_app_flutter/components/GapRF.dart';

import 'package:wzpdcl_app_flutter/components/mycustom_appbar.dart';
import 'package:wzpdcl_app_flutter/language/Languages%20.dart';
import 'package:wzpdcl_app_flutter/models/complaint/Complaint.dart';
import 'package:wzpdcl_app_flutter/models/guide_model.dart';
import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';
import 'package:wzpdcl_app_flutter/utils/guide_data.dart';
import 'package:wzpdcl_app_flutter/utils/guide_data_bn.dart';

class CustomerGuideLine extends StatefulWidget {
  @override
  _CustomerGuideLineState createState() => _CustomerGuideLineState();

  CustomerGuideLine() : super(key: GlobalKey());
}

class _CustomerGuideLineState extends State<CustomerGuideLine> {
  ScrollController scrollController = ScrollController();

  List<Guide> guideList = GuideData.getDataCollection();
  List<Guide> guideListBn = GuideDataBn.getDataCollection();
  bool isEn = true;

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
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset:
                  Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Text(Languages.of(context)!.CustomerGuideline_,
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Colors.indigo.shade500),
            ),
          ),
          SizedBox(height: 10,),
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
        itemCount: guideList.length,
        itemBuilder: (context, index) {
          return InkWell(
            child:Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(15),
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
                  Stack(children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text((index+1).toString()+"."),
                          SizedBox(width: 5,),
                          Flexible(
                            child: Text(isEn?guideList[index].name: guideListBn[index].name,
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),),
                    Align(alignment: Alignment.centerRight,child: Image.asset('assets/images/pdf.png',height: 40,width: 40,),)


                  ],)
                ],
              ),
            ) ,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                      //CommonOperation.pdfView("http://www.africau.edu/images/default/sample.pdf")
                      CommonOperation.pdfView(guideList[index].pdfLink.toString())
                  ));
              print("Link: "+guideList[index].pdfLink.toString());
            }
          );

        });
  }



}
