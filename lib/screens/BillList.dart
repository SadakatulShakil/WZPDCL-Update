import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wzpdcl_app_flutter/api/NetworkCall.dart';
import 'package:wzpdcl_app_flutter/components/GapRF.dart';
import 'package:wzpdcl_app_flutter/language/Languages%20.dart';
import 'package:wzpdcl_app_flutter/models/Bills/DueBillsResponse.dart' as bill;
import 'package:wzpdcl_app_flutter/models/Bills/DueBillsResponse.dart';
import 'package:wzpdcl_app_flutter/models/PayBill/PayBillList.dart' as pay;
import 'package:wzpdcl_app_flutter/models/PayBill/PayBillList.dart';
import 'package:wzpdcl_app_flutter/screens/post_paid_payment.dart';
import 'package:wzpdcl_app_flutter/utils/AppConstant.dart';

import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';
import 'customer_complaint_entry.dart';

class BillList extends StatefulWidget {
  List<String>? customerNo;
  @override
  _BillListState createState() => _BillListState();

  BillList({Key? key, required this.customerNo}) : super(key: key);
}

class _BillListState extends State<BillList> {
  ScrollController scrollController = ScrollController();
  NetworkCall networkCall = NetworkCall();
  // bool isPending = true;
  List<pay.Data> payDataList =[];
  int status = 0;
  String? _accountNo = "";
  String? _meterNo = "";
  String? _tarrif = "";
  String? _sanctionLoad = "";
  String? _billNumber = "";
  String? _issueDate = "";
  String? _billMonth = "";
  String? _lastMonth = "";
  String? _totalAmount = "";
  String? _vatAmount = "";
  String? _billStatus = "";
  String? _locationCode = "";
  String? _paidMonth = "";
  String? _selectedAccountNo;

  // List<Complaint> titles;

