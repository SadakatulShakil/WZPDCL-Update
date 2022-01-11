import 'dart:convert';

import 'package:http/http.dart' as http;

class GetNetworkHelper{
  String url;
  GetNetworkHelper({required this.url});


  Future<dynamic> getData() async{
    Uri url = Uri.parse(this.url);
    http.Response response = await http.get(url);
    if (response.statusCode == 200){
      var data = response.body;
      return jsonDecode(data);
    }
    else{
      print('Could not Retrieve Data- ${response.statusCode}');
    }
  }
  //changes by nabila
  //post data
  Future<dynamic> postData() async{
    Uri url = Uri.parse(this.url);
    http.Response response = await http.post(url,);
    if (response.statusCode == 200){
      var data = response.body;
      return jsonDecode(data);
    }
    else{
      print('Could not Retrieve Data- ${response.statusCode}');
    }
  }

}