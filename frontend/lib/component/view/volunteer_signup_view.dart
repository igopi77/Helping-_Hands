import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VolunteerSignupView extends StatefulWidget {
  const VolunteerSignupView({super.key});

  @override
  State<VolunteerSignupView> createState() => _VolunteerSignupViewState();
}

class _VolunteerSignupViewState extends State<VolunteerSignupView> {

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
  late List<bool> checkboxDetails ;
  @override
  void initState(){
    super.initState();
    checkboxDetails = List<bool>.filled(survivalSkills.length, false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black38,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: bodyPartOfSignup()),
    );
  }

  Widget bodyPartOfSignup(){
    TextEditingController usernameController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    List<String> fieldForSignUp = [
      "Username",
      "Password",
      "Phone no",
    ];
    List<TextEditingController> fieldForSignUpController = [
      usernameController,
      passController,
      phoneController,
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: 50)),
          Text("Sign Up",style: TextStyle(fontFamily : "Raleway",fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
          Padding(padding: EdgeInsets.only(top: 30)),
          loginContainer(fieldForSignUp,fieldForSignUpController),
          Padding(padding: EdgeInsets.only(top: 15)),
          Text("Skills",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold
          ),),
          checkboxF(),
          Padding(padding: EdgeInsets.only(top: 15)),
          Center(
            child: MaterialButton(
              onPressed: () {

              },
              child: Text("Submit",style: TextStyle(fontSize: 16,fontFamily: "Raleway-SemiBold",color: Colors.white),),
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
  Widget checkboxF(){
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Column(
        children: List.generate(survivalSkills.length, (index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${survivalSkills[index]}",style: TextStyle(fontFamily: "Raleway-SemiBold",fontSize: 17,color: Colors.black),),
              Checkbox(
                value: checkboxDetails[index],
                onChanged: (value) {
                  setState(() {
                    checkboxDetails[index] = value!;
                  });
                },
                // activeColor: Colors.white,

              ),
            ],
          );
        }),
      ),
    );
  }
  Widget loginContainer(List<String> fieldForSignUp,List<TextEditingController> fieldForSignUpController){
    return Column(
      children: [
        Column(
          children: List.generate(fieldForSignUp.length, (index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black,width: 1)
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      hintText: fieldForSignUp[index],
                      hintStyle: TextStyle(fontSize: 16,color: Colors.grey)
                    ),
                    controller: fieldForSignUpController[index],
                    obscureText: fieldForSignUp[index]=="Password" ? true : false,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15))
              ],
            );
          }),
        )
      ],
    );
  }

}
