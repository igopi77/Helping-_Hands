import 'package:flutter/material.dart';
import 'package:frontend/component/view/adminViewDetails.dart';
import 'package:frontend/component/view/landing_view.dart';
import 'package:frontend/component/view/lat_long_specifier.dart';
import 'package:frontend/component/view/login_view.dart';
import 'package:frontend/component/view/user_post.dart';
import 'package:frontend/component/view/volunteer_home_view.dart';
import 'package:frontend/component/view/volunteer_profile_view.dart';
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
        "/landing" : (context) => const LandingView(),
        "/login" : (context) => const LoginView(),
        "/volunteerSign" : (context) => const VolunteerSignupView(),
        "/volunteerHome" : (context) => const VolunteerHomeView(),
        "/volunteerProfile" : (context) => const VolunteerProfileView(),
        '/redirect' : (context) => RedirectionMap(null,null),
        '/post' :(context) => const Post(),
        "/adminViewDetails" : (context) => const AdminViewDetails()
      },
    );
  }
}