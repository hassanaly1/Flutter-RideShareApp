import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/constants/utils.dart';
import 'package:google_maps/screens/user/bottombar.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class DriverModeScreen extends StatefulWidget {
  const DriverModeScreen({super.key});

  @override
  State<DriverModeScreen> createState() => _DriverModeScreenState();
}

class _DriverModeScreenState extends State<DriverModeScreen> {
  bool isDriverModeOn = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Driver Mode'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextWidget(
              text: 'Driver Mode',
              fSize: 20,
            ),
            Switch(
              activeColor: Colors.black87,
              value: true,
              onChanged: (newValue) {
                // Update the notification state when the switch is toggled
                setState(() {
                  isDriverModeOn = newValue;
                  Utils().toastMessage('You are in User mode now.');
                  Get.to(BottomBar(), transition: Transition.downToUp);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
