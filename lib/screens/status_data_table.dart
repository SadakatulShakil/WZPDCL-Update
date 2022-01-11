import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:wzpdcl_app_flutter/components/custom_button.dart';
import 'package:wzpdcl_app_flutter/components/custom_flexible_header.dart';
import 'package:wzpdcl_app_flutter/components/mycustom_appbar.dart';
import 'package:wzpdcl_app_flutter/language/Languages%20.dart';
import 'package:wzpdcl_app_flutter/language/LanguagesBn.dart';
import 'package:wzpdcl_app_flutter/screens/NewConnectionPayment.dart';
import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import '../constants.dart';

late int totalMeters;
class StatusDataTable extends StatefulWidget{
  final data;
  StatusDataTable({required this.data});

  @override
  _StatusDataTableState createState() => _StatusDataTableState();
}

class _StatusDataTableState extends State<StatusDataTable> {
  late String _name;
  late String _trackNumber;
  late String _mobileNumber;
  var widgets;

  List<String> documents = [
    'Documents Received',
    'Documents Verification',
    'Field Survey by SAE',
    'Field Survey Check by SDE/AE',
    'Field Survey Verify by XEN',
    'Field Survey Verify by RE',
    'Old Account Verification',
    'Estimate Preparation',
    'Demand Note Preparation',
    'Estimate Approved by RE',
    'Estimate Approved by XEN',
    'Estimate Approved by SE',
    'Waiting for your Payment',
    'Meter Receive by SAE',
    'Meter Issue by SAE',
    'Connection Completed',
  ];
  Map<String, List<String?>> statusDataMap = {};

  @override
  void initState() {
    super.initState();
    user.initData(documents);
    getPersonalInformation();
    generateInformationMap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonOperation.commonAppbar(),
      body: _getBodyWidget(),
    );
  }

  Widget _getBodyWidget() {
    return Column(

      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Tracking number : "),
              Text('$_trackNumber'),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Applicant Name : "),
            Text('$_name'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Mobile number : "),
            Text('$_mobileNumber'),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: HorizontalDataTable(
            leftHandSideColumnWidth: 120,
            rightHandSideColumnWidth: 600,
            isFixedHeader: true,
            headerWidgets: _getTitleWidget(totalMeters),
            leftSideItemBuilder: _generateFirstColumnRow,
            rightSideItemBuilder: _generateRightHandSideColumnRow,
            itemCount: user.userInfo.length,
            rowSeparatorWidget: const Divider(
              color: Colors.black54,
              height: 1.0,
              thickness: 0.0,
            ),
            leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
            rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
          ),

          height: 450,
        ),

        Flexible(
          child: Container(
              margin: EdgeInsets.all(20.0),
              child: OutlineButton(
                child: Text('Submit'),
                textColor: Colors.black,
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                onPressed: () {
                  // Navigator.of(context).push( MaterialPageRoute(builder: (BuildContext context) =>  CheckInQ()));
                },
              )
          ),
        )
      ],
    );
  }

  List<Widget> _getTitleWidget(int length) {
    return [
      FlatButton(
        padding: EdgeInsets.all(0),
        child: _getTitleItemWidget(
            'Status Name',
            120,Colors.grey),
        onPressed: () {
          setState(() {

          });
        },
      ),
      Container(width: 2,height: 56,color: Colors.white,),
      _getTitleItemWidget('Sl#', 100,Colors.grey),
      Container(width: 2,height: 56,color: Colors.white,),
      FlatButton(
        padding: EdgeInsets.all(0),
        child: _getTitleItemWidget('Sl#', 100,Colors.grey),
        onPressed: () {
          setState(() {

          });
        },
      ),
      Container(width: 2,height: 56,color: Colors.white,),
      _getTitleItemWidget('Sl#', 100,Colors.grey),
      Container(width: 2,height: 56,color: Colors.white,),
      _getTitleItemWidget('Sl#', 100,Colors.grey),
      Container(width: 2,height: 56,color: Colors.white,),
      _getTitleItemWidget('Sl#', 100,Colors.grey),
    ];
  }


  Widget _getTitleItemWidget(String label, double width, color) {
    return Container(
      color: color,
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      color: Colors.blueGrey,
      child: Text(user.userInfo[index].account,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
      width: 120,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          child: Text(user.userInfo[index].mobile,style: TextStyle(fontSize: 18),),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(width: 2,height: 56,color: Colors.blueGrey,),
        Container(
          child: Text(user.userInfo[index].address,style: TextStyle(fontSize: 18),),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(width: 2,height: 56,color: Colors.blueGrey,),
        Container(
          child: Text(user.userInfo[index].designation,style: TextStyle(fontSize: 18),),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(width: 2,height: 56,color: Colors.blueGrey,),
        Container(
          child: Text(user.userInfo[index].post,style: TextStyle(fontSize: 18),),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(width: 2,height: 56,color: Colors.blueGrey,),
        Container(
          child: Text(user.userInfo[index].stats,style: TextStyle(fontSize: 18),),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(width: 2,height: 56,color: Colors.blueGrey,),
      ],
    );
  }

  void getPersonalInformation() {
    _name = widget.data['data'][0]['ApplicantName']; //data[0].ApplicantName
    _trackNumber = widget.data['data'][0]['TrackingNo']; //data[0].TrackingNo
    _mobileNumber = widget.data['data'][0]['MobileNo']; //data[0].MobileNo
    totalMeters = widget.data['data'].length;
    /*widgets = widget.data['data'].mapIndexed((index, fruit) => "$index - $fruit");
    print("serial : "+ widgets.toString()+'>>>>>>>>>>');*/
  }

  void generateInformationMap() {
    var info = widget.data['data'];
    for (var item in info) { // traversing through the data item in data
      try {
        List statusArray = item['StatusArray'];
        print("tabileDataArr : "+statusArray.toString());
        for (var item in statusArray) { // traversing through the status Item
          String key = item[0]; // Create a key with the first item
          if (!statusDataMap.containsKey(key)) {
            statusDataMap[key] = [];
          }
          String value = item[2].split(' ')[0].replaceAll(':','');
          statusDataMap[key]!.add(value);
        }
      } catch (e) {
        print('STATUS ARRAY NOT A LIST');
        print(e);
      }
    }

    print("tabileData: "+statusDataMap.toString());
  }
}

Student user = Student();

class Student {
  List<StudentInfo> _userInfo = [];

  void initData(List<String> documents) {
    for (int i = 0; i < documents.length; i++) {
      _userInfo.add(StudentInfo(documents[i], '123456', 'St_No $i', '10:00 AM', '12:30 PM', 'New'));
    }
  }

  List<StudentInfo> get userInfo => _userInfo;

  set userInfo(List<StudentInfo> value) {
    _userInfo = value;
  }
}

class StudentInfo {
  String account;
  String mobile;
  String address;
  String designation;
  String post;
  String stats;

  StudentInfo(
      this.account, this.mobile,
      this.address, this.designation,
      this.post, this.stats);
}

