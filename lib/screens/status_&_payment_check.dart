import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:wzpdcl_app_flutter/components/custom_button.dart';
import 'package:wzpdcl_app_flutter/components/custom_flexible_header.dart';
import 'package:wzpdcl_app_flutter/components/mycustom_appbar.dart';
import 'package:wzpdcl_app_flutter/language/Languages%20.dart';
import 'package:wzpdcl_app_flutter/language/LanguagesBn.dart';
import 'package:wzpdcl_app_flutter/screens/NewConnectionPayment.dart';
import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';

import '../constants.dart';

// TODO:(IMPORTANT) What if no information is received in DATA WHAT will the page show??

late int totalMeters;


/// This screen creates a horizontal and vertical scrollable listview with status
/// information retrieved from the API. This screen requires no changes but if no
/// status information is received for a certain user, the [Exception] needs to be
/// handled.

class OfficerContactList extends StatefulWidget {
  final data;
  OfficerContactList({required this.data});

  @override
  _OfficerContactListState createState() => _OfficerContactListState();
}

class _OfficerContactListState extends State<OfficerContactList> {
  late String _name;
  late String _trackNumber;
  late String _mobileNumber;
  late LinkedScrollControllerGroup _controllers;
  late ScrollController _headController;
  late ScrollController _bodyController;
  Map<String, List<String?>> statusDataMap = {};

  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _headController = _controllers.addAndGet();
    _bodyController = _controllers.addAndGet();
    getPersonalInformation();
    generateInformationMap();
  }

  @override
  void dispose() {
    _headController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  /// Parse the information retrieved from the API
  void generateInformationMap() {
    var info = widget.data['data'];
    for (var item in info) { // traversing through the data item in data
      try {
        List statusArray = item['StatusArray'];
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

  /// [getPersonalInformation] is required to show the personal information at
  /// the top of the table
  void getPersonalInformation() {
    _name = widget.data['data'][0]['ApplicantName']; //data[0].ApplicantName
    _trackNumber = widget.data['data'][0]['TrackingNo']; //data[0].TrackingNo
    _mobileNumber = widget.data['data'][0]['MobileNo']; //data[0].MobileNo
    totalMeters = widget.data['data'].length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CommonOperation.commonAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFlexibleHeader(
              headerTextSize: 20.0,
              leftWidget: SizedBox(
                width: 0,
              ),
              headerText:  Languages.of(context)!.NewConnectionStatus,
              alignment: MainAxisAlignment.start,
            ),
            SizedBox(
              height: 30,
            ),
            Wrap(direction: Axis.vertical, spacing: 9.0, children: [
              Text(
                Languages.of(context)!.TrackingNumber+' : $_trackNumber',
                style: kOCLTextStyle,
              ), // Tracking Number
              Text(
                Languages.of(context)!.ApplicantName +': $_name',
                style: kOCLTextStyle,
              ), // Applicant Name
              Text(
                Languages.of(context)!.MobileNo +'$_mobileNumber',
                style: kOCLTextStyle,
              ), // Mobile Number
            ]),
            SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 350,
              child: Column(
                children: [
                  ContactListTableHead(
                    scrollController: _headController,
                  ),
                  Expanded(
                    child: TableBody(
                      scrollController: _bodyController,
                      statusMap: statusDataMap,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                alignment: Alignment.center,
                child:
                    MyCustomButton(buttonText:  Languages.of(context)!.GoToPayment, onTap: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context) => NewConnectionPayment()));
                    }))
          ],
        ),
      ),
    );
  }
}

class ContactListTableCell extends StatelessWidget {
  /// Creates a container cell with the [value], [textColor], [boxColor] and [bold]
  final String? value;
  final Color? textColor;
  final Color? boxColor;
  final bool bold;
  ContactListTableCell({
    this.value,
    this.textColor,
    this.boxColor,
    this.bold = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 50,
      decoration: BoxDecoration(
        color: boxColor ?? null,
        border: Border.all(
          color: Colors.black12,
          width: 1.0,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        value ?? '',
        style: TextStyle(
            fontSize: 10.0,
            color: textColor ?? null,
            fontWeight: bold != false ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}

class ContactListTableHead extends StatelessWidget {
  /// Creates the head of the table
  final ScrollController scrollController;
  ContactListTableHead({
    required this.scrollController,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          /*ContactListTableCell(
            boxColor: Color(0xFFE1E1E1),
            textColor: Color(0xFF646464),
            value:  Languages.of(context)!.StatusName,
            bold: true,
          ),*/
          Container(
              width: 120,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                color: Colors.grey.shade300,
              ),
              child: Text(
                  Languages.of(context)!.StatusName,
                style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold),
              )
          ),
          Expanded(
            child: ListView(
              controller: scrollController,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: List.generate(totalMeters, (index) {
                return ContactListTableCell(
                  boxColor: Color(0xFFE1E1E1),
                  textColor: Color(0xFF646464),
                  value: 'SL#' + (index + 1).toString(),
                  bold: true,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class TableBody extends StatefulWidget {
  /// Creates the whole body of the table with status information. The body is
  /// both horizontal and vertical scrollable.
  final ScrollController scrollController;
  final Map<String, List<String?>> statusMap;
  TableBody({
    required this.scrollController,
    required this.statusMap
  });
  @override
  _TableBodyState createState() => _TableBodyState();
}

class _TableBodyState extends State<TableBody> {
  late LinkedScrollControllerGroup _controllers;
  late ScrollController _firstColumnController;
  late ScrollController _restColumnsController;
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

  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _firstColumnController = _controllers.addAndGet();
    _restColumnsController = _controllers.addAndGet();
  }

  @override
  void dispose() {
    _firstColumnController.dispose();
    _restColumnsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width/3,
          child: ListView(
            controller: _firstColumnController,
            physics: ClampingScrollPhysics(),
            children: List.generate(documents.length - 1, (index) {
              return ContactListTableCell(
                boxColor: Color(0xFFE1E1E1),
                textColor: Color(0xFF646464),
                value: documents.elementAt(index),
              );
            }),
          ),
        ),
        Expanded(
          child: Scrollbar(
            isAlwaysShown: true,
            controller: _restColumnsController,
            child: SingleChildScrollView(
              controller: widget.scrollController,
              scrollDirection: Axis.horizontal,
              physics: ClampingScrollPhysics(),
              child: SizedBox(
                width: totalMeters * 54,
                child: Scrollbar(
                  isAlwaysShown: true,
                  controller: _restColumnsController,
                  child: ListView(
                    controller: _restColumnsController,
                    physics: ClampingScrollPhysics(),
                    children: List.generate(documents.length - 1, (i) {
                      String key = widget.statusMap.keys.elementAt(i);
                      return Row(
                        children: List.generate(totalMeters, (j) {
                          String? value = widget.statusMap[key]!.elementAt(j);
                          return ContactListTableCell(
                            textColor: value!.toUpperCase()== "PASSED"?Colors.green: Colors.red,
                            value: value,
                          );
                        }),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