  @override
  void initState() {
    // titles = [];
    setState(() {
      getSharedData();
      getDueBills(widget.customerNo![0].toString());
      getPayBillList(widget.customerNo![0].toString());
    });
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
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0),
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.green.shade400,
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            Languages.of(context)!.AccountNo,
                            style: TextStyle(fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.bold),
                          ),

                          Container(
                            height: 30,
                            child: DropdownButton<String>(
                              underline: SizedBox(),
                              dropdownColor: Colors.green,
                              // Not necessary for Option 1
                              hint: Text(widget.customerNo![0].toString(), style: TextStyle(fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.bold)),
                              value: _selectedAccountNo,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedAccountNo = newValue;
                                  //setDynamicPref(_selectedAccountNo!);
                                  getDueBills(_selectedAccountNo.toString());
                                  print("Accoutn no: " + _selectedAccountNo.toString());
                                });
                              },
                              items: widget.customerNo!.map((customerNo) {
                                return DropdownMenuItem(
                                  child: new Text( customerNo,
                                    style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),),
                                  value: customerNo,
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    /*  Text(Languages.of(context)!.AccountNo+ '$_accountNo',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),*/
                      GapRF(5),
                      Text(Languages.of(context)!.MeterNo +'$_meterNo',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),

                    ],
                  ),
                ) ,
                Align(
                  alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Languages.of(context)!.Tarrif+'$_tarrif' ,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                        GapRF(5),
                        Text(Languages.of(context)!.SanctionLoad+'$_sanctionLoad',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),

                      ],
                    ),
                  )

              ],),
          ),
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      status = 0;
                      // rf.msg(this.context, "Marks added successfully 0", color: Colors.black,backgroundColor: Colors.transparent, type: MessageType.info);
                      scrollController.animateTo(0,
                          duration: Duration(microseconds: 2000),
                          curve: Curves.bounceIn);
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: status == 0 ? Colors.orange : Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Languages.of(context)!.DueBills,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),

                            ],
                          )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //  rf.msg(this.context, "Marks added successfully 1", color: Colors.black,backgroundColor: Colors.transparent, type: MessageType.info);
                      status = 1;
                      scrollController.animateTo(0,
                          duration: Duration(microseconds: 2000),
                          curve: Curves.bounceIn);
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: status == 1
                                ? Colors.indigo.shade500
                                : Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.indigo.shade500,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Languages.of(context)!.PaidBills,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                             /* Text(
                                '10',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              ),*/
                            ],
                          )),
                    ),
                  ),
                  GapRF(5),
                ],
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            controller: scrollController,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              key: GlobalKey(),
              children: [
                status == 0
                    ? Container(width: ScreenRF.width(context), child: list1())
                    : Container(
                            child: list2(),
                            width: ScreenRF.width(context),
                          )
                        ,
              ],
            ),
          )),
        ],
      ),
    );
  }

  list1() {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(8),
      width: ScreenRF.width(context),
      height: MediaQuery.of(context).size.height/1.5,
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
                    Text(Languages.of(context)!.BillNumber,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 12)),
                    GapRF(5),
                    Text(Languages.of(context)!.IssueDate,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 12)),
                    GapRF(5),
                    Text(Languages.of(context)!.BillMonth,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 12)),
                    GapRF(5),
                    Text(Languages.of(context)!.LastMonth,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 12)),
                    GapRF(5),
                    Text(Languages.of(context)!.Billstatus,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 12)),
                    GapRF(5),
                    Text(Languages.of(context)!.TotalAmount,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 12)),

                    GapRF(5),
                    Text(Languages.of(context)!.VatAmount,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 12)),

                    GapRF(5),
                    Text(Languages.of(context)!.LocationCode,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 12)),
                    GapRF(5),
                    Text(Languages.of(context)!.PaidMonth,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 12)),
                  ],
                ),
              ),
              GapRF(10),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(":  " + '$_billNumber',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                    GapRF(5),
                    Text(":  " + '$_issueDate',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                    GapRF(5),
                    Text(":  " + '$_billMonth',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                    GapRF(5),
                    Text(":  " + '$_lastMonth',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                    GapRF(5),
                    Text(":  " + '$_billStatus',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                    GapRF(5),
                    Text(":  " + '$_totalAmount',
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                    GapRF(5),
                    Text(":  " + '$_vatAmount',
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                    GapRF(5),
                    Text(":  " + '$_locationCode',
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),

                    GapRF(5),
                    Text(":  " + '$_paidMonth',
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                  ],
                ),
              )
            ],
          ),
          GapRF(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Visibility(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blue.shade900),
                      ),
                      onPressed: () {},
                      child: Text(Languages.of(context)!.ViewBill,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 12)),
                    ),
                    visible: false,
                  )
                  /* TextButton(
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade600),

                      ),
                      onPressed: () { },
                      child: Text('View Map'),
                    ),*/
                ],
              ),
              GapRF(60),
              Column(
                children: [

                  Container(
                    width: 200.0,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.green),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PostPaidPayment(customerNo: _accountNo)));
                        },
                        child: Text(
                          Languages.of(context)!.PayBill,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 15),
                        )),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
    /*return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {

        });*/
  }

  filter(){
    return Column(children: [

      Container(
        child:list2(),
        width: ScreenRF.width(context),
      )


    ],);
  }

  list2() {
    return ListView.builder(
        itemCount: payDataList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(12),
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
                    Stack(
                      children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Languages.of(context)!.BillNumber+' : '+ payDataList[index].bILLNUM.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12)),
                            GapRF(5),
                            Text(Languages.of(context)!.TransactionId+' : '+ payDataList[index].tRANSACTIONID.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12)),

                          ],
                        ),
                      ) ,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: Column(
                            children: [
                              Text(payDataList[index].tRANSACTIONDATE.toString() ,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14)),
                              GapRF(5),
                              Text("৳ "+ payDataList[index].tOTALBILL.toString(),
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),

                            ],
                          ),
                        ),)

                    ],),
              ],
            ),
          );
        });
  }

  void getSharedData() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    _accountNo = prefs.getString(AppConstant.ACCOUNT_NUM);
    _meterNo = prefs.getString(AppConstant.METER_NUM);
    _tarrif = prefs.getString(AppConstant.TARIFF);
    _sanctionLoad = prefs.getString(AppConstant.SANC_LOAD);
    if(_meterNo == 'null' || _meterNo == ""){
      _meterNo = 'N/A';
    }if(_accountNo == 'null' || _accountNo == ""){
      _accountNo = 'N/A';
    }if(_tarrif == 'null' || _tarrif == ""){
      _tarrif = 'N/A';
    }if(_sanctionLoad == 'null' || _sanctionLoad == ""){
      _sanctionLoad = 'N/A';
    }
    setState(() {

    });
    print('$_accountNo'+'--'+'$_meterNo'+'--'+'$_tarrif'+'--'+'$_sanctionLoad');
  }

  getDueBills(String customerNo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  DueBillsResponse? dueBills =
  await networkCall.dueBills(customerNo);

  if(dueBills != null){
    if(dueBills.ok!){

      _billNumber = dueBills.data!.bILLNUM;
      _issueDate = dueBills.data!.iNVOICEDATE;
      _billMonth = dueBills.data!.bILLMONTH;
      _lastMonth = dueBills.data!.lASTPAYDATE;
      _billStatus = dueBills.data!.bILLSTATUS;
      _totalAmount = dueBills.data!.tOTALBILLAMOUNT.toString();
      _vatAmount = dueBills.data!.vATAMT.toString();
      _locationCode = dueBills.data!.lOCATIONCODE;
      _paidMonth = dueBills.data!.pAIDMON.toString();

      if(_billNumber == null || _billNumber == ""){
        _billNumber = 'N/A';
      }if(_issueDate == null || _issueDate == ""){
        _issueDate = 'N/A';
      }if(_billMonth == null || _billMonth == ""){
        _billMonth = 'N/A';
      }if(_lastMonth == null || _lastMonth == ""){
        _lastMonth = 'N/A';
      }if(_billStatus == null || _billStatus == ""){
        _billStatus = 'N/A';
      }if(_totalAmount == null || _totalAmount == ""){
        _totalAmount = 'N/A';
      }if(_vatAmount == null || _vatAmount == ""){
        _vatAmount = 'N/A';
      }if(_locationCode == null || _locationCode == ""){
        _locationCode = 'N/A';
      }if(_paidMonth == null || _paidMonth == ""){
        _paidMonth = 'N/A';
      }

    }else{
      print("Data not found");
    }
  }

  setState(() {

  });
  }

  void getPayBillList(String accountNo)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    PayBillList? payBillData =
    await networkCall.payBillList(accountNo);

    if(payBillData != null){
      if(payBillData.data!.length != 0){
        if(payBillData.ok!){
          payDataList = payBillData.data!;
        }
      }
    }
    setState(() {

      print("PayAbleList : "+payDataList.toString());
    });
  }

}
