import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          child: Text(" Assigned ",style: TextStyle(fontFamily: "Raleway",fontSize: 18,color: Colors.white),),
        ),
        assignedVolunteers(),
        Padding(padding: EdgeInsets.only(top: 15)),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF031149)
          ),
          child: Text(" Availability ",style: TextStyle(fontFamily: "Raleway",fontSize: 18,color: Colors.white),),
        ),
        availabilityVolunteers(),
      ],
    );
  }
  Widget availabilityVolunteers(){
    List<String> info = [
      "Gopinath S",
      "Kamalesh R",
      "Muthuvel A",
      "Prakash S"
    ];
    List<String> out = [
      "543542313",
      "421231244",
      "872394824",
      "432342325"
    ];
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
            children: List.generate(info.length, (index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(info[index],style: TextStyle(fontFamily: "Raleway",fontSize: 17),),
                  Text(out[index],style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17),)
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
    List<String> info = [
      "Gopinath S",
      "Kamalesh R",
      "Muthuvel A",
      "Prakash S"
    ];
    List<String> out = [
      "543542313",
      "421231244",
      "872394824",
      "432342325"
    ];
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
            children: List.generate(info.length, (index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(info[index],style: TextStyle(fontFamily: "Raleway",fontSize: 17),),
                  Text(out[index],style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17),)
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
