import 'package:flutter/material.dart';
import 'package:frontend/component/viewmodel/map_redirect.dart';

// ignore: must_be_immutable
class RedirectionMap extends StatefulWidget {
  RedirectionMap(this.lat, this.lon, {super.key});
  // ignore: prefer_typing_uninitialized_variables
  var lat;
  // ignore: prefer_typing_uninitialized_variables
  var lon;

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
            MapRedirect.openMap(widget.lat,widget.lon);
          },
        ),
      ),
    );
  }
}