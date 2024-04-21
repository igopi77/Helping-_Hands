import 'dart:convert';
import 'package:frontend/component/utils/User.dart';
import 'package:http/http.dart' as http;

Future<bool> get_assign(String id) async{
  print("Hello");
 if(User.username.trim().isNotEmpty && User.pass.trim().isNotEmpty){
      var requestBody = {
      "id" : id
    };

    var response = await http.post(Uri.parse("${User.Ip}/getAsignedUnAsigned"),
    headers:{"Content-Type":"application/json"},
    body:jsonEncode(requestBody)
    );

    var decodeResponse = jsonDecode(response.body);
    print("hello ${decodeResponse["message"].toString()}");
    print(decodeResponse["status"]);
    User.assigned = [];
    User.unAssigned = [];
    for(int i = 0 ; i < decodeResponse['assigned'].length ; i++){
      User.assigned.add(decodeResponse['assigned'][i]);
     }
     for(int i = 0 ; i < decodeResponse['unasigned'].length ; i++){
      User.unAssigned.add(decodeResponse['unasigned'][i]);
     }
     print(User.assigned);
    print(User.unAssigned);
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