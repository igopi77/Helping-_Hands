import 'package:flutter/material.dart';
import 'package:frontend/component/utils/User.dart';
import 'package:frontend/component/view/volunteer_signup_view.dart';
import 'package:frontend/service/login_service.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? _selectedCharacter;
  final List<String> _characterOptions = ['Volunteer', 'Admin'];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF031149), Color.fromARGB(255, 68, 79, 123)],
            ),
          ),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: width / 2)),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(width / 10),
                    topLeft: Radius.circular(width / 10),
                  ),
                ),
                width: width,
                child: Padding(
                  padding: EdgeInsets.all(width / 20),
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: width / 20)),
                      Text(
                        "Login",
                        style: TextStyle(
                          // fontFamily: "Raleway",
                          fontSize: width / 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: width / 15)),
                      Container(
                        width: width - 2 * width / 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width / 40),
                        ),
                        child: TextField(
                          controller: username,
                          textAlign: TextAlign.justify,
                          decoration: InputDecoration(
                            label: const Text("username",style: TextStyle(),),
                            suffixIcon: const Icon(Icons.person_outline),
                            labelStyle: TextStyle(
                              color: const Color(0xFF031149),
                              fontSize: width / 20,
                              // fontFamily: "Raleway-SemiBold",
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: width / 15)),
                      Container(
                        width: width - 2 * width / 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width / 40),
                        ),
                        child: TextField(
                          controller: password,
                          obscureText: true,
                          textAlign: TextAlign.justify,
                          decoration: InputDecoration(
                            label: const Text("password"),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              // fontFamily: "Raleway-SemiBold",
                              color: const Color(0xFF031149),
                              fontSize: width / 20,
                            ),
                            suffixIcon: const Icon(Icons.remove_red_eye),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: width / 10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _characterOptions
                            .map((option) => Row(
                                  children: [
                                    Radio<String>(
                                      value: option,
                                      groupValue: _selectedCharacter,
                                      onChanged: (String? value) {
                                        setState(() {
                                          _selectedCharacter = value;
                                        });
                                      },
                                    ),
                                    Text(
                                      option,
                                      style: TextStyle(fontSize: width / 20),
                                    ),
                                  ],
                                ))
                            .toList(),
                      ),
                      Padding(padding: EdgeInsets.only(top: width / 20)),
                      SizedBox(
                        width: width - 2 * width / 20,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              User.username = username.text;
                              User.pass = password.text;
                              User.type = 'Admin'==_selectedCharacter!;
                              validateUser();
                            });
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 24, 40, 103),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              // fontFamily: "Raleway-SemiBold",
                              fontSize: width / 20,
                            ),
                          ),
                        ),
                      ),

                      const Text("Dont have an account"),

                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const VolunteerSignupView()));
                      }, 
                      child: const Text(
                        "signup")
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}