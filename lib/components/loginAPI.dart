import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wzpdcl_app_flutter/models/login/Login.dart';
import 'package:wzpdcl_app_flutter/utils/AppConstant.dart';

import 'network_helper_get.dart';
//import 'package:shared_preferences/shared_preferences.dart';
class LoginApi {
  String? mobileNo;
  String? customerNo;
 // String? mobileNoField;
 // String? customerNoField;
  String? meterNo;
  String? customerName;

  Future <void> getLoginData(String mobileNoField, String customerNoField) async {
    GetNetworkHelper helper = GetNetworkHelper(
        url: 'http://27.147.193.84/api/PostpaidApi/getLoginData/$mobileNoField/$customerNoField'
    );
    var loginData = await helper.getData();
    print(loginData);
    if (loginData.length > 0) {
    //  setState(() {
      // retrive API data
        var mobileNoData = loginData['data']['MOBILE_NO'];
        var customerNoData = loginData['data']['ACCOUNT_NUM'];
        this.mobileNo = mobileNoData.toString();
        this.customerNo = customerNoData.toString();
        meterNo = loginData['data']['METER_NUM'];
        customerName = loginData['data']['CUSTOMER_NAME'];
        // customerHomeMeterNo=_meterNo;
        // customerHomeMobileNo=_mobileNo;
        // customerHomeName=_customerName;
        // customerHomeNo=_customerNo;

     // });
     /* print(mobileNo);
      print(customerNo);
      print(meterNo);
      print(customerName);*/

      //store login data in shared preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(AppConstant.CUSTOMER_NAME, '${loginData['data'][AppConstant.CUSTOMER_NAME]}');
        await prefs.setString(AppConstant.MOBILE_NO,'${loginData['data'][AppConstant.CUSTOMER_NAME]}');
        await prefs.setString(AppConstant.METER_NUM,'${loginData['data'][AppConstant.CUSTOMER_NAME]}');
        await prefs.setString(AppConstant.ACCOUNT_NUM,'${loginData['data'][AppConstant.CUSTOMER_NAME]}');
        await prefs.setBool(AppConstant.IS_LOGGED_IN,true);



        print(prefs.getString(AppConstant.CUSTOMER_NAME));


    }


    else {
      print("Please use correct info");
    }
  }
  //to store the login data
 /* void sharedData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', customerName!);
    await prefs.setString('mobileNo', mobileNo!);
    await prefs.setString('meterNo', meterNo!);
    await prefs.setString('customerNo', customerNo!);
  }*/

  /*Future<Login> getLoginData2() async {
    final loginData = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/albums/1'
        ));



    if (loginData.statusCode == 200) {


      return Login.from(jsonDecode(loginData.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }*/

}