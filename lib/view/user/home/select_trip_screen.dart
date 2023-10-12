import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/constants/colors.dart';
import 'package:google_maps/view/user/home/payment_screen.dart';
import 'package:google_maps/widgets/custom_button.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectTripScreen extends StatefulWidget {
  const SelectTripScreen({super.key});

  @override
  State<SelectTripScreen> createState() => _SelectTripScreenState();
}

class _SelectTripScreenState extends State<SelectTripScreen> {
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
    return Stack(
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
    );
  }

  void _openBottomSheet() {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const TripSelectionBottomSheet();
      },
    );
  }
}

class TripSelectionBottomSheet extends StatefulWidget {
  const TripSelectionBottomSheet({super.key});

  @override
  _TripSelectionBottomSheetState createState() =>
      _TripSelectionBottomSheetState();
}

class _TripSelectionBottomSheetState extends State<TripSelectionBottomSheet> {
  int selectedTileIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(16)),
        height: Get.height * 0.6,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
                child: CustomTextWidget(
              text: 'Choose a Trip',
              fSize: 22,
              fWeight: FontWeight.w700,
            )),
            const Divider(
              color: Colors.black26,
              height: 25,
              thickness: 1,
              indent: 5,
              endIndent: 5,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: selectedTileIndex == index ? 5 : 0,
                    shape: selectedTileIndex == index
                        ? RoundedRectangleBorder(
                            side: const BorderSide(color: AppAssets.textColor),
                            borderRadius: BorderRadius.circular(8.0),
                          )
                        : null,
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          selectedTileIndex = index;
                        });
                      },
                      leading: const Icon(Icons.car_rental_outlined),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: 'Rillu Go $index',
                            fSize: 16,
                          ),
                          CustomTextWidget(
                              text: '8:46 pm - $index minutes away.')
                        ],
                      ),
                      trailing: const CustomTextWidget(
                        text: '\$300',
                        fSize: 15,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              buttonText: 'Confirm pickup',
              onTap: () {
                Get.to(const PaymentScreen(),
                    transition: Transition.rightToLeft);
              },
            )
          ],
        ),
      ),
    );
  }
}
