import 'package:flutter/material.dart';
import 'package:frontend/component/utils/User.dart';
import 'package:frontend/component/view/login_view.dart';
import 'package:frontend/service/sign_up_service.dart';

class VolunteerSignupView extends StatefulWidget {
  const VolunteerSignupView({super.key});

  @override
  State<VolunteerSignupView> createState() => _VolunteerSignupViewState();
}

class _VolunteerSignupViewState extends State<VolunteerSignupView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController fullname = TextEditingController();

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
                        "Sign up",
                        style: TextStyle(
                          fontFamily: "Raleway",
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
                          controller: fullname,
                          textAlign: TextAlign.justify,
                          decoration: InputDecoration(
                            label: const Text("Full name"),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Raleway-SemiBold",
                              color: const Color(0xFF031149),
                              fontSize: width / 20,
                            ),
                            suffixIcon: const Icon(Icons.phone),
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
                          controller: username,
                          textAlign: TextAlign.justify,
                          decoration: InputDecoration(
                            label: const Text("username",),
                            suffixIcon: const Icon(Icons.person_outline),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF031149),
                              fontSize: width / 20,
                              fontFamily: "Raleway-SemiBold",
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
                          textAlign: TextAlign.justify,
                          obscureText: true,
                          decoration: InputDecoration(
                            label: const Text("password"),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Raleway-SemiBold",
                              color: const Color(0xFF031149),
                              fontSize: width / 20,
                            ),
                            suffixIcon: const Icon(Icons.remove_red_eye),
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
                          controller: phone,
                          textAlign: TextAlign.justify,
                          decoration: InputDecoration(
                            label: const Text("phone number"),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Raleway-SemiBold",
                              color: const Color(0xFF031149),
                              fontSize: width / 20,
                            ),
                            suffixIcon: const Icon(Icons.phone),
                          ),
                        ),
                      ),

                      Padding(padding: EdgeInsets.only(top: width / 10)),
                      Padding(padding: EdgeInsets.only(top: width / 20)),

                      SizedBox(
                        width: width - 2 * width / 20,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              User.fullname = fullname.text.trim();
                              User.username = username.text.trim();
                              User.phone = phone.text.trim();
                              User.pass = password.text.trim();
                              UserSignup();
                            });
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
                            "Sign up",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Raleway-SemiBold",
                              fontSize: width / 20,
                            ),
                          ),
                        ),
                      ),

                      const Text("Already have an account"),

                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginView()));
                      }, 
                      child: const Text(
                        "Login")
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
