import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:wzpdcl_app_flutter/components/network_helper_get.dart';
import 'package:wzpdcl_app_flutter/models/Bills/DueBillsResponse.dart';
import 'package:wzpdcl_app_flutter/models/ComplaintList/ComplaintCategoryList.dart';
import 'package:wzpdcl_app_flutter/models/ComplaintList/complaintList.dart';
import 'package:wzpdcl_app_flutter/models/Faq.dart';
import 'package:wzpdcl_app_flutter/models/NewsResponse.dart';
import 'package:wzpdcl_app_flutter/models/PayBill/PayBillList.dart';
import 'package:wzpdcl_app_flutter/models/SignUpRes/SignUpResponse.dart';
import 'package:wzpdcl_app_flutter/models/UserAuth/UserAuth.dart';
import 'package:wzpdcl_app_flutter/models/login/Login.dart';
import 'package:wzpdcl_app_flutter/models/login/LoginWithArray.dart';
import 'package:wzpdcl_app_flutter/models/ticket/Ticket.dart';
import 'package:wzpdcl_app_flutter/models/ticket/TicketParams.dart';
import 'package:dio/dio.dart';
import 'package:wzpdcl_app_flutter/utils/AppConstant.dart';

class NetworkCall {
  final String baseUrl = "http://27.147.193.84/api/";
  final String loginUrl = "PostpaidApi/getLoginData/";

  Future<Login?> login(String? mobileNoField, String? customerNoField) async {
    String fullUrl = baseUrl +
        loginUrl +
        mobileNoField.toString() +
        "/" +
        customerNoField.toString();
    GetNetworkHelper helper = GetNetworkHelper(url: fullUrl);
    print("URL = " + fullUrl);
    var loginData = await helper.getData();
    print("Response = " + loginData.toString());
    if (loginData.length > 0) {
      return Login.fromJson(loginData);
    } else {
      print("Please use correct info");
      return null;
    }
  }

  Future<Login?> login2(String? mobileNoField, String? customerNoField) async {
    String fullUrl = baseUrl +
        loginUrl +
        mobileNoField.toString() +
        "/" +
        customerNoField.toString();
    final loginData = await http.get(Uri.parse(fullUrl));
    print("URL = " + fullUrl);
    print("Response = " + loginData.body);
    if (loginData.statusCode == 200) {
      return Login.fromJson(jsonDecode(loginData.body));
    } else {
      return null;
    }
  }

  Future<LoginWithArray?> login3(String? mobileNoField) async {
    String fullUrl = "http://27.147.193.84/api/PostpaidApi/getInfoByMobileNo/" +
        mobileNoField.toString();
    final loginData = await http.get(Uri.parse(fullUrl));
    print("URL = " + fullUrl);
    print("Response = " + loginData.body);
    if (loginData.statusCode == 200) {
      return LoginWithArray.fromJson(jsonDecode(loginData.body));
    } else {
      return null;
    }
  }

  Future<List<Ticket?>?> getTicketList(
      String? mobileNoField, String? customerNoField) async {
    String fullUrl = "http://103.204.81.62:8081/westzone_ticket_api/index.php";
    GetNetworkHelper helper = GetNetworkHelper(url: fullUrl);
    print("URL = " + fullUrl);
    var apiData = await helper.getData();
    print("Response = " + apiData.toString());
    if (apiData.length > 0) {
      //List<Ticket> list =Ticket.fromJson(apiData).toList();
      // return <List<Ticket.fromJson(apiData)>>;
      final parsed = apiData.cast<Map<String, dynamic>>();
      return parsed.map<Ticket>((json) => Ticket.fromJson(json)).toList();
    } else {
      print("Please use correct info");
      return null;
    }
  }

  Future<List<Ticket>?> getTicketList2(TicketParams ticketParams) async {
    //String fullUrl = "http://103.204.81.62:8081/westzone_ticket_api/index.php";
    String fullUrl = "customercare.wzpdcl.gov.bd";
    //String fullUrl = "http://kolorobjobsapi.scibd.info/api/KolorobJobsAPI/GetApplicantListForCertificateVerification";

    print(jsonEncode(ticketParams));

    final queryParameters = {
      'employee_id': 'xenkln1',
    };
    Map<String, String> map = {
      "employee_id": "xenkln1",
    };

    final apiData = await http.get(
      Uri.https(
        fullUrl,
        '/westzone_ticket_api/index.php',
        <String, String>{
          'employee_id': 'xenkln1',
        },
      ),
      //Uri.parse(fullUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        //'Accept': 'application/json',
        // 'Content-Length': '-1',
        'Authorization': AppConstant.API_KEY,
      },

      // body: jsonEncode(ticketParams),
    );

