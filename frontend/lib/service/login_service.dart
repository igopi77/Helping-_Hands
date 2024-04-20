import 'dart:convert';
import 'package:frontend/component/utils/User.dart';
import 'package:http/http.dart' as http;

Future<bool> validateUser() async{
  print("Hello");
 if(User.username.trim().isNotEmpty && User.pass.trim().isNotEmpty){
      var requestBody = {
      "username":User.username.trim(),
      "password":User.pass.trim(),
      "isAdmin":User.type,
    };

    var response = await http.post(Uri.parse("${User.Ip}/login"),
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
  else{
    return false;
  }
}