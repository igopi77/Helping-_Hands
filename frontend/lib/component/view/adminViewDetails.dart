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
      body: bodyPartOfViewDetails(),
    );
  }
  Widget bodyPartOfViewDetails(){
    return Column(
      children: [

        assignedVolunteers()
      ],
    );
  }
  Widget assignedVolunteers(){
    return Container(
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
    );
  }
}
