import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  late Map<String,dynamic> obj= {};
  late double latitude;
  late double longitude;
  final ImagePicker _picker = ImagePicker();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();
  XFile? _image; // Store the selected image here

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
                fontFamily: "RaleWay",
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
            if (_image != null)
              Image.network(
                _image!.path, // Replace with the URL of your image
                width: 200, // Adjust width as needed
                height: 200, // Adjust height as needed
              ),
            ElevatedButton(
              onPressed: () {
                _handleLocationPermission().then((granted) {
                  if (granted) {
                    _getCurrentPosition();
                  }
                });
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showSnackBar('Location services are disabled. Please enable the services');
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _showSnackBar('Location permissions are denied');
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      _showSnackBar('Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }
    return true;
  }

  void _showSnackBar(String message) {
    _scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _getCurrentPosition() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((Position position) {
      print(position.latitude);
      print(position.longitude);
      latitude = position.latitude;
      longitude = position.longitude;
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  Future<void> getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = image;
      });
      List<int> imageBytes = await image.readAsBytes();
    
      String base64Image = base64Encode(imageBytes);
      
      print('Base64 Image: $base64Image');
    }
  }
}
