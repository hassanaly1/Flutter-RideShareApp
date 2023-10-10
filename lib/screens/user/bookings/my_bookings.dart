import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/screens/user/home/cancel_ride_screen.dart';
import 'package:google_maps/screens/user/home/picup_points.dart';
import 'package:google_maps/widgets/animated_conatiner.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class MyBookings extends StatefulWidget {
  const MyBookings({Key? key}) : super(key: key);

  @override
  State<MyBookings> createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  int _currentTabIndex = 0;
  final List cancelledDriverName = [
    'Rayford Midgett',
    'John Doe',
    'Jane Smith',
  ];

  final List bookedDriverName = [
    'Susan Wilson',
    'James Johnson',
    'Karen Davis',
    'Robert Clark',
    'Lisa Jones',
    'Kevin Allen',
    'Samantha Harris',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: CustomTextWidget(
            text: "My Rides",
            fSize: 16,
            fWeight: FontWeight.w700,
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.car_rental_sharp, color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu_book_outlined),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: "Booked Rides"),
              Tab(text: "Cancelled Rides"),
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
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: bookedDriverName.length,
                    itemBuilder: (context, index) {
                      return AnimatedContainerWidget(
                        seePickupPoints: false,
                        isBooked: true,
                        text: 'Booked',
                        color: Colors.green,
                        buttonText: 'Cancel Ride',
                        driverName: bookedDriverName[index].toString(),
                        onTap: () => Get.to(CancelRide(),
                            transition: Transition.downToUp),
                      );
                    },
                  )
                ],
              ),
            ),
            //Cancelled
            SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: cancelledDriverName.length,
                    itemBuilder: (context, index) {
                      return AnimatedContainerWidget(
                        isBooked: false,
                        seePickupPoints: false,
                        text: 'Cancelled',
                        color: Colors.red,
                        buttonText: 'See Pickup Points',
                        driverName: cancelledDriverName[index].toString(),
                        onTap: () => Get.to(PickUpPoints(),
                            transition: Transition.downToUp),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
