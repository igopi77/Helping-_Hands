import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/component/utils/User.dart';

class AdminViewDetails extends StatefulWidget {
  const AdminViewDetails({super.key});

  @override
  State<AdminViewDetails> createState() => _AdminViewDetailsState();
}

class _AdminViewDetailsState extends State<AdminViewDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Volunteer Details",style: TextStyle(fontFamily: "Raleway",fontSize: 18,color: Colors.white),),
        backgroundColor: Color(0xFF031149),
        centerTitle: true,
      ),
      backgroundColor: Color(0x768194DA),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: bodyPartOfViewDetails()),
    );
  }
  Widget bodyPartOfViewDetails(){
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 20)),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFF031149)
          ),
          child: const Text(" Assigned ",style: TextStyle(fontFamily: "Raleway",fontSize: 18,color: Colors.white),),
        ),
        assignedVolunteers(),
        Padding(padding: EdgeInsets.only(top: 15)),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF031149)
          ),
          child: const Text(" Availability ",style: TextStyle(fontFamily: "Raleway",fontSize: 18,color: Colors.white),),
        ),
        availabilityVolunteers(),
      ],
    );
  }
  Widget availabilityVolunteers(){
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
            color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Column(
            children: List.generate(User.unAssigned.length, (index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(User.unAssigned[index]["name"],style: TextStyle(fontFamily: "Raleway",fontSize: 17),),
                  Text(User.unAssigned[index]["phoneno"],style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17),)
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
  }
  Widget assignedVolunteers(){
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
          color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Column(
            children: List.generate(User.assigned.length, (index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(User.assigned[index]["name"],style: const TextStyle(fontFamily: "Raleway",fontSize: 17),),
                  Text(User.assigned[index]['phoneno'],style: const TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17),)
                ],
              );
            }),
          ),
        ),
      ),
    );
  }