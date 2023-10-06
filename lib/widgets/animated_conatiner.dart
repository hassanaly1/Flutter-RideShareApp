import 'dart:async';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/screens/user/home/driver_profile_screen.dart';
import 'package:google_maps/screens/user/home/picup_points.dart';
import 'package:google_maps/screens/user/home/see_passenger_list.dart';
import 'package:google_maps/widgets/custom_button.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:timeline_tile/timeline_tile.dart';

class AnimatedContainerWidget extends StatefulWidget {
  final String text;
  final String driverName;
  final Color color;
  final String buttonText;
  final VoidCallback onTap;
  final bool isBooked;
  final bool seePickupPoints;
  AnimatedContainerWidget(
      {super.key,
      required this.text,
      required this.color,
      required this.driverName,
      required this.buttonText,
      required this.onTap,
      required this.isBooked,
      required this.seePickupPoints});

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  bool isContainerExpanded = false;
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
  }

  void toggleContainer() {
    setState(() {
      isContainerExpanded = !isContainerExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: AnimatedContainer(
        duration: Duration(microseconds: 0),
        height: isContainerExpanded
            ? (widget.isBooked
                ? (widget.seePickupPoints
                    ? Get.height * 0.9
                    : Get.height * 0.75)
                : (widget.seePickupPoints
                    ? Get.height * 0.85
                    : Get.height * 0.65))
            : Get.height * 0.20,
        width: Get.width * 0.8,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  Get.to(DriverProfileView(),
                      transition: Transition.rightToLeft);
                },
                leading: CircleAvatar(
                  child: Image(image: AssetImage('assets/saim.jpg')),
                  radius: 30,
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: widget.driverName,
                      fSize: 18,
                      fWeight: FontWeight.w600,
                    ),
                    SizedBox(width: 12),
                    CustomTextWidget(
                      text: 'Honda Mobilio',
                      fSize: 15,
                      fWeight: FontWeight.w400,
                    ),
                  ],
                ),
                trailing: Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: CustomTextWidget(
                      text: widget.text,
                      fSize: 16,
                      fWeight: FontWeight.w400,
                      textColor: Colors.white,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              const Divider(
                color: Colors.black26,
                height: 25,
                thickness: 1,
                indent: 5,
                endIndent: 5,
              ),
              IconButton(
                icon: isContainerExpanded
                    ? Icon(
                        FluentIcons.arrow_up_12_filled,
                        size: 15,
                      )
                    : Icon(
                        FluentIcons.arrow_down_12_filled,
                        size: 15,
                      ),
                onPressed: toggleContainer,
              ),
              if (isContainerExpanded)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.pin_drop),
                              CustomTextWidget(text: '4.5 km'),
                              Icon(Icons.timer),
                              CustomTextWidget(text: '4 mins'),
                              Icon(Icons.attach_money),
                              CustomTextWidget(text: '\$7.00')
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomTextWidget(text: 'Leaving'),
                                CustomTextWidget(
                                    text: 'Sep 20, 2023 | 10:00 AM')
                              ],
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        color: Colors.black26,
                        height: 25,
                        thickness: 1,
                        indent: 5,
                        endIndent: 5,
                      ),
                      TimelineTile(
                        alignment: TimelineAlign.start,
                        indicatorStyle: IndicatorStyle(
                          width: 15,
                          color: Colors.black, // Timeline color is green
                        ),
                        endChild: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextWidget(
                                text: '4753 Hyde Park Road',
                                textColor: Colors.black,
                                fSize: 22,
                                fWeight: FontWeight.w500,
                              ),
                              CustomTextWidget(
                                text: '3 km',
                                textColor: Colors.black,
                                fSize: 18,
                                fWeight: FontWeight.w300,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TimelineTile(
                        alignment: TimelineAlign.start,
                        indicatorStyle: IndicatorStyle(
                          width: 15,
                          color: Colors.black, // Timeline color is green
                        ),
                        endChild: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextWidget(
                                text: '3333 Albert Street',
                                textColor: Colors.black,
                                fSize: 22,
                                fWeight: FontWeight.w500,
                              ),
                              CustomTextWidget(
                                text: '7 km',
                                textColor: Colors.black,
                                fSize: 18,
                                fWeight: FontWeight.w300,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: Get.height * 0.2,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: GoogleMap(
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                          initialCameraPosition: _kGooglePlex,
                          markers: Set<Marker>.of(_marker),
                          // mapType: MapType.hybrid,
                          myLocationEnabled: true,
                          mapType: MapType.terrain,
                          myLocationButtonEnabled: true,
                          compassEnabled: true,
                        ),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      CustomButton(
                        buttonText: 'See Passengers',
                        onTap: () => Get.to(SeePassengerList(),
                            transition: Transition.downToUp),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      Visibility(
                        visible: widget.isBooked,
                        child: CustomButton(
                            buttonText: widget.buttonText, onTap: widget.onTap),
                      ),
                      Visibility(
                        visible: widget.seePickupPoints,
                        child: Column(
                          children: [
                            SizedBox(height: Get.height * 0.03),
                            CustomButton(
                              buttonText: 'See Pickup Points',
                              onTap: () {
                                Get.to(PickUpPoints(),
                                    transition: Transition.downToUp);
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              else
                Container()
            ],
          ),
        ),
      ),
    );
  }
}
