import 'dart:convert';
import 'package:frontend/component/utils/User.dart';
import 'package:http/http.dart' as http;

Future<bool> RevokeAvailability(String username) async{
  print("Hello");
      var requestBody = {
      "username":username
    };

    var response = await http.post(Uri.parse("${User.Ip}/revokeAvailability"),
    headers:{"Content-Type":"application/json"},
    body: jsonEncode(requestBody)
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