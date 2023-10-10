import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/constants/utils.dart';
import 'package:google_maps/screens/user/bottombar.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:google_maps/widgets/custom_button.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class CancelRide extends StatefulWidget {
  const CancelRide({Key? key}) : super(key: key);

  @override
  State<CancelRide> createState() => _CancelRideState();
}

class _CancelRideState extends State<CancelRide> {
  Set<String> selectedReasons = Set<String>();

  List<String> cancelRideReasons = [
    'Waiting for a long time.',
    'Unable to contact the driver.',
    'Driver denied to go to the destination.',
    'Driver denied to come to pickup.',
    'Wrong address shown.',
    'The price is not reasonable.',
    'Others',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Cancel Ride'),
      body: Column(
        children: [
          CustomTextWidget(
            text: 'Please select the reason(s) for cancellation.',
            fSize: 16,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: cancelRideReasons.length,
            itemBuilder: (context, index) {
              final reason = cancelRideReasons[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        selectedReasons.contains(reason)
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                      ),
                      onPressed: () {
                        setState(() {
                          if (selectedReasons.contains(reason)) {
                            selectedReasons.remove(reason);
                          } else {
                            selectedReasons.add(reason);
                          }
                        });
                      },
                    ),
                    SizedBox(width: 10),
                    CustomTextWidget(
                      text: reason,
                      fSize: 12,
                    ),
                  ],
                ),
              );
            },
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: CustomButton(
              buttonText: 'Submit',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: AlertDialog(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        buttonPadding: EdgeInsets.all(10),
                        title: CustomTextWidget(
                          text: "We're so sad about your cancellation.",
                          fSize: 18,
                          fWeight: FontWeight.w700,
                        ),
                        content: CustomTextWidget(
                          text:
                              'We will continue to improve our service & satisfy you on the next trip.',
                          fSize: 14,
                        ),
                        actions: [
                          CustomButton(
                            buttonText: 'OK',
                            onTap: () {
                              Utils()
                                  .toastMessage('Ride cancelled Successfully');
                              Get.offAll(BottomBar(),
                                  transition: Transition.upToDown);
                            },
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
