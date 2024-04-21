import 'dart:convert';

import 'package:frontend/component/utils/User.dart';
import 'package:http/http.dart' as http;

Future <bool> UserAllPost()async{
   print("Hello");


    var response = await http.get(Uri.parse("${User.Ip}/getAllPost"),
    headers:{"Content-Type":"application/json"},
    );

    var decodeResponse = jsonDecode(response.body);
    print(decodeResponse["status"]);
    if(decodeResponse['status']){
      print("oombu");
     for(int i = 0 ; i < decodeResponse['message'].length ; i++){
      User.postDetails.add(decodeResponse['message'][i]);
     }
      print(User.postDetails);
      return true;
    }
    else{
        return false;
    }
}