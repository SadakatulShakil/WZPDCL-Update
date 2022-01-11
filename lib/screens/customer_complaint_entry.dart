import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wzpdcl_app_flutter/api/NetworkCall.dart';
import 'package:wzpdcl_app_flutter/components/GapRF.dart';
import 'package:wzpdcl_app_flutter/components/custom_textfield.dart';
import 'package:wzpdcl_app_flutter/language/Languages%20.dart';
import 'package:wzpdcl_app_flutter/models/ComplaintList/ComplaintCategoryList.dart';
import 'package:wzpdcl_app_flutter/models/ComplaintList/complaintList.dart';
import 'package:wzpdcl_app_flutter/screens/customer_complaint_stat.dart';
import 'package:wzpdcl_app_flutter/utils/CommonOperation.dart';

import '../components/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wzpdcl_app_flutter/components/custom_button.dart';
import 'package:wzpdcl_app_flutter/components/custom_flexible_header.dart';
import 'package:wzpdcl_app_flutter/components/mycustom_appbar.dart';

//nabila
import 'package:wzpdcl_app_flutter/components/create_ticket_API.dart';

//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:wzpdcl_app_flutter/constants.dart';
//import 'package:dropdownfield/dropdownfield.dart';
//import 'package:dropdown_below/dropdown_below.dart';

/// This screen is partially built. The upload file functionality needs to implemented
/// The MAP api functionality is done building, if improvements can be done, please
/// do it.
class CustomerComplaintEntry extends StatefulWidget {
  String? mobileNo;
  List<String>? customerNo;
  CustomerComplaintEntry({Key? key, required this.customerNo, required this.mobileNo}) : super(key: key);

  @override
  _CustomerComplaintEntryState createState() => _CustomerComplaintEntryState();
}

class _CustomerComplaintEntryState extends State<CustomerComplaintEntry> {
  /// Takes input from the user and will pass it to the [CustomerComplaintStatScreen]
  /// The form validations are required in this page.
  /// to submit new complaint by nabila
  bool isEn = true;
  NetworkCall networkCall = NetworkCall();
  CreateTicketApi createTicketApi = CreateTicketApi();
  Completer<GoogleMapController> _controller = Completer();
  String? address;
  late double latitude;
  late double longitude;
  late LatLng _center;
  String? _selectedAccountNo;
  String? _selectedComplainType;
  String? _selectedComplain;
  String filePath = "";
  final pathController = TextEditingController();
  String actualNumber = "";
  String actualMessage = "";
  String actualAddress = "";
  final mobileNumberController = TextEditingController();
  final messageController = TextEditingController();
  final addressController = TextEditingController();

  /////nabila

  getLocationData() async {
    Location loc = Location();
    await loc.getCurrentLocation();
    longitude = loc.longitude;
    latitude = loc.latitude;
    _center = loc.center;
    print(latitude);
    print(longitude);
  }

  @override
  void initState() {
    super.initState();
    getComplaintCategory();
    //getComplaint();
    getLocationData().whenComplete(() {
      setState(() {});
    });
  }

