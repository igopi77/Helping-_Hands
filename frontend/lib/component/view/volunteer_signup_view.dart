import 'package:flutter/material.dart';

class VolunteerSignupView extends StatefulWidget {
  const VolunteerSignupView({super.key});

  @override
  State<VolunteerSignupView> createState() => _VolunteerSignupViewState();
}

class _VolunteerSignupViewState extends State<VolunteerSignupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyPartOfSignup(),
    );
  }

  Widget bodyPartOfSignup(){
    TextEditingController usernameController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController skillsController = TextEditingController();
    List<String> fieldForSignUp = [
      "Username",
      "Password",
      "Phone no",
      "Skills"
    ];
    List<TextEditingController> fieldForSignUpController = [
      usernameController,
      passController,
      phoneController,
      skillsController
    ];
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 50)),
        Text("Sign Up",style: TextStyle(fontFamily: "Raleway",fontSize: 18,color: Colors.black),),
        Padding(padding: EdgeInsets.only(top: 30)),
        loginContainer(),
      ],
    );
  }
  Widget loginContainer(){
    return Column(
      children: [

      ],
    );
  }

}
