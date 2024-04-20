import 'dart:convert';

import 'package:frontend/component/utils/User.dart';
import 'package:http/http.dart' as http;


Future <bool> UserPost(String base64, double latitude,double longitude)async{
   print("Hello");
      var requestBody = {
      "base64" : base64.toString(),
      "location" : {
        "long" : longitude.toString(),
        "lat" : latitude.toString(),
      },
    };

    var response = await http.post(Uri.parse("${User.Ip}/addPost"),
    headers:{"Content-Type":"application/json"},
    body:jsonEncode(requestBody)
    );

    var decodeResponse = jsonDecode(response.body);
    print("hello ${decodeResponse["message"].toString()}");
    print(decodeResponse["status"]);
    if(decodeResponse['status']){
      return true;
    }
    else{
        return false;
    }
}