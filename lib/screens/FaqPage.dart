import 'package:flutter/material.dart';
import 'package:wzpdcl_app_flutter/components/GapRF.dart';
import 'package:wzpdcl_app_flutter/language/Languages%20.dart';
import 'package:wzpdcl_app_flutter/models/Faq.dart';
import 'package:wzpdcl_app_flutter/utils/AppColor.dart';
import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';


class FaqPage extends StatefulWidget {
  @override
  _FaqPageState createState() => _FaqPageState();

  FaqPage() : super(key: GlobalKey());
}

class _FaqPageState extends State<FaqPage> {
  ScrollController scrollController = ScrollController();

  bool isEn = true;

  List<Faq>? listFaq = [];

  int length = 0;
  int showAns = -1;
  int index = 0;

  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
   // CommonOperation.showProgressDialog(context, "Data Loading", true);
    Future.delayed(const Duration(milliseconds: 100), () {
      getFaqData();

    });
    print("initState");
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    isEn = CommonOperation.isEn(context);
    print("build");

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
            child: Text(Languages.of(context)!.Faq,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: Colors.deepPurple),
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
   /* if (listFaq!.length == null){
      length = 0;
    }else {
      length = listFaq!.length;
    }*/
    return ListView.builder(
        itemCount: listFaq!.length,
        key: _scaffoldKey,
        shrinkWrap: true,
        //scrollDirection: Axis.horizontal,
        //physics: AlwaysScrollableScrollPhysics(),
        physics: AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        controller: scrollController,
        itemBuilder: (context, index) {

          return InkWell(
            child:Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10, top: 5, bottom: 5),
              padding: const EdgeInsets.all(0),
              width: ScreenRF.width(context),
              decoration: BoxDecoration(
                color: Colors.white,
                /*gradient: LinearGradient(
                    colors: [Colors.white, Colors.white70],
                    begin: FractionalOffset(0, 0),
                    end: FractionalOffset(0, 1),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),*/
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                spreadRadius: 1,
                      offset: Offset(0, 1),
                      blurRadius: 1,
                      color: Colors.grey,
                      //color: Colors.black.withOpacity(0.4)
                  ),
                ],
              ),
              child: Stack(
                children: [

                  Align(
                    alignment: Alignment.topLeft,
                    child:  Padding(
                      padding: const EdgeInsets.only(left: 25.0,right: 30,top: 25, bottom: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                           Text(isEn? listFaq![index].questionEn.toString(): listFaq![index].questionBn.toString(),
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),

                        SizedBox(height: 10,),

                        showAns == index ?
                        Text( isEn?"● "+listFaq![index].ansEn.toString(): "● "+listFaq![index].ansBn.toString(),
                          style: TextStyle(fontSize: 14, color: Colors.blue.shade300, fontWeight: FontWeight.bold),
                        ): Container(),
                      ],),
                    )



                  ),
                  //  Align(alignment: Alignment.centerRight,child: Image.asset('assets/images/pdf.png',height: 30,width: 30,),)
                  Align(alignment: Alignment.centerRight,
                      child: index == showAns? Padding(
                        padding: const EdgeInsets.only(top:25, right: 5),
                        child: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.black,
                          size: 24.0,
                          /// semanticLabel: 'Text to announce in accessibility modes',
                        ),
                      ): Padding(
                        padding: const EdgeInsets.only(top:25, right: 5),
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                          size: 24.0,
                          /// semanticLabel: 'Text to announce in accessibility modes',
                        ),
                      ) ),

                  Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          padding: EdgeInsets.all(0.0),
                          height: 20,
                          width: 35,
                          margin: const EdgeInsets.only(
                            left: 0.0,
                            right: 0.0,
                          ),
                          decoration: BoxDecoration(
                            //color: AppColor.colorPrimary(),
                            color: Colors.blue.shade300,
                            //border: Border.all(color: Colors.red),

                            //borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(15)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: new Text(isEn?(index+1).toString(): CommonOperation.getBanglaNumber((index+1).toString()),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    //fontFamily: "Roboto",
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal),
                                  overflow: TextOverflow.fade,
                                ),
                              )
                            ],
                          ))),

                ],
              ),
            ) ,
            onTap: () {

              if(showAns == index){
                showAns = -1;
              }else{
                showAns = index;
              }

              setState(() {

              });
            }
          );
        });
  }

  void getFaqData() async {
    CommonOperation.showProgressDialog(context, Languages.of(context)!.DataLoading, true);
    listFaq = await CommonOperation.getFaqData();

    if(listFaq != null){
      CommonOperation.hideProgressDialog(context);
      setState(() {

      });
    }

  }



}