  void getAddress(LatLng loc) async {
    var lon = loc.longitude;
    var lat = loc.latitude;
    final coordinates = new Coordinates(lat, lon);
    var addresses =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    address = first.addressLine;
    print(address);
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Set<Marker> _createMarker() {
    return {
      Marker(
        draggable: true,
        onDragEnd: (LatLng) {
          print(LatLng);
          getAddress(LatLng);
        },
        markerId: MarkerId("marker_1"),
        position: _center,
        infoWindow: InfoWindow(title: 'Marker 1'),
      ),
    };
  }

  /////////////nabila
  /////////fetch login data
  //changes by nabila
  late String mobileNo;
  late String customerNo;
  List<String> comCategoryListEn = [];
  List<String> comCategoryListBn = [];
  List<String> mainComCategoryList = [];
  List<String> comPlainListEn = [];
  List<String> comPlainListBn = [];
  List<String> mainComPlainList = [];
  late List<String> comList = ["12345", "34274"];
  late List<String> mobileNoList = [];

  void getSharedData() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      /* mobileNo=prefs.getString('mobileNo')!;
      customerNo=prefs.getString('customerNo')!;*/

    });
    print(mobileNo);
  }

  //dropdownmenubutton
  // DropdownButton<String> androidDropdownButton(List<String> items, String hintText){
  //   List<DropdownMenuItem<String>> dropdownItems=[];
  //
  //   for(String item in items){
  //     var newItem= DropdownMenuItem(
  //       child: Text(item),
  //       value: item,
  //     );
  //     dropdownItems.add(newItem);
  //   }
  //   return DropdownButton<String>(
  //     value: '',
  //     items: dropdownItems,
  //     onChanged: (value){
  //       setState(() {
  //
  //       });
  //       print(value);
  //       //hinttext
  //       hint: Container(
  //         //width: 150,                      //and here
  //         child: Text(
  //           "${hintText}",
  //           style:kComplaintEntryHintText,
  //           textAlign: TextAlign.start,
  //         ),
  //       );
  //
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    //getSharedData();
    isEn = CommonOperation.isEn(context);
    actualNumber = widget.mobileNo.toString();
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CommonOperation.commonAppbar(),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                GapRF(15),
                Text(
                  'Post Complaint',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30.0,
                    color: Color(0XFF2D3192),
                  ),
                ),
                GapRF(20),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  margin: EdgeInsets.only(left: 12.0, right: 12.0),
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Color(0XFFE8E8E8)),
                  ),

                  child: DropdownButton<String>(
                    // Not necessary for Option 1
                    underline: SizedBox(),
                    hint: Text(Languages.of(context)!.chooseAccountNumber,),
                    value: _selectedAccountNo,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedAccountNo = newValue;
                        /* setDynamicPref(_selectedAccountNo!);
                        getUserData(_selectedAccountNo.toString());*/
                        print("Accoutn no: " + _selectedAccountNo.toString());
                      });
                    },
                    items: widget.customerNo!.map((customerNo) {
                      return DropdownMenuItem(
                        child: new Text(customerNo,
                          style: TextStyle(fontSize: 12),),
                        value: customerNo,
                      );
                    }).toList(),
                  ),
                ),
                /*CustomDropDownTextField(
                    dropDownItems: customerNoList,
                    hintText: 'Choose Specific Customer Account No.'),*/
                GapRF(10),
                Container(
                  padding:
                  EdgeInsets.only(left: 12.0, right: 12.0, bottom: 5.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: Languages.of(context)!.chooseMobileNumber,
                    ),
                    keyboardType: TextInputType.number,
                    controller: mobileNumberController
                      ..text = widget.mobileNo!.toString(),

                    onChanged: (value) {
                      actualNumber = value;
                    },
                  ),
                ),
                //CustomTextFormField(hintText: 'Choose Mobile No.',suffixIcon: Icon(CupertinoIcons.chevron_down, color: Colors.black,size: 15,)),
                GapRF(10),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  margin: EdgeInsets.only(left: 12.0, right: 12.0),
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Color(0XFFE8E8E8)),
                  ),

                  child: DropdownButton<String>(
                    // Not necessary for Option 1
                    underline: SizedBox(),
                    hint: Text(Languages.of(context)!.chooseComplainCategory,),
                    value: _selectedComplainType,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedComplainType = newValue;
                        getComplaint(_selectedComplainType.toString(), isEn);
                        print("Accoutn no: " + _selectedComplainType.toString());
                      });
                    },
                    items: mainComCategoryList.map((comCategoryList) {
                      return DropdownMenuItem(
                        child: new Text(comCategoryList,
                          style: TextStyle(fontSize: 12),),
                        value: comCategoryList,
                      );
                    }).toList(),
                  ),
                ),
                GapRF(10),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  margin: EdgeInsets.only(
                      left: 12.0, right: 12.0, bottom: 10.0),
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Color(0XFFE8E8E8)),
                  ),

                  child: DropdownButton<String>(
                    // Not necessary for Option 1
                    underline: SizedBox(),
                    hint: Text(Languages.of(context)!.chooseComplain,),
                    value: _selectedComplain,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedComplain = newValue;
                        print("Accoutn no: " + _selectedComplain.toString());
                      });
                    },
                    items: mainComPlainList.map((customerNo) {
                      return DropdownMenuItem(
                        child: new Text(customerNo,
                          style: TextStyle(fontSize: 12),),
                        value: customerNo,
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 12.0, right: 12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: Languages.of(context)!.writeMessage,
                    ),
                    controller: messageController,

                    onChanged: (value) {
                      actualMessage = value;
                    },
                  ),
                ),
                GapRF(10),
                Container(
                  padding: EdgeInsets.only(left: 12.0, right: 12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: Languages.of(context)!.faultAddress,
                    ),
                    controller: addressController,

                    onChanged: (value) {
                      actualAddress = value;
                    },
                  ),
                ),
                GapRF(10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    "File Name",
                    enabledField: false,
                    controller: pathController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {

                    },
                    /* suffixIcon: GestureDetector(
                      child: Icon(Icons.clear),
                      onTap: () {
                        pathController.clear();
                        filePath  = "";
                        setState(() {

                        });
                      },
                    ),*/
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                        overlayColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused))
                                return Colors.yellow;
                              return Colors
                                  .green; // Defer to the widget's default.
                            }),
                      ),
                      onPressed: () async {
                        dialog();
                        print("dialog");
                      },
                      child: Text(Languages.of(context)!.uploadFile),
                    )
                  ],
                ),

                GapRF(20),
                // TODO: Add submit functionalities

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      height: 180,
                      width: double.infinity,
                      child: GoogleMap(
                        mapType: MapType.normal,
                        myLocationEnabled: true,
                        markers: _createMarker(),
                        initialCameraPosition:
                        CameraPosition(target: _center, zoom: 8.0),
                        onMapCreated: _onMapCreated,
                      )),
                ),
                GapRF(20),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: MyCustomButton(
                        fontSize: 16,
                        width: 180,
                        height: 40,
                        buttonText: Languages.of(context)!.submitComplaint,
                        onTap: () async {

                          if(_selectedAccountNo == "" || _selectedAccountNo == null){
                            showToastMessage(Languages.of(context)!
                                .validedCustomerNo);
                          }else if(actualNumber == ""){
                            showToastMessage(Languages.of(context)!
                                .validedMobileNo);
                          }else if(_selectedComplainType == "" || _selectedComplainType == null){
                            showToastMessage(Languages.of(context)!
                                .validedComplainType);
                          }else if(_selectedComplain == "" || _selectedComplain == null){
                            showToastMessage(Languages.of(context)!
                                .validedComplain);
                          }else{
                            CommonOperation.showProgressDialog(
                                context,
                                Languages.of(context)!
                                    .PleasewaitProcessing,
                                true);

                            NetworkCall networkCall = NetworkCall();

                            String createComplain = await networkCall
                                .postComplaint(filePath, _selectedAccountNo, _selectedComplainType,
                                _selectedComplain, actualMessage, actualAddress, actualNumber, longitude, latitude);

                            print("Ticket Output: "+ "Success!");
                            if (createComplain != "null") {
                              CommonOperation.hideProgressDialog(context);
                              showToastMessage(Languages.of(context)!
                                  .ticketCreation);
                            }
                            else {
                              CommonOperation.hideProgressDialog(context);
                              showToastMessage(Languages.of(context)!
                                  .ticketCreationFail);
                            }
                          }

                          setState(() {

                          });
                          //createTicketApi.postCreateTicketData();
                        }),
                  ),
                ),

                SizedBox(height: 50,)
              ],
            ),
          ),
        ));
  }

  dialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              GapRF(10),
              Flexible(child: Text('Please Select Operation'))
            ]),
            //content: Text("Are You Sure Want To Proceed?"),
            actions: <Widget>[
              Row(
                children: [
                  FlatButton(
                    child: Icon(
                      Icons.camera_alt,
                      size: 30.0,
                      color: Color(0xFF1077E5),
                    ),
                    onPressed: () async {
                      final pickedFile = await ImagePicker().pickImage(
                        source: ImageSource.camera,
                        maxWidth: 500,
                        maxHeight: 500,
                      );
                      if (pickedFile != null) {
                        Navigator.of(context).pop();
                        filePath = pickedFile.path;

                        pathController.text = pickedFile.path
                            .split('/')
                            .last;

                        setState(() {});
                      }
                    },
                  ),
                  FlatButton(
                    child: Icon(
                      Icons.sd_card,
                      size: 30.0,
                      color: Color(0xFF1077E5),
                    ),
                    onPressed: () async {
                      final path = await FlutterDocumentPicker.openDocument();
                      print("filePath: " + path.toString());
                      if (path != null) {
                        filePath = path;
                        pathController.text = path
                            .split('/')
                            .last;
                        Navigator.of(context).pop();

                        setState(() {});
                      } else {
                        // User canceled the picker
                      }
                    },
                  ),
                  FlatButton(
                    child: Icon(
                      Icons.clear,
                      size: 30.0,
                      color: Color(0xFFE51010),
                    ),
                    onPressed: () {
                      //Put your code here which you want to execute on Yes button click.
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            ],
          );
        });
  }

  void showToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        //message to show toast
        toastLength: Toast.LENGTH_LONG,
        //duration for message to show
        gravity: ToastGravity.CENTER,
        //where you want to show, top, bottom
        timeInSecForIosWeb: 1,
        //for iOS only
        textColor: Colors.white,
        //message text color
        fontSize: 16.0 //message font size
    );
  }

  getComplaintCategory() async {
    ComplaintCategoryList? complaintCategoryList =
    await networkCall.complainCategoryList();

    if (complaintCategoryList != null) {
      if (complaintCategoryList.complainCategory!.length != 0) {
        if (complaintCategoryList.ok == "true") {
          for (int i = 0; i <
              complaintCategoryList.complainCategory!.length; i++) {
            comCategoryListEn.add(
                complaintCategoryList.complainCategory![i].complainType
                    .toString());
            comCategoryListBn.add(
                complaintCategoryList.complainCategory![i].complainTypeBn
                    .toString());
          }
          if (isEn) {
            mainComCategoryList = comCategoryListEn;
          } else {
            mainComCategoryList = comCategoryListBn;
          }
          print("Category: " + comCategoryListEn.toString());
        }
      }
    }
    setState(() {

    });
  }

  getComplaint(String complainType, bool isEn,) async {
    String? complain_list = await networkCall.complainList(complainType, isEn);

      comPlainListEn.clear();
      comPlainListBn.clear();
      jsonDecode(complain_list).forEach((e) {
        comPlainListEn.add(e['complain']);
        comPlainListBn.add(e['complain_bn']);
      });
    print("output: " + comPlainListEn.toString());
      mainComPlainList = isEn ? comPlainListEn : comPlainListBn;
      setState(() {

      });
    }
}

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Icon? suffixIcon;

  // final DropdownMenuItem<String> customDropDownList;

