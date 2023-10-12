import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/constants/utils.dart';
import 'package:google_maps/view/driver/driver_bottombar.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class ModeScreen extends StatefulWidget {
  const ModeScreen({super.key});

  @override
  State<ModeScreen> createState() => _ModeScreenState();
}

class _ModeScreenState extends State<ModeScreen> {
  bool isDriverModeOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'User Mode'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextWidget(
              text: 'Driver Mode',
              fSize: 16,
            ),
            Switch(
              activeColor: Colors.black87,
              value:
                  isDriverModeOn, // Replace with your variable for tracking the notification state
              onChanged: (newValue) {
                // Update the notification state when the switch is toggled
                setState(() {
                  isDriverModeOn = newValue;
                  Get.to(DriverBottomBar(), transition: Transition.downToUp);
                  Utils().toastMessage('You are in Driver mode now.');
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
