import 'dart:io';

import 'package:flutter/material.dart';
import 'network_helper_get.dart';
/*import 'package:http_middleware/http_middleware.dart';
import 'package:http_logger/http_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';*/
import 'dart:convert';
import 'package:http/http.dart' as http;
class TicketApi {
  String? mobileNo;
  String? customerNo;
  // String? mobileNoField;
  // String? customerNoField;
  String? meterNo;
  String? customerName;
  String? customerID;
  late String url= 'http://103.204.81.62:8081/westzone_ticket_api/index.php';

//Ticket is used as complaint
  void postData() async {
    // var eurl ='https://pae.ipportalegre.pt/testes2/wsjson/api/app/ws-authenticate';
    //
    // Map data = {
    //   'apikey': '12345678901234567890'
    // }
    // //encode Map to JSON
    // var body = json.encode(data);
    //
    // var response = await http.post(Uri.parse(eurl,
    //     headers: {"Content-Type": "application/json"},
    //     body: body
    // );

    //

    // var response = await http.post(Uri.parse('http://103.204.81.62:8081/westzone_ticket_api/index.php'), body: json.encode(body), headers: header);
    // print(response.body);
    /////////////////////////
    // var body =
    // {
    //   "employee_id": 'xenkln1', // String username defined above
    //   // String password defined above
    // };

   /* HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('Content-type', 'application/json');
    request.add(utf8.encode(json.encode(body)));
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    var ticketData = json.decode(reply);
    httpClient.close();
*/
//by mentor
 /*   HttpWithMiddleware httpClient = HttpWithMiddleware.build(middlewares: [
      HttpLogger(logLevel: LogLevel.BODY),
    ]); */

    //HttpWithMiddleware httpClient = null

  /*  final http.Response response = await httpClient.post(
      "http://103.204.81.62:8081/westzone_ticket_api/index.php",
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'employee_id': 'xenkln1'}),
    );*/
//////////another stack overflow
//     const Map<String, String> header = {
//       'Content-type': 'application/json',
//       'Accept': 'application/json',
//     };
//     http.Response response = await http.post(
//      //   'https://jsonplaceholder.typicode.com/posts',
//       'http://103.204.81.62:8081/westzone_ticket_api/index.php',
//         body: jsonEncode(<String, String>{
//           'employee_id': 'xenkln1',
//         })
//     );
        //{'employee_id': 'xenkln1'});
  //  print(response.body);
    //////
    // Map<String, String> headers = {
    //   "Content-Type": "application/json",
    //   "Accept": "application/json",
    // };
    //
    // var url = "http://103.204.81.62:8081/westzone_ticket_api/index.php";
    // print("fetching $url");
    // var response = await http.post(Uri.parse(url), headers: headers);
    // if (response.statusCode != 200) {
    //   throw Exception(
    //       "Request to $url failed with status ${response.statusCode}: ${response.body}");
    // }
   // print("Test: ${response.body}");

   //  const Map<String, String> header = {
   //    'Content-type': 'application/json',
   //    'Accept': 'application/json',
   //  };
   //
   //  final body = {
   //    'employee_id':'xenkln1'
   //  };
   // /* var response = await http.post(
   //      Uri.parse('http://103.204.81.62:8081/westzone_ticket_api/index.php'),
   //      body: {'employee_id': 'xenkln1',});
   //  print(response.body);*/
   //  //////////////////////////////////////////////////
   //  http.Response response = await http.post(Uri.parse('http://103.204.81.62:8081/westzone_ticket_api/index.php'),
   //    headers: new ContentType("application", "json", charset: "utf-8"),
   //    body: jsonEncode(body));
    //print(response.statusCode);
    ///stackoverflow
   /* if (response.statusCode < 200 || response.statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }*/
   // print(response.statusCode);
     /* if (response.statusCode >= 200) {
     var data = response.body;
     //var ticketData = jsonDecode(data);
     var ticketData = json.decode(data);
     //  Map<String, dynamic> ticketData = new Map<String, dynamic>.from(json.decode(response.body));

        print(ticketData);
      //////////post ticket
      // var ticketData = await helper.getData();
        print("Hello");
        print(ticketData);
        if (ticketData.length > 0) {
          print(ticketData);
        //   customerName = ticketData[data][0]['cus_name'];
           SharedPreferences prefs = await SharedPreferences.getInstance();
           await prefs.setString(
               'ticketName', '${ticketData['data'][0]['cus_name']}');
        }
        else {
          print('Could not Retrieve Data- ${response.statusCode}');
        }
        }
        else{
           print('${response.statusCode}');
      }*/
    }


///////////////stackoverflow//////////

    // Future <void> postTicketData(String mobileNoField, String customerNoField) async {
    //   // GetNetworkHelper helper = GetNetworkHelper(
    //   //      url: 'http://103.204.81.62:8081/westzone_ticket_api/index.php/'
    //   // );
    //   var ticketData = await helper.getData();
    //   print(ticketData);
    //   if (ticketData.length > 0) {
    //     //  setState(() {
    //     // retrive API data
    //    // var mobileNoData = loginData['data']['MOBILE_NO'];
    //   //  var customerNoData = loginData['data']['ACCOUNT_NUM'];
    //    // this.mobileNo = mobileNoData.toString();
    //    // this.customerNo = customerNoData.toString();
    //    // meterNo = loginData['data']['METER_NUM'];
    //     customerName = ticketData['data']['cus_name'];
    //     // customerHomeMeterNo=_meterNo;
    //     // customerHomeMobileNo=_mobileNo;
    //     // customerHomeName=_customerName;
    //     // customerHomeNo=_customerNo;
    //
    //     // });
    //    // print(mobileNo);
    //    // print(customerNo);
    //    // print(meterNo);
    //     print(customerName);
    //     //store ticket data in shared preferences
    //      SharedPreferences prefs = await SharedPreferences.getInstance();
    //      await prefs.setString('ticketName', '${ticketData['data']['cus_name']}');
    //     // await prefs.setString('mobileNo','${loginData['data']['MOBILE_NO']}');
    //     // await prefs.setString('meterNo','${loginData['data']['METER_NUM']}');
    //     // await prefs.setString('customerNo','${loginData['data']['ACCOUNT_NUM']}');
    //     // print(prefs.getString('name'));
    //
    //
    //   }
    //
    //
    //   else {
    //    // print("Please use correct info");
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
