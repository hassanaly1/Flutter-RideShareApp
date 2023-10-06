import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/screens/user/home/cancel_ride_screen.dart';
import 'package:google_maps/screens/user/home/destination_screen.dart';
import 'package:google_maps/screens/user/home/driver_chat_screen.dart';
import 'package:google_maps/screens/user/home/driver_profile_screen.dart';
import 'package:google_maps/screens/user/home/payment_screen.dart';
import 'package:google_maps/widgets/custom_button.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverArrivingScreen extends StatefulWidget {
  const DriverArrivingScreen({super.key});

  @override
  State<DriverArrivingScreen> createState() => _DriverArrivingScreenState();
}

class _DriverArrivingScreenState extends State<DriverArrivingScreen> {
  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(24.971723, 67.065707), zoom: 14.0);

  final Completer<GoogleMapController> _controller = Completer();

  final List<Marker> _marker = [];

  final List<Marker> list = [
    const Marker(
      markerId: MarkerId('1'),
      position: LatLng(24.971723, 67.065707),
      infoWindow: InfoWindow(title: 'My current location'),
    ),
    const Marker(
      markerId: MarkerId('2'),
      position: LatLng(24.965954, 67.058156),
      infoWindow: InfoWindow(title: 'My areas location'),
    ),
    const Marker(
      markerId: MarkerId('3'),
      position: LatLng(24.968908, 67.064789),
      infoWindow: InfoWindow(title: 'My areas location'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _marker.addAll(list);
    Timer(
      Duration(seconds: 1),
      () => _openBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.to(PaymentScreen(), transition: Transition.upToDown);
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              initialCameraPosition: _kGooglePlex,
              markers: Set<Marker>.of(_marker),
              // mapType: MapType.hybrid,
              myLocationEnabled: true,
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              compassEnabled: true,
            ),
          ],
        ),
      ),
    );
  }

  void _openBottomSheet() {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const DriverConfirmationSheet();
      },
    );
  }
}

class DriverConfirmationSheet extends StatefulWidget {
  const DriverConfirmationSheet({super.key});

  @override
  _DriverConfirmationSheetState createState() =>
      _DriverConfirmationSheetState();
}

class _DriverConfirmationSheetState extends State<DriverConfirmationSheet> {
  bool isDriverArrived = false;

  @override
  void initState() {
    super.initState();

    // Start the timer when the widget is created
    Timer(
      Duration(seconds: 3),
      () {
        setState(() {
          isDriverArrived = true;
        });
      },
    );
  }
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(
  //     Duration(seconds: 3),
  //     () {
  //       setState(() {
  //         isDriverArrived = true;
  //       });
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: isDriverArrived ? Get.height * 0.55 : Get.height * 0.45,
        decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  text: isDriverArrived
                      ? 'Driver has Arrived'
                      : 'Driver is Arriving...',
                  fSize: 22,
                  fWeight: FontWeight.w700,
                ),
                CustomTextWidget(
                  text: isDriverArrived ? '0 minutes' : '2 minutes',
                  fSize: 16,
                  fWeight: FontWeight.w400,
                ),
              ],
            ),
            const Divider(
              color: Colors.black26,
              height: 25,
              thickness: 1,
              indent: 5,
              endIndent: 5,
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () => Get.to(const DriverProfileView(),
                  transition: Transition.rightToLeft),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey.shade200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Image(image: AssetImage('assets/saim.jpg')),
                      radius: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: 'Daniel Austin',
                          fSize: 22,
                          fWeight: FontWeight.w600,
                        ),
                        SizedBox(width: 12),
                        CustomTextWidget(
                          text: 'Mercedes-Benz E-Class',
                          fSize: 16,
                          fWeight: FontWeight.w400,
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star_half_rounded,
                              color: Colors.black87,
                            ),
                            CustomTextWidget(text: '4.8'),
                          ],
                        ),
                        SizedBox(height: 12),
                        CustomTextWidget(
                          text: 'HSW 3282 DC',
                          fSize: 14,
                          fWeight: FontWeight.w400,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.06),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomIconContainer(
                  icon: Icons.cancel,
                  onTap: () {
                    Get.to(CancelRide(), transition: Transition.downToUp);
                  },
                ),
                CustomIconContainer(
                  icon: Icons.chat_sharp,
                  onTap: () {
                    Get.to(DriverChatScreen(),
                        transition: Transition.rightToLeft);
                  },
                ),
                CustomIconContainer(
                  icon: Icons.call,
                  onTap: () {},
                )
              ],
            ),
            Spacer(),
            Visibility(
                visible: isDriverArrived,
                child: CustomButton(
                  buttonText: 'Start Ride',
                  onTap: () {
                    Get.to(DestinationScreen(),
                        transition: Transition.downToUp);
                  },
                )),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
