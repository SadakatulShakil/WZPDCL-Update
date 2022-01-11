import 'package:flutter/material.dart';
import 'package:wzpdcl_app_flutter/api/NetworkCall.dart';
import 'package:wzpdcl_app_flutter/components/GapRF.dart';
import 'package:wzpdcl_app_flutter/components/mycustom_appbar.dart';
import 'package:wzpdcl_app_flutter/language/Languages%20.dart';
import 'package:wzpdcl_app_flutter/models/Faq.dart';
import 'package:wzpdcl_app_flutter/models/NewsResponse.dart';
import 'package:wzpdcl_app_flutter/models/complaint/Complaint.dart';
import 'package:wzpdcl_app_flutter/screens/NewsUpdateDetails.dart';
import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';

class NewsUpdate extends StatefulWidget {
  @override
  _NewsUpdateState createState() => _NewsUpdateState();

  NewsUpdate() : super(key: GlobalKey());
}

class _NewsUpdateState extends State<NewsUpdate> {
  ScrollController scrollController = ScrollController();

  List<NewsResponse>? newsList;
  bool isEn = true;
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  NetworkCall? networkCall;

  @override
  void initState() {
    imageInclude();
    colorInclude();
    newsList = <NewsResponse>[];
    networkCall = NetworkCall();

    Future.delayed(const Duration(milliseconds: 100), () {
      getList();
    });

    super.initState();
  }

  void getList() async {
    CommonOperation.showProgressDialog(
        context, Languages.of(context)!.DataLoading, true);
    final apiData = await networkCall!.getNewsList();

    for (int i = 0; i < apiData.length; i++) {
      print("id : " + apiData[i]['id']);
      print("File : " + apiData[i]['file']);

      NewsResponse newsResponse = NewsResponse();

      newsResponse.id = apiData[i]['id'];
      newsResponse.newsHeader = apiData[i]['news_header'];
      newsResponse.newsHeaderBn = apiData[i]['news_header_bn'];
      newsResponse.newsBody = apiData[i]['news_body'];
      newsResponse.newsBodyBn = apiData[i]['news_body_bn'];
      newsResponse.file = apiData[i]['file'];
      newsResponse.date = apiData[i]['date'];
      newsList!.add(newsResponse);
    }

    if (newsList != null) {
      CommonOperation.hideProgressDialog(context);
      setState(() {});
    }
  }

  void getFaqData() async {
    /* CommonOperation.showProgressDialog(context, Languages.of(context)!.DataLoading, true);
    list = await CommonOperation.getFaqData();

    if(list != null){
      CommonOperation.hideProgressDialog(context);
      setState(() {

      });
    }*/
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
            height: 60,
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
              Languages.of(context)!.NewsUpdate,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
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
        itemCount: newsList!.length,
        itemBuilder: (context, index) {
          return card(index);

          /* return InkWell(
            child:Container(
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(15),
              width: ScreenRF.width(context),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white, Colors.white],
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


                      Text(isEn? "News :":"সংবাদ :",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 5,),
                      Text((index+1).toString()),

                    ],
                  ),
                  SizedBox(height: 10,),

                  Text(isEn?  "This is news.....This is news.....This is news.....This is news..... This is news..... This is news....."
                    : "এই খবর.....এই খবর.....এই খবর.....এই খবর.....এই খবর.....এই খবর..",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )

                ],
              ),
            ) ,
            onTap: () {
             */ /* Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                      CommonOperation.pdfView("http://www.africau.edu/images/default/sample.pdf")
                  ));*/ /*

            }
          );*/
        });
  }

  card(int index) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            if(newsList![index].file.toString().endsWith('pdf') || newsList![index].file.toString().endsWith('PDF')){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CommonOperation.pdfView(newsList![index].file.toString())
                  ));
            }else {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>
                  NewsUpdateDetails(newsResponse: newsList![index],)));
            }
          },
          child: Container(
            margin: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.green.shade500,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1),

                  /// changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                 // child: Image.network(newsList![index].file.toString()),
                 // child: Image.network('https://media.threatpost.com/wp-content/uploads/sites/103/2019/09/26105755/fish-1.jpg'),

                  child: newsList![index].file.toString().endsWith('pdf') || newsList![index].file.toString().endsWith('PDF') ? Image.asset('assets/images/news.png'):
                  Image.network(newsList![index].file.toString()),
                 // child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkPlXG5P8LjGlHMhxRf30PkwAxjx3CnR-G3HgI8A3zfF4itVsrxUtEWFHLOu8uFxG6FkY&usqp=CAU'),
                ),
                GapRF(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(isEn ?
                      newsList![index].newsHeader.toString() : newsList![index].newsHeaderBn.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                GapRF(15),
              ],
            ),
          ),
        ),

      ],
    );
  }

  List<String>? imagePath;
  List<int>? colours;

  void colorInclude() {
    colours = [
    0xFFFC6011,
      0xFFFC6011,
      0xFFFC6011,
      0xFFFC6011,
      0xFFFC6011,
      0xFFFC6011,
      0xFFFC6011,
      0xFFFC6011,
      0xFFFC6011,
      0xFFFC6011,
      0xFFFC6011,
      0xFFFC6011,
      0xFFFC6011,
      0xFFFC6011,
      0xFFFC6011,
      0xFFFC6011,
      0xFFFC6011,
      0xFFFC6011,
    ];
  }

  void imageInclude() {
    imagePath = [
      'assets/images/checkvector.png',
      'assets/images/checkvector.png',
      'assets/images/checkvector.png',
      'assets/images/checkvector.png',
      'assets/images/checkvector.png',
      'assets/images/checkvector.png',
      'assets/images/checkvector.png',
      'assets/images/checkvector.png',
      'assets/images/checkvector.png',
      'assets/images/checkvector.png',
      'assets/images/checkvector.png',
      'assets/images/checkvector.png',
      'assets/images/checkvector.png',
      'assets/images/checkvector.png',
      'assets/images/checkvector.png',
      'assets/images/checkvector.png',
      'assets/images/checkvector.png',
      'assets/images/checkvector.png',
      'assets/images/checkvector.png',
    ];
  }
}
