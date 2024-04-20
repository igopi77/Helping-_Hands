import 'package:flutter/material.dart';

class VolunteerProfileView extends StatefulWidget {
  const VolunteerProfileView({Key? key}) : super(key: key);

  @override
  State<VolunteerProfileView> createState() => _VolunteerProfileViewState();
}

class _VolunteerProfileViewState extends State<VolunteerProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
      ),
      body: bodyPartForProfile(),
    );
  }

  Widget bodyPartForProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://upload.wikimedia.org/wikipedia/commons/7/7a/Basketball.png",
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Gopinath S",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 20),
        profileContent(),
      ],
    );
  }

  Widget profileContent() {
    List<String> info = [
      "Phone No",
      "Availability",
      "Skill",
    ];
    List<String> out = [
      "9344751909",
      "Yes",
      "",
    ];
    List<String> skill = [
      'First Aid',
      'Fire Starting',
      'Shelter Building',
      'Water Sourcing',
      'Food Foraging',
      'Basic Cooking',
      'Self-defense',
      'Emergency Signaling',
      'Emergency Preparedness',
    ];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 1),
        color: Colors.grey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(info.length, (index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    info[index],
                    style: info[index] == "Skill" ?TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold) :
                        TextStyle(fontSize: 17, color: Colors.white,)
                  ),
                  Text(
                    out[index],
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ],
              ),
              if (info[index] == "Skill")
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(skill.length, (index) {
                    return Text(
                      skill[index],
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    );
                  }),
                ),
            ],
          );
        }),
      ),
    );
  }
}
