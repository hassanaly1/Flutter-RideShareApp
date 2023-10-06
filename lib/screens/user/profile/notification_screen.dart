import 'package:flutter/material.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isNotificationEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Notifications'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextWidget(
              text: 'Notifications',
              fSize: 20,
            ),
            Switch(
              activeColor: Colors.black87,
              value:
                  isNotificationEnabled, // Replace with your variable for tracking the notification state
              onChanged: (newValue) {
                // Update the notification state when the switch is toggled
                setState(() {
                  isNotificationEnabled = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
