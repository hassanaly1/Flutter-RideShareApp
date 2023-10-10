import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/screens/user/home/book_bus_seat_screen.dart';
import 'package:google_maps/screens/user/home/book_car_seat_screen.dart';
import 'package:google_maps/screens/user/home/request_ride_dialog.dart';
import 'package:google_maps/screens/user/home/ride_notification_screen.dart';
import 'package:google_maps/screens/user/home/search_rides.dart';
import 'package:google_maps/widgets/animated_conatiner.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTabIndex = 0;
  final List availableCarDriverName = [
    'Rayford Midgett',
    'John Doe',
  ];

  final List availableBusDriverName = [
    'Susan Wilson',
    'James Johnson',
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.car_rental_sharp, color: Colors.black),
          ),
          actions: [
            InkWell(
              onTap: () {
                Get.to(RideNotificationScreen(),
                    transition: Transition.upToDown);
              },
              child: Container(
                padding: EdgeInsets.all(20),
                child: const Badge(
                  label: Text("3"),
                  child: Icon(Icons.notifications),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(SearchRidesScreen(), transition: Transition.downToUp);
              },
              child: Container(
                padding: EdgeInsets.all(20),
                child: Icon(Icons.search),
              ),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: "Carpool"),
              Tab(text: "Bus"),
            ],
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: _currentTabIndex == 0 ? Colors.black : Colors.black,
            onTap: (index) {
              setState(() {
                _currentTabIndex = index;
              });
            },
          ),
        ),
        body: TabBarView(
          children: [
            //Active
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 15),
                  CustomTextWidget(
                    text: 'Recently Published Car Rides',
                    fSize: 18,
                    fWeight: FontWeight.w500,
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: availableCarDriverName.length,
                    itemBuilder: (context, index) {
                      return AnimatedContainerWidget(
                        isBooked: true,
                        seePickupPoints: true,
                        text: '12 seat left',
                        color: Colors.black87,
                        buttonText: 'Book Seat',
                        driverName: availableCarDriverName[index].toString(),
                        onTap: () => Get.to(BookingCarSeatScreen(),
                            transition: Transition.downToUp),
                      );
                    },
                  ),
                ],
              ),
            ),
            //Cancelled
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 15),
                  CustomTextWidget(
                    text: 'Recently Published Bus Rides',
                    fSize: 18,
                    fWeight: FontWeight.w500,
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: availableBusDriverName.length,
                    itemBuilder: (context, index) {
                      return AnimatedContainerWidget(
                        isBooked: true,
                        seePickupPoints: true,
                        text: '12 seat left',
                        color: Colors.black87,
                        buttonText: 'Book Seat',
                        driverName: availableBusDriverName[index].toString(),
                        onTap: () => Get.to(BookingBusSeatScreen(),
                            transition: Transition.downToUp),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.black,
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return RequestRideDialog();
                },
              );
            },
            label: CustomTextWidget(
              text: 'Request a Ride?',
              fWeight: FontWeight.w700,
              textColor: Colors.white,
            )),
      ),
    );
  }
}

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     height: Get.height * 0.4,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(16.0),
          //     ),
          //     child: GoogleMap(
          //       onMapCreated: (GoogleMapController controller) {
          //         _controller.complete(controller);
          //       },
          //       initialCameraPosition: _kGooglePlex,
          //       markers: Set<Marker>.of(_marker),
          //       // mapType: MapType.hybrid,
          //       myLocationEnabled: true,
          //       mapType: MapType.terrain,
          //       myLocationButtonEnabled: true,
          //       compassEnabled: true,
          //     ),
          //   ),
          // ),
          // InkWell(
          //   onTap: () =>
          //       Get.to(SearchRidesScreen(), transition: Transition.downToUp),
          //   child: Container(
          //     height: 55.0,
          //     width: double.infinity,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(3.0),
          //       color: Colors.white,
          //       boxShadow: [
          //         BoxShadow(
          //             color: Colors.grey,
          //             offset: Offset(1.0, 2.0),
          //             blurRadius: 5,
          //             spreadRadius: 3)
          //       ],
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 10),
          //       child: Row(
          //         children: [
          //           Icon(Icons.search),
          //           SizedBox(width: 15),
          //           CustomTextWidget(
          //             text: 'Where to?',
          //             fSize: 20,
          //             fWeight: FontWeight.w700,
          //             textColor: Colors.grey.shade700,
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
      
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.location_on),
      //   onPressed: () async {
      //     GoogleMapController controller = await _controller.future;
      //     controller.animateCamera(
      //       CameraUpdate.newCameraPosition(
      //         const CameraPosition(target: LatLng(35.6762, 139.6503), zoom: 14),
      //       ),
      //     );
      //     setState(() {});
      //   },
      // ),