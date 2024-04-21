import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/component/utils/User.dart';
import 'package:frontend/service/dashboard_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import '../../service/user_post_service.dart';
import 'volunteer_home_view.dart';

class LandingView extends StatefulWidget {
  const LandingView({Key? key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  late double latitude;
  late double longitude;
  int index = 0;
  final ImagePicker _picker = ImagePicker();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  late String base64Image;
  XFile? _image;
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0x768194DA),
      appBar: AppBar(
        title: const Text(
          "HELPING HANDS",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: "Raleway"),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF031149),
      ),
      body: _buildBody(context, width, height),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency),
            label: "Emergency",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Dashboard",
          ),
        ],
        onTap: (int index) async{
          if(index == 1){
            await UserAllPost();

          }
          setState(() {
            this.index = index;
          });
        },
      ),
    );
  }

  Widget bodyPartForLanding(double width, double height) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 9)),
          GestureDetector(
            onTap: () {},
            child: Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Login",
                  style: TextStyle(fontFamily: "Raleway", fontSize: 17, color: Colors.black),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(top: width / 20)),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 1),
                    color: const Color(0xFF031149)),
                child: Text(
                  " Upload disaster image ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: width / 20, fontFamily: "Raleway", color: Colors.white),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: width / 20)),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
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
                  padding: const EdgeInsets.only(left: 15, right: 15),
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
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF031149)),
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontFamily: "Raleway-SemiBold", fontSize: 17, color: Colors.white),
                  )),
            ],
          ),
        ],
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

  Future<void> getImageAndPost() async {
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
    }
  }

  Future<bool> _getCurrentPosition() async {
    try {
      await Geolocator.checkPermission();
      await Geolocator.requestPermission();
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

  Widget _buildBody(BuildContext context, double width, double height) {
    switch (index) {
      case 0:
        User.postDetails = [];
        return bodyPartForLanding(width, height);
      case 1:
        return const VolunteerHomeView();
      default:
        return Container();
    }
  }
}