//nabila
  final TextEditingController _controller = new TextEditingController();

  //changes by nabila
  CustomTextFormField({required this.hintText, this.suffixIcon});

//  CustomTextFormField({required this.hintText, this.suffixIcon,required this.customDropDownList});
  late final String customerAccountNo = '';
  final textSelected = TextEditingController();
  late String selectText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          fillColor: Color(0xFFF6F6F6),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(width: 1, color: Colors.blueAccent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(width: 1, color: Color(0XFFE8E8E8)),
          ),
        ),
      ),
    );
    //changes by nabila
  }
}

//TODO: Drop Down Text Field in Complaint
class CustomDropDownTextField extends StatefulWidget {
  //login Info

  //final String initialText;
  //hintexyt variable
  final String hintText;
  final List<String> dropDownItems;

  //CustomDropDownTextField({this.initialText = ''});
  //changes by nabila

  CustomDropDownTextField({
    this.hintText = '',
    required this.dropDownItems,
  });

  @override
  _CustomDropDownTextFieldState createState() =>
      _CustomDropDownTextFieldState();
}

class _CustomDropDownTextFieldState extends State<CustomDropDownTextField> {
  //late String dropdownValue;
  //nabila
  late List<String> items;
  late String hintText;
  String? onChangedDropDownValue;
  String? flag;
  String? customerNoValue;
  String? mobileNoValue;