    print("URL = " + fullUrl);
    print("Response = " + apiData.body);
    if (apiData.statusCode == 200) {
      if (apiData.body.length > 50) {
        return compute(parsesData, apiData.body);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  List<Ticket> parsesData(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Ticket>((json) => Ticket.fromJson(json)).toList();
  }

  Future<List<Ticket>?> getTicketList3(TicketParams ticketParams) async {
    //String fullUrl = "http://103.204.81.62:8081/westzone_ticket_api/index.php";
    //String fullUrl = "http://103.204.81.62:8081/westzone_ticket_api/find_office.php";
    String fullUrl =
        "https://customercare.wzpdcl.gov.bd/westzone_ticket_api/index.php";
    //String fullUrl = "http://kolorobjobsapi.scibd.info/api/KolorobJobsAPI/GetApplicantListForCertificateVerification";
    print("URL = " + fullUrl);
    print("Params = " + jsonEncode(ticketParams).toString());
    var dio = Dio();
    final apiData = await dio.get(
      fullUrl,
      // data: jsonEncode(ticketParams),
    );

    apiData.headers.add("Content-Type", "application/json; charset=utf-8");
    apiData.headers.add("Accept", "application/json");
    apiData.headers.add("Authorization", AppConstant.API_KEY);
    /*apiData.headers.add("Content-Type", "application/json; charset=utf-8");
    apiData.headers.add("Content-Type", "application/json; charset=utf-8");*/

    print("Response = " + apiData.toString());
    /* if (apiData.statusCode == 200) {
      if(apiData.body.length >50) {
        return compute(parsesData, apiData.body);
      }else{
        return null;
      }
    } else {
      return null;
    }*/
  }

  void sendSMS(String mobileNumber) async {
    var bodyData = {
      "username": "WestZPDCL",
      "password": "W2pdcl@API",
      "apicode": "1",
      "msisdn": "${mobileNumber}",
      "countrycode": "880",
      "cli": "WZPDCL",
      "messagetype": "1",
      "message": "This is SMS",
      "messageid": "0"
    };

    /*  final apiData = await http.post(
      Uri.parse(fullUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: bodyData,

    );*/

    String fullUrl =
        "https://gpcmp.grameenphone.com/ecmapigw/webresources/ecmapigw.v2";
    print("URL = " + fullUrl);
    print("Body = " + bodyData.toString());

    var dio = Dio();
    final apiData = await dio.post(
      fullUrl,
      data: bodyData,
    );
    apiData.headers.add("Content-Type", "application/json; charset=utf-8");
    apiData.headers.add("Accept", "application/json");
    apiData.headers.add("Authorization", AppConstant.API_KEY);

    print("Response = " + apiData.toString());
  }

  //Future<List<NewsResponse?>?> getNewsList() async {
  Future<dynamic> getNewsList() async {
    var bodyData = {"status": 1, "offset": 4, "page": 1};

    String fullUrl =
        "http://customercare.wzpdcl.gov.bd/westzone_ticket_api/all_news.php";
    print("URL = " + fullUrl);
    print("Body = " + bodyData.toString());

    var dio = Dio();
    final apiData = await dio.post(
      fullUrl,
      data: bodyData,
    );

    /* apiData.headers.add("Content-Type", "application/json; charset=utf-8");
    apiData.headers.add("Accept", "application/json");
    apiData.headers.add("Authorization", AppConstant.API_KEY);*/

    print("Response = " + apiData.toString());

    /* if (apiData.statusCode == 200) {
      if (apiData.data.length > 50) {
        return compute(parsesData2, apiData.data);
      } else {
        return null;
      }
    } else {
      return null;
    }*/

    List<NewsResponse> list = [];

    if (apiData != null) {
      return apiData.data;
    } else {
      return null;
    }

    /* if(apiData != null){
      return apiData.data;
    }else{
      return null;
    }*/
  }

  Future<dynamic> getNewsHeadLine() async {
    var bodyData = {
      "type":"bn"
    };

    String fullUrl =
        "https://customercare.wzpdcl.gov.bd/westzone_ticket_api/newsdetails.php";
    print("URL = " + fullUrl);
    print("Body = " + bodyData.toString());

    var dio = Dio();
    final apiData = await dio.post(
      fullUrl,
      data: bodyData,
    );

    print("Response = " + apiData.toString());

    if (apiData != null) {
      return apiData.data;
    } else {
      return null;
    }
  }

  List<NewsResponse> parsesData2(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<NewsResponse>((json) => NewsResponse.fromJson(json))
        .toList();
  }

  Future<dynamic> sendSMSBiaWZAPI(String mobileNumber, String otp) async {
    var bodyData = {"mobileNo": "${mobileNumber}", "otp": "${otp}"};

    String fullUrl = "http://27.147.193.84/api/PostpaidApi/OTPVerification";
    print("URL = " + fullUrl);
    print("Body = " + bodyData.toString());

    var dio = Dio();
    final apiData = await dio.post(
      fullUrl,
      data: bodyData,
    );
    apiData.headers.add("Content-Type", "application/json; charset=utf-8");
    apiData.headers.add("Accept", "application/json");
    apiData.headers.add("Authorization", AppConstant.API_KEY);

    print("Response = " + apiData.toString());

    if (apiData != null) {
      return apiData.data;
    } else {
      return null;
    }
  }


  Future<LoginWithArray?> getNews() async {
    var bodyData = {"status": 1, "offset": 5, "page": 1};

    var bodyData1 = jsonEncode(<String, dynamic>{
      'offset': '50',
      'status': 1,
      'page': '1',
    });

    String fullUrl =
        "http://customercare.wzpdcl.gov.bd/westzone_ticket_api/all_news.php";
    final loginData = await http.post(Uri.parse(fullUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: bodyData
        //body: bodyData1.toString()
        );

    print("URL = " + fullUrl);
    print("bodyData = " + bodyData.toString());
    //  print("bodyData1 = " + bodyData1.toString());
    print("Response = " + loginData.body);
  }


  Future<dynamic> adminLogin(String userName, String password) async {
   /* var bodyData = {
      "username":"xenkln1",
      "password" :"1234"
    };*/

     var bodyData = {
      "username":userName,
      "password" :password
    };

    String fullUrl =
        "http://customercare.wzpdcl.gov.bd/westzone_ticket_api/login.php";
    print("URL = " + fullUrl);
    print("Body = " + bodyData.toString());
    print("Authorization = " + AppConstant.API_KEY);

    var dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer "+AppConstant.API_KEY;

    final apiData = await dio.post(
      fullUrl,
      data: bodyData,
      options: Options(
        headers: {
          "Authorization":  AppConstant.API_KEY,
        },
      ),
    );
    apiData.headers.add("Authorization", AppConstant.API_KEY);
   // apiData.headers.add("Content-Type", "application/json; charset=utf-8");
   // apiData.headers.add("Accept", "application/json");

   /* final apiData = await http.post(
      Uri.parse(fullUrl),
      body: (bodyData),
      headers: <String, String>{
        'Content-Type': 'application/json',
        //'Accept': 'application/json',
        // 'Content-Length': '-1',
        'Authorization': AppConstant.API_KEY,
      },

    );*/
    print("Response = " + apiData.toString());


    if (apiData != null) {
      return apiData.data;
    } else {
      return null;
    }
  }

  Future<dynamic> complaintList(String employeeId, String status, int pageNumber) async {
    /*var bodyData = {
      "employee_id" : "xenkln1",
      "status": "Open",
      "offset": 5,
      "page":1
    };*/
    var bodyData = {
      "employee_id" : employeeId,
      "status": status,
      "offset": 10,
      "page":pageNumber
    };

    String fullUrl =
        "https://customercare.wzpdcl.gov.bd/westzone_ticket_api/index.php";
    print("URL = " + fullUrl);
    print("Body = " + bodyData.toString());
    print("Authorization = " + AppConstant.API_KEY);

    var dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer "+AppConstant.API_KEY;

    final apiData = await dio.post(
      fullUrl,
      data: bodyData,
      options: Options(
        headers: {
          "Authorization":  AppConstant.API_KEY,
        },
      ),
    );
    apiData.headers.add("Authorization", AppConstant.API_KEY);
   // apiData.headers.add("Content-Type", "application/json; charset=utf-8");
   // apiData.headers.add("Accept", "application/json");

   /* final apiData = await http.post(
      Uri.parse(fullUrl),
      body: (bodyData),
      headers: <String, String>{
        'Content-Type': 'application/json',
        //'Accept': 'application/json',
        // 'Content-Length': '-1',
        'Authorization': AppConstant.API_KEY,
      },

    );*/
    print("Response = " + apiData.toString());


    if (apiData != null) {
      return apiData.data;
    } else {
      return null;
    }
  }


  Future<String> postComplaint(String path, String? selectedAccountNo, String? selectedComplainType, String? selectedComplain, String actualMessage,
      String actualAddress, String actualNumber, double longitude, double latitude) async {
    String fileName = path.split('/').last;
    String faultMap = longitude.toString()+", "+latitude.toString();
    FormData formData = FormData.fromMap({
      "customer_number_t": selectedAccountNo,
      "file": await http.MultipartFile.fromPath('file', path),
      "message": actualMessage,
      "query_catagory": selectedComplainType,
      "query": selectedComplain,
      "phone_number_t": actualNumber,
      "fault_address": actualAddress,
      "fault_map": faultMap,
      "customer_name": "ABDULLAH-BIN-SIDDIQUE"
    });

    String fullUrl = "https://customercare.wzpdcl.gov.bd/westzone_ticket_api/create_ticket_with_file_upload.php";

    print("URL = " + fullUrl);
    print("formData = " + formData.toString());

    //var dio = Dio();
    var request = http.MultipartRequest('POST', Uri.parse(fullUrl));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print("output: "+ response.toString());
      return response.toString();
    }
    else {
      print(response.reasonPhrase);
      return "null";
    }
  }

  void test() async {


    String fullUrl = "http://27.147.193.84/api/PostpaidApi/getInvoiceInfo/2108501180303/501180303";

    var dio = Dio();


    final apiData = await dio.get(
      fullUrl,

    );


    print("Response = " + apiData.toString());
  }

  void postCompline2(String filePath) async {

    var bodyData = {
      "customer_number_t": "101111111",
      // "file": '$file',
      //"file": ,
      "message": "Hello",
      "query_catagory": "CONNECTION RELATED",
      "query": "Load-shedding (Collective Apartment) Complaint",
      "phone_number_t": "01516158298",
      "fault_address": "Dhaka",
      "fault_map": "20.1111, 30.121212",
      "customer_name": "Test User"
    };

    FormData formData = new FormData.fromMap({
      "customer_number_t": "101111111",
      // "file": '$file',
      //"file": ,
      "message": "Hello",
      "query_catagory": "CONNECTION RELATED",
      "query": "Load-shedding (Collective Apartment) Complaint",
      "phone_number_t": "01516158298",
      "fault_address": "Dhaka",
      "fault_map": "20.1111, 30.121212",
      "customer_name": "Test User"
    });

    var map = new Map<String, String>();
    map['customer_number_t'] = '101111111';
    //map['file'] = '101111111';
    map['message'] = 'Hello';
    map['query_catagory'] = 'CONNECTION RELATED';
    map['query'] = 'Load-shedding (Collective Apartment) Complaint';
    map['phone_number_t'] = '01516158298';
    map['fault_address'] = 'Dhaka';
    map['fault_map'] = '20.1111, 30.121212';
    map['customer_name'] = 'Test User';

    String fullUrl =
        "https://customercare.wzpdcl.gov.bd/westzone_ticket_api/create_ticket_with_file_upload.php";

    /* final apiData = await http.MultipartRequest(
        'POST',
      Uri.parse(fullUrl)

    );*/

    Map<String, String> headers = <String, String>{
      'Authorization': 'Basic ${base64Encode(utf8.encode('user:password'))}'
          'Content-Type", "application/json'
    };

    var request = http.MultipartRequest('POST', Uri.parse(fullUrl))
      ..headers.addAll(headers)
      ..fields.addAll(map);
    if (filePath != '') {
      request..files.add(await http.MultipartFile.fromPath('File', filePath));
    }

    print("URL = " + fullUrl);
    print("Body = " + bodyData.toString());
    print("formData = " + formData.toString());
    print("map = " + map.toString());

    //apiData.headers.add("Content-Type", "application/json; charset=utf-8");
    //apiData.headers.add("Accept", "application/json");
    //apiData.headers.add("Authorization", AppConstant.API_KEY);

    print("Response = " + request.toString());
  }

  Future<DueBillsResponse?> dueBills(String? accountNo) async {
    String fullUrl = "http://27.147.193.84/api/PostpaidApi/getInvoiceInfoByAccountNo/" +accountNo.toString();
    final billsData = await http.get(
        Uri.parse(fullUrl),
      headers:{"Authorization": AppConstant.API_KEY}
    );

    print("URL = " + fullUrl);
    print("Response = " + billsData.body);
    if (billsData.statusCode == 200) {
      return DueBillsResponse.fromJson(jsonDecode(billsData.body));
    } else {
      print("ResponseCode = " + billsData.statusCode.toString());
      return null;
    }
  }

  Future<UserAuth?> userData(String? accountNo) async {
    String fullUrl = "http://27.147.193.84/api/PostpaidApi/getInfoByAccountNum/" +
        accountNo.toString();
    final loginData = await http.get(Uri.parse(fullUrl));
    print("URL = " + fullUrl);
    print("AccountRes = " + loginData.body);
    if (loginData.statusCode == 200) {
      return UserAuth.fromJson(jsonDecode(loginData.body));
    } else {
      return null;
    }
  }

  Future<PayBillList?> payBillList(String? accountNo) async {
    String fullUrl = "http://27.147.193.84/api/PostpaidApi/getPaymentInfoByAccountNo/"+
        accountNo.toString();
    final payBillLData = await http.get(Uri.parse(fullUrl));
    print("URL = " + fullUrl);
    print("PayRes = " + payBillLData.body);
    if (payBillLData.statusCode == 200) {
      return PayBillList.fromJson(jsonDecode(payBillLData.body));
    } else {
      return null;
    }
  }

  Future<ComplaintCategoryList?> complainCategoryList() async {
    String fullUrl = "https://customercare.wzpdcl.gov.bd/westzone_ticket_api/complain_type.php";
    final complainCategoryData = await http.post(Uri.parse(fullUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print("URL = " + fullUrl);
    print("complainCatRes = " + complainCategoryData.body);
    if (complainCategoryData.statusCode == 200) {
      return ComplaintCategoryList.fromJson(jsonDecode(complainCategoryData.body)[0]);
    } else {
      return null;
    }
  }


  Future<String> complainList(String complainType, bool isEn) async {
    String comEn = "";
    String comBn = "";
    String fullUrl = "https://customercare.wzpdcl.gov.bd/westzone_ticket_api/complain.php";
    if(isEn){
      comEn = complainType;
    }else{
      comBn = complainType;
    }
    Map data = {
      'complain_type': comEn,
      'complain_type_bn': comBn
    };
    print("Body data: "+data.toString());
    var body = json.encode(data);
    final complainData = await http.post(Uri.parse(fullUrl),
      body: body,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print("URL = " + fullUrl);
    print("complainRes = " + complainData.body);
    if (complainData.statusCode == 200) {
      return complainData.body.toString();
    } else {
      return "null";
    }
  }

  Future<SignUpRes?> signUpRes(String accountNo, String mobileNo, String email) async {
    String apiKey = "X#CQOs1a3dfhlsWoSLDFSE42HIaZpToYQMl";
    String userid = "WZPostpaiD@APP";
    String password = "WZ@POSTPAID";
    String fullUrl = "http://27.147.193.84/api/PostpaidApi/SignUpAPI";
    Map data = {
      'ACCOUNT_NUM': accountNo,
      'MOBILE_NO': mobileNo,
      'EMAIL': email
    };
    print("Body data: "+data.toString());
    var body = json.encode(data);
    final signUpData = await http.post(Uri.parse(fullUrl),
      body: body,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'apikey': apiKey,
        'userid': userid,
        'password': password
      },
    );
    print("URL = " + fullUrl);
    print("complainRes = " + signUpData.body);
    if (signUpData.statusCode == 200) {
      return SignUpRes.fromJson(jsonDecode(signUpData.body));
    } else {
      return null;
    }
  }


}
