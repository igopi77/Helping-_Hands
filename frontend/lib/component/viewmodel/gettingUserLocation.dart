// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

// class _LocationPageState extends State<LocationPage> {
  

//   Future<void> _getCurrentPosition() async {
//   final hasPermission = await _handleLocationPermission();
//   if (!hasPermission) return;
//   await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high)
//       .then((Position position) {
//     setState(() => _currentPosition = position);
//   }).catchError((e) {
//     debugPrint(e);
//   });
// }}