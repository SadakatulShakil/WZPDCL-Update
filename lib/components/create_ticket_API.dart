import 'package:flutter/material.dart';
import 'network_helper_get.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class CreateTicketApi {
  String? mobileNo;
  String? customerNo;
  // String? mobileNoField;
  // String? customerNoField;
  String? meterNo;
  String? customerName;
  String url = 'http://103.204.81.62:8081/westzone_ticket_api/create.php';

    Future<void> postCreateTicketData () async
        {
      Uri url = Uri.parse(this.url);
      ///stackoverflow
      const Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      var response = await http.post(
        // 'https://jsonplaceholder.typicode.com/posts',

        Uri(path: 'https://jsonplaceholder.typicode.com/posts'),

        //  'http://103.204.81.62:8081/westzone_ticket_api/create.php',
         // url,
          body: {
            "customer_phone": "01792788718",
            "customer_name": "Md.Mosiur Rahman",
            "customer_id": "100001234",
            "problem_type": "Connection Related",
            "problem": "Load shedding Complaint",
            "problem_details": "<p>Name:&nbsp; Address: Phone:&nbsp;</p>",
            "fault_address": "Dhanmondi-27 house:01,road:1",
            "fault_map": "fault_map",});
      print(response.body);
      ///////////////////my code
      // Map body = {
      //   "customer_phone": "01792788718",
      //   "customer_name": "Md.Mosiur Rahman",
      //   "customer_id": "100001234",
      //   "problem_type": "Connection Related",
      //   "problem": "Load shedding Complaint",
      //   "problem_details": "<p>Name:&nbsp; Address: Phone:&nbsp;</p>",
      //   "fault_address": "Dhanmondi-27 house:01,road:1",
      //   "fault_map": "fault_map",
      // };
      // final http.Response response = await http.post(
      //   "http://103.204.81.62:8081/westzone_ticket_api/create.php",
      //   headers: <String, String>{
      //     'Content-Type': 'application/json; charset=UTF-8',
      //   },
      //   body: jsonEncode(body),
      // );
      if (response.statusCode >= 200) {
        var data = response.body;
       print (jsonDecode(data));
        //return jsonDecode(data);
        print(response.statusCode);
      } else {
        print('Could not Retrieve Data- ${response.statusCode}');
      }

    }

    // var createTicketData = await helper.getData();
    // print(createTicketData);
    // if (createTicketData.length > 0) {
    //   //  setState(() {
    //   // retrive API data
    //   var mobileNoData = loginData['data']['MOBILE_NO'];
    //   var customerNoData = loginData['data']['ACCOUNT_NUM'];
    //   this.mobileNo = mobileNoData.toString();
    //   this.customerNo = customerNoData.toString();
    //   meterNo = loginData['data']['METER_NUM'];
    //   customerName = loginData['data']['CUSTOMER_NAME'];
    //   // customerHomeMeterNo=_meterNo;
      // customerHomeMobileNo=_mobileNo;
      // customerHomeName=_customerName;
      // customerHomeNo=_customerNo;

      // });
  //     print(mobileNo);
  //     print(customerNo);
  //     print(meterNo);
  //     print(customerName);
  //     //store login data in shared preferences
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('name', '${loginData['data']['CUSTOMER_NAME']}');
  //     await prefs.setString('mobileNo', '${loginData['data']['MOBILE_NO']}');
  //     await prefs.setString('meterNo', '${loginData['data']['METER_NUM']}');
  //     await prefs.setString(
  //         'customerNo', '${loginData['data']['ACCOUNT_NUM']}');
  //     print(prefs.getString('name'));
  //   } else {
  //     print("Please use correct info");
  //   }
  // }
//to store the login data
/* void sharedData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', customerName!);
    await prefs.setString('mobileNo', mobileNo!);
    await prefs.setString('meterNo', meterNo!);
    await prefs.setString('customerNo', customerNo!);
  }*/

}
