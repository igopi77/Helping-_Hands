import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VolunteerHomeView extends StatefulWidget {
  const VolunteerHomeView({super.key});

  @override
  State<VolunteerHomeView> createState() => _VolunteerHomeViewState();
}

class _VolunteerHomeViewState extends State<VolunteerHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: bodyPartForHome()),
    );
  }
  Widget bodyPartForHome(){
    List<String> img = [
      "assets/images/p1.png",
      "assets/images/p2.png",
      "assets/images/p3.png"
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
      child: Column(
        children: List.generate(img.length, (index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  dialog();
                },
                child: Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black,width: 1),
                    color: Colors.grey
                  ),
                  child: Column(
                   // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30,left: 15),
                        child: Image(
                          image: AssetImage(img[index]),
                          height: 300,
                          alignment: Alignment.center,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 15)),
                      Padding(
                        padding: EdgeInsets.only(left: 15,right: 15),
                        child: Container(

                          width: double.infinity,
                            color: Colors.white,
                            child: Icon(Icons.location_on)),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 15))
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
          title: Text("Are you sure you want to help him?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                // Handle "Yes" button press here
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}
