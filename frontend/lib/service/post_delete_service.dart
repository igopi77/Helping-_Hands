import 'dart:convert';

import 'package:http/http.dart' as http;
import '../component/utils/User.dart';

Future<bool> postDelete(String username,String id,int index) async {
  var encodedBody = {
    'id': id.toString(),
    'username': username,
  };
  var response = await http.post(
      Uri.parse("${User.Ip}/deletePost"),
      headers:{"Content-Type":"application/json"},
      body: jsonEncode(encodedBody)
  );

  var decodedResponse = jsonDecode(response.body);
  return decodedResponse["status"];
}