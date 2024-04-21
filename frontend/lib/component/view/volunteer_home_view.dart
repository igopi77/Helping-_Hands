import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/component/view/lat_long_specifier.dart';

class VolunteerHomeView extends StatefulWidget {
  const VolunteerHomeView({super.key});

  @override
  State<VolunteerHomeView> createState() => _VolunteerHomeViewState();
}

class _VolunteerHomeViewState extends State<VolunteerHomeView> {
  List<String> img = [
    "assets/images/p1.png",
    "assets/images/p2.png",
    "assets/images/p3.png"
  ];

  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("HELPING HANDS",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: "Raleway"),),
        centerTitle: true,
        backgroundColor: Color(0xFF031149),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: bodyPartForHome(height,width)),
    );
  }

  Widget bodyPartForHome(double height, double width) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Column(
        children: List.generate(img.length, (index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  dialog();
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
                          child: Image(
                            image: AssetImage(img[index]),
                            fit: BoxFit.contain, // Fit the image into the container
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 15)),
                          GestureDetector(
                            onTap: () {

                            },
                            child: Icon(
                             Icons.location_on,
                             color: Color(0xFF031149)
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(left: 15)),
                          GestureDetector(
                            onTap: () {

                            },
                            child: Icon(
                              Icons.arrow_upward,
                              color: Color(0xFF031149)
                            ),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 15))
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

  Future dialog(){
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Are you sure you want to help him?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                // Handle "Yes" button press here
                Navigator.push(context, MaterialPageRoute(builder: (context) => RedirectionMap(0.0,0.0))); // Close the dialog
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}
