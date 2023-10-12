import 'dart:async';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/models/driver_detail_model.dart';
import 'package:google_maps/view/user/home/driver_profile_screen.dart';
import 'package:google_maps/view/user/home/pickup_points_screen.dart';
import 'package:google_maps/view/user/home/see_passenger_list.dart';
import 'package:google_maps/widgets/custom_button.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TripInfoWidget extends StatefulWidget {
  final TripModel model;
  final Color color;
  final String buttonText;
  final VoidCallback onTap;
  final bool isBooked;
  final bool seePickupPoints;

  TripInfoWidget({
    super.key,
    required this.color,
    required this.buttonText,
    required this.onTap,
    required this.isBooked,
    required this.seePickupPoints,
    required this.model,
  });

  @override
  State<TripInfoWidget> createState() => _TripInfoWidgetState();
}

class _TripInfoWidgetState extends State<TripInfoWidget> {
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
                ? (widget.seePickupPoints ? Get.height * 0.9 : Get.height * 0.8)
                : (widget.seePickupPoints
                    ? Get.height * 0.85
                    : Get.height * 0.67))
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
                  Get.to(
                    DriverProfileView(model: widget.model),
                    transition: Transition.rightToLeft,
                  );
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage(widget.model.car.driverCarImages),
                  radius: 30,
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: widget.model.driver.driverName,
                      fSize: 14,
                      fWeight: FontWeight.w600,
                    ),
                    SizedBox(width: 12),
                    CustomTextWidget(
                      text: widget.model.car.carModel,
                      fSize: 12,
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
                      text: '${widget.model.seatsLeft} seats left',
                      fSize: 12,
                      fWeight: FontWeight.w400,
                      textColor: Colors.white,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
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
                        size: 12,
                      )
                    : Icon(
                        FluentIcons.arrow_down_12_filled,
                        size: 12,
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
                              CustomTextWidget(
                                  text: '${widget.model.travelDistance} km'),
                              Icon(Icons.timer),
                              CustomTextWidget(
                                  text: '${widget.model.travelTime} mins'),
                              Icon(Icons.attach_money),
                              CustomTextWidget(
                                  text: '\$${widget.model.travelCost}')
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
                                    text: widget.model.departureTime)
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
                          width: 10,
                          color: Colors.black, // Timeline color is green
                        ),
                        endChild: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextWidget(
                                text: widget.model.currentAddress,
                                textColor: Colors.black,
                                fSize: 14,
                                fWeight: FontWeight.w500,
                              ),
                              CustomTextWidget(
                                text: '3 km',
                                textColor: Colors.black,
                                fSize: 14,
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
                          width: 10,
                          color: Colors.black, // Timeline color is green
                        ),
                        endChild: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextWidget(
                                text: widget.model.destinationAddress,
                                textColor: Colors.black,
                                fSize: 14,
                                fWeight: FontWeight.w500,
                              ),
                              CustomTextWidget(
                                text: '7 km',
                                textColor: Colors.black,
                                fSize: 14,
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
                      Visibility(
                        visible: widget.isBooked,
                        child: CustomButton(
                          buttonText: 'See Passengers',
                          onTap: () => Get.to(SeePassengerList(),
                              transition: Transition.downToUp),
                        ),
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
                                Get.to(PickUpPointsScreen(),
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
