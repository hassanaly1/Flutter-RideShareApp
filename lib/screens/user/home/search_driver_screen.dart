import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_maps/screens/user/home/driving_arriving_screen.dart';
import 'package:google_maps/widgets/custom_appbar.dart';

class SearchForDriverScreen extends StatefulWidget {
  const SearchForDriverScreen({super.key});

  @override
  State<SearchForDriverScreen> createState() => _SearchForDriverScreenState();
}

class _SearchForDriverScreenState extends State<SearchForDriverScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      (() => Get.to(const DriverArrivingScreen(),
          transition: Transition.rightToLeft)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Searching for Driver'),
      body: Center(
        child: SpinKitRipple(
          color: Colors.black,
          size: 300.0,
          duration: Duration(seconds: 1),
        ),
      ),
    );
  }
}
