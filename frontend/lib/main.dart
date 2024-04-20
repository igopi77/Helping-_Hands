import 'package:flutter/material.dart';
import 'package:frontend/component/view/lat_long_specifier.dart';
import 'package:frontend/component/view/user_post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/post",
      routes: {
        '/redirect' : (context) => const RedirectionMap(),
        '/post' :(context) => const Post(),
      },
    );
  }
}