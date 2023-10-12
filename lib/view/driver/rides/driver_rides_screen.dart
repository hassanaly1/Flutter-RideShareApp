import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/view/driver/home/collect_payment_screen.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:google_maps/widgets/custom_button.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class DriverRidesScreen extends StatefulWidget {
  const DriverRidesScreen({super.key});

  @override
  State<DriverRidesScreen> createState() => _DriverRidesScreenState();
}

class _DriverRidesScreenState extends State<DriverRidesScreen> {
  bool isRideAvailable = false;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () {
        setState(() {
          isRideAvailable = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Your Rides'),
      body: Column(
        children: [
          const Divider(
            color: Colors.black26,
            height: 25,
            thickness: 1,
            indent: 5,
            endIndent: 5,
          ),
          SizedBox(height: 20),
          isRideAvailable
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: Get.height * 0.4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      CustomTextWidget(
                        text: 'Great! You have 1 request',
                        fSize: 14,
                        fWeight: FontWeight.w700,
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                child:
                                    Image(image: AssetImage('assets/saim.jpg')),
                                radius: 30,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextWidget(
                                    text: 'Ricky James',
                                    fSize: 16,
                                    fWeight: FontWeight.w600,
                                  ),
                                  SizedBox(width: 12),
                                  CustomTextWidget(
                                    text: 'Pickup: 3400 Center St',
                                    fSize: 14,
                                    fWeight: FontWeight.w400,
                                  ),
                                  SizedBox(width: 12),
                                  CustomTextWidget(
                                    text: 'Drop: 712 rue Parc',
                                    fSize: 14,
                                    fWeight: FontWeight.w400,
                                  )
                                ],
                              ),
                              CustomTextWidget(
                                text: '\$15',
                                fSize: 14,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomButton(
                                width: 150,
                                buttonColor: Colors.green,
                                buttonText: 'Accept',
                                onTap: () {
                                  Get.to(CollectPaymentScreen(),
                                      transition: Transition.downToUp);
                                },
                              ),
                              CustomButton(
                                width: 150,
                                buttonColor: Colors.red,
                                buttonText: 'Reject',
                                onTap: () {},
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: CustomButton(
                              textColor: Colors.black,
                              buttonColor: Colors.grey.shade500,
                              buttonText: 'See Location',
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : CustomTextWidget(
                  text: 'No Ride request at the moment.',
                  fSize: 16,
                  fWeight: FontWeight.w400,
                ),
        ],
      ),
    );
  }
}
