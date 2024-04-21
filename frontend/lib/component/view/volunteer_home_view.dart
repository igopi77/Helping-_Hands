import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/component/utils/User.dart';
import 'package:frontend/component/view/lat_long_specifier.dart';
import 'package:frontend/component/view/login_view.dart';

class VolunteerHomeView extends StatefulWidget {
  const VolunteerHomeView({Key? key});

  @override
  State<VolunteerHomeView> createState() => _VolunteerHomeViewState();
}

class _VolunteerHomeViewState extends State<VolunteerHomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: bodyPartForHome(height, width),
      ),
    );
  }

  Widget bodyPartForHome(double height, double width) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Column(
        children: List.generate(User.postDetails.length, (index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  dialog(context, index); // Pass the context and index to dialog
                },
                child: Container(
                  height: height / 3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Image.memory(
                            base64Decode(User.postDetails[index]['base64'] ?? ''),
                            fit: BoxFit.contain,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 15)),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.location_on,
                              color: Color(0xFF031149),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(left: 15)),
                          GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.arrow_upward,
                              color: Color(0xFF031149),
                            ),
                          )
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 15))
                    ],
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 15))
            ],
          );
        }),
      ),
    );
  }

  Future dialog(BuildContext context, int index) { // Add index parameter
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        bool x = User.username.isEmpty && User.fullname.isEmpty;
        return (x)
            ? AlertDialog(
                title: const Text("Please login to help"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("No"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginView()));
                    },
                    child: const Text("Yes"),
                  ),
                ],
              )
            : AlertDialog(
                title: const Text("Are you sure you want to help him?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("No"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RedirectionMap(User.postDetails[index]["location"]["long"],
                              User.postDetails[index]["location"]["lat"]),
                        ),
                      );
                    },
                    child: const Text("Yes"),
                  ),
                ],
              );
      },
    );
  }
}