  // List<String> customDropDownItems=[];
  @override
  void initState() {
    super.initState();
    // dropdownValue = widget.initialText;
    //customDropDownItems=widget.dropDownItems;
    items = widget.dropDownItems;
    hintText = widget.hintText;
  }

  //nabila
  //fetching saved login data

  @override
  Widget build(BuildContext context) {
    //changes by nabila
    // return DropdownButton<String>(
    //   value:dropdownValue,
    //   icon: const Icon(Icons.arrow_downward),
    //   iconSize: 24,
    //   elevation: 16,
    //   style: const TextStyle(color: Colors.deepPurple),
    //   underline: Container(
    //     height: 2,
    //     color: Colors.deepPurpleAccent,
    //   ),
    //   onChanged: (String? newValue) {
    //     setState(() {
    //       dropdownValue = newValue!;
    //     });
    //   },
    //   //hinttext
    // hint: Container(
    // //width: 150,                      //and here
    // child: Text(
    // "${widget.hintText}",
    // style:kComplaintEntryHintText,
    //   textAlign: TextAlign.start,
    // ),
    // ),
    //   //items: <String>['One', 'Two', 'Free', 'Four']
    //   items: customDropDownItems
    //       .map<DropdownMenuItem<String>>((String value) {
    //     return DropdownMenuItem<String>(
    //       //nabila
    //      value: value,
    //      child: Text(value),
    //      //  child: Text(customerNo),
    //      //  value: customerNo,
    //     );
    //   }).toList(),
    // );
    print(items);
    return Container(
      //height:
      //  width:
      constraints: BoxConstraints.expand(height: 49, width: 340),
      decoration: BoxDecoration(
        color: Color(0xFFF6F6F6),
        // filled: true,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(width: 1, color: Color(0XFFE8E8E8)),
        //BorderSide(width: 1, color: Color(0XFFE8E8E8)),
      ),
      child: DropdownButton<String>(
        //value:dropdownValue,
        value: onChangedDropDownValue,

        icon: IconTheme(
          data: IconThemeData(
            color: Colors.black,
            size: 15,
          ),
          child: Align(
              alignment: Alignment(.8, 0),
              child: const Icon(
                CupertinoIcons.chevron_down, /*color: Colors.black,size: 15,*/
              )),
        ),

        // iconSize: 24,
        elevation: 16,
        style: const TextStyle(
            //color: Color(0x969696),
            // fontSize: 14, //fontWeight:FontWeight.w400
            color: Colors.black),

        underline: Container(
          height: 2,
          // color: Colors.deepPurpleAccent,
        ),
        //    onChanged: (String? newValue) {
        onChanged: (value) {
          setState(() {
            // dropdownValue = newValue!;
            onChangedDropDownValue = value!;
           /* if (hintText == 'Choose Specific Customer Account No.') {
              flag = 'customerNo';
              if (flag == 'customerNo')
                customerNoValue = value;
              else
                flag = 'mobileNo';
            } else if (hintText == 'Choose Mobile No.') {
              flag = 'mobileNo';
              if (flag == 'mobileNo')
                mobileNoValue = value;
              else
                flag = 'customerNo';
            }*/

            print(value);
            print(flag);
          });
        },
        items:
            //<String>['One', 'Two', 'Free', 'Four']
            items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: Padding(
          padding: const EdgeInsets.only(
            left: 16,
          ),
          child: Text(
            hintText,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
          ),
        ),
        dropdownColor: Colors.white,
      ),
    );
  }
}
