import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import '../../service/user_post_service.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  late Map<String,dynamic> obj= {};
  late double latitude;
  late double longitude;
  final ImagePicker _picker = ImagePicker();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();
  late String base64Image;
  XFile? _image;
  
  bool flag = false;

  @override
  Widget build(BuildContext context) {
  bool flag = false;
  late String base64Image;
  late double latitude;
  late double longitude;
  final ImagePicker _picker = ImagePicker();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  XFile? _image; 
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0x768194DA),
      appBar: AppBar(
        title: const Text("HELPING HANDS",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: "Raleway"),),
        centerTitle: true,
        backgroundColor: Color(0xFF031149),
      ),
      body: bodyPartForLanding(height,width),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency),
            label: 'Emergency',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          print('Tapped index $index');
        },
      ),
    );
  }
  Widget bodyPartForLanding(double height,double width){
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 9)),
        GestureDetector(
          onTap: () {

          },
          child: Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {  },
              child: Text("Login",style: TextStyle(fontFamily: "Raleway",fontSize: 17,color: Colors.black),),
            )
          ),
        ),
      //  Padding(padding: EdgeInsets.only(top: 200)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(top: width / 20)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black,width: 1),
                color: const Color(0xFF031149)
              ),
              child: Text(
                " Upload disaster image ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width / 20,
                  fontFamily: "Raleway",
                  color: Colors.white
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: width / 20)),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: SizedBox(
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
                    getImageAndPost();
                  },
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: width / 20)),
            if (_image != null)
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Image.network(
                  _image!.path, // Replace with the URL of your image
                  width: width,
                  height: height / 4, // Adjust height as needed
                ),
              ),
            const Padding(padding: EdgeInsets.only(top: 15)),
            ElevatedButton(
              onPressed: () {
                _handleLocationPermission().then((granted) {
                  if (granted) {
                    _getCurrentPosition();
                    submit();
                  }
                });
              },
              child: const Text("Submit",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17,color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF031149)
                )
            ),
          ],
        ),
      ],
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

  Future<void> getImageAndPost() async {
    if (!flag) {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _image = image;
          flag = true;
        });
        List<int> imageBytes = await image.readAsBytes();
        base64Image = base64Encode(imageBytes);
        print('Base64 Image: $base64Image');
      }
    } else {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _image = image;
        });
        List<int> imageBytes = await image.readAsBytes();
        base64Image = base64Encode(imageBytes);
        print('Base64 Image: $base64Image');
      }
    }
  }

  void submit() {
    if (_image != null) {
      _handleLocationPermission().then((granted) {
        if (granted) {
          _getCurrentPosition().then((positionGranted) {
            if (positionGranted) {
              UserPost(base64Image, latitude, longitude);
            }
          });
        }
      });
    } else {
      // Show error message or handle accordingly
    }
  }

    Future<bool> _getCurrentPosition() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(position.latitude);
      print(position.longitude);
      latitude = position.latitude;
      longitude = position.longitude;
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
