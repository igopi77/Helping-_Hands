import 'package:flutter/material.dart';
import 'package:frontend/component/viewmodel/map_redirect.dart';

class RedirectionMap extends StatefulWidget {
  const RedirectionMap({super.key});

  @override
  State<RedirectionMap> createState() => _RedirectionMapState();
}

class _RedirectionMapState extends State<RedirectionMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("MAP"),
          onPressed: () {
            MapRedirect.openMap(47.628293260721,-122.34263420105);
          },
        ),
      ),
    );
  }
}