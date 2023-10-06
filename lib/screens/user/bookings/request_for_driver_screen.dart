import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_maps/constants/utils.dart';
import 'package:google_maps/screens/user/home/payment_screen.dart';
import 'package:google_maps/widgets/custom_appbar.dart';

class RequestForDriverScreen extends StatefulWidget {
  const RequestForDriverScreen({super.key});

  @override
  State<RequestForDriverScreen> createState() => _RequestForDriverScreenState();
}

class _RequestForDriverScreenState extends State<RequestForDriverScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      (() => Get.to(const PaymentScreen(), transition: Transition.rightToLeft)),
    );
    Timer(
      const Duration(seconds: 2),
      (() => Utils().toastMessage('Driver has accepted your ride request.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Request for Ride'),
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
