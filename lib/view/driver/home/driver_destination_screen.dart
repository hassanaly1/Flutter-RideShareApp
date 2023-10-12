import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_maps/view/driver/home/collect_payment_screen.dart';
import 'package:google_maps/view/user/bottombar.dart';
import 'package:google_maps/view/user/chats/driver_chat_screen.dart';
import 'package:google_maps/view/user/home/driver_profile_screen.dart';
import 'package:google_maps/widgets/custom_address_widget.dart';
import 'package:google_maps/widgets/custom_button.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverDestinationScreen extends StatefulWidget {
  const DriverDestinationScreen({super.key});

  @override
  State<DriverDestinationScreen> createState() =>
      _DriverDestinationScreenState();
}

class _DriverDestinationScreenState extends State<DriverDestinationScreen> {
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
    // Timer(
    //   Duration(seconds: 1),
    //   () => _openBottomSheet(),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Get.to(BottomBar(), transition: Transition.upToDown);
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
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Wrap(children: [const TripToDestination()]);
      },
    );
  }
}

class TripToDestination extends StatefulWidget {
  const TripToDestination({super.key});

  @override
  _TripToDestinationState createState() => _TripToDestinationState();
}

class _TripToDestinationState extends State<TripToDestination> {
  bool isDestinationArrived = false;
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        setState(() {
          isDestinationArrived = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Expanded(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          height: isDestinationArrived ? Get.height * 0.75 : Get.height * 0.7,
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
                    text: 'Trip to Destination',
                    fSize: 22,
                    fWeight: FontWeight.w700,
                  ),
                  CustomTextWidget(
                    text: '2 minutes',
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
              const SizedBox(height: 5),
              //DRIVER PROFILE
              Row(
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
                        text: 'Ricky James',
                        fSize: 22,
                        fWeight: FontWeight.w600,
                      ),
                      SizedBox(width: 12),
                      CustomTextWidget(
                        text: 'Pickup: 3400 Center St',
                        fSize: 16,
                        fWeight: FontWeight.w400,
                      ),
                      SizedBox(width: 12),
                      CustomTextWidget(
                        text: 'Drop: 712 rue Parc',
                        fSize: 16,
                        fWeight: FontWeight.w400,
                      )
                    ],
                  ),
                  CustomTextWidget(
                    text: '\$15',
                    fSize: 20,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Divider(
                color: Colors.black26,
                height: 25,
                thickness: 1,
                indent: 5,
                endIndent: 5,
              ),
              CustomAddressWidget(
                address: '3400 Center St',
              ),
              CustomAddressWidget(
                address: '712 rue Parc',
              ),

              const Divider(
                color: Colors.black26,
                height: 25,
                thickness: 1,
                indent: 5,
                endIndent: 5,
              ),
              SizedBox(height: Get.height * 0.03),
              //ICONS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomIconContainer(
                    icon: Icons.chat_sharp,
                    onTap: () {
                      Get.to(
                          DriverChatScreen(
                            driverName: '',
                          ),
                          transition: Transition.rightToLeft);
                    },
                  ),
                  CustomIconContainer(
                    icon: Icons.call,
                    onTap: () {},
                  )
                ],
              ),
              SizedBox(height: Get.height * 0.06),
              WillPopScope(
                onWillPop: () async {
                  return false;
                },
                child: Visibility(
                    visible: isDestinationArrived,
                    child: CustomButton(
                      buttonText: 'Arrived at Destination',
                      onTap: () {
                        //openModal();
                        Get.to(CollectPaymentScreen(),
                            transition: Transition.downToUp);
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> openModal() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: AlertDialog(
            title: CustomTextWidget(
              text: "You have arrived at your destination",
              fSize: 26,
              fWeight: FontWeight.w700,
            ),
            content: CustomTextWidget(
              text: 'See you on the next trip.',
              fSize: 18,
            ),
            actions: [
              Center(
                child: CustomTextWidget(
                  text: 'How is your Customer?',
                  fSize: 24,
                  fWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 15),
              Center(
                child: RatingBar.builder(
                  itemSize: 30.0,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.black87,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
              SizedBox(height: 15),
              CustomButton(
                buttonText: 'Submit',
                onTap: () =>
                    Get.offAll(BottomBar(), transition: Transition.upToDown),
              ),
              SizedBox(height: 15),
            ],
          ),
        );
      },
    );
  }
}
