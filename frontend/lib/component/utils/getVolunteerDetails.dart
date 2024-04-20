import 'package:flutter/material.dart';
class GetVolunteer {
  final List<String> survivalSkills = [
    'First Aid',
    'Fire Starting',
    'Shelter Building',
    'Water Sourcing',
    'Food Foraging',
    'Basic Cooking',
    'Self-defense',
    'Emergency Signaling',
    'Emergency Preparedness'
  ];
  List<String> fieldForSignUp = [
    "Username",
    "Password",
    "Phoneno",
  ];
  Map<String,dynamic> report = {};
  void get(List<TextEditingController> controller,List<bool> checkbox){
    for(int i=0;i<controller.length;i++){
      report[fieldForSignUp[i]] = controller[i].text;
    }
    for(int i=0;i<survivalSkills.length;i++){
      if(checkbox[i] == true){
        report[survivalSkills[i]] = true;
      }
    }
    print(report);
  }
}