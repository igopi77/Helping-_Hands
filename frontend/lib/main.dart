

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/component/view/volunteer_signup_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/volunteerSign",
      routes: {
        "/volunteerSign" : (context) => const VolunteerSignupView()
      },
    );
  }
}