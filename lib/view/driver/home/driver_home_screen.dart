import 'package:flutter/material.dart';
import 'package:google_maps/models/shedule_ride_model.dart';
import 'package:google_maps/view/driver/home/schedule_ride_widget.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

import 'schedule_ride_dialog.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({super.key});

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  List<SheduleRideModel> sheduleRide = [];
  Future<void> showScheduleRideDialog(BuildContext context) async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return SheduleRideDialog(onRidePostCreated: scheduleRide);
      },
    );
  }

  void scheduleRide(SheduleRideModel ride) {
    setState(() {
      sheduleRide.add(ride);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: CustomTextWidget(
            text: 'Welcome back Andrew👋🏻',
            fSize: 16.0,
            fWeight: FontWeight.w700,
          ),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
            child: Column(
              children: [
                CustomTextWidget(
                  text: 'Your Rides Schedule',
                  fSize: 16,
                  fWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                ),

                // Display ride posts dynamically
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: sheduleRide.length,
                  itemBuilder: (context, index) {
                    return SheduleRideWidget(ridePost: sheduleRide[index]);
                  },
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: () {
            showScheduleRideDialog(context);
          },
          label: CustomTextWidget(
            text: 'Post a Ride?',
            fWeight: FontWeight.w700,
            textColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

class InfoRowWidget extends StatelessWidget {
  final String label;
  final String text;

  InfoRowWidget({required this.label, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextWidget(
          text: '$label: ',
          fSize: 16,
          fWeight: FontWeight.w700,
        ),
        CustomTextWidget(
          text: text,
          fSize: 16,
          fWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
