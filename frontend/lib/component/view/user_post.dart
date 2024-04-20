import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(width / 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: width / 20)),
            Text(
              "Upload disaster images.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: width / 20,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: width / 20)),
            SizedBox(
              width: width,
              height: height / 4,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(width / 20),
                  ),
                ),
                child: const Text(
                  "Select image",
                ),
                onPressed: () {
                  getImage();
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(top: width / 20)),
            ElevatedButton(onPressed: () {
              String message = "Please check your phone";
              List<String> recipents = ["9344751909","6383269048"];
              //_sendMessage(message,recipents);
            }, child: const Text("Submit")),
          ],
        ),
      ),
    );
  }
  // void _sendMessage(String message, List<String> recipients) async {
  //   String recipientsString = recipients.join(',');
  //   String uri = 'sms:$recipientsString?body=${Uri.encodeComponent(message)}';
  //
  //   if (await canLaunch(uri)) {
  //     await launch(uri);
  //   } else {
  //     // Fallback option: Display a dialog or provide alternative way to send SMS
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text('Failed to send SMS'),
  //         content: Text('Unable to launch SMS app. Please send the SMS manually.'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               // Implement your fallback action here
  //             },
  //             child: Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }



Future<void> getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
}
