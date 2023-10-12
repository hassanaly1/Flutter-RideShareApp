import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/models/driver_detail_model.dart';
import 'package:google_maps/view/user/home/book_car_seat_screen.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';
import 'package:google_maps/widgets/trip_info_widget.dart';

class MyBookings extends StatefulWidget {
  const MyBookings({Key? key}) : super(key: key);

  @override
  State<MyBookings> createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  int _currentTabIndex = 0;
  final List bookedCarRides = [
    TripModel(
      seatsLeft: 4,
      travelDistance: 120.0,
      travelTime: 2.0,
      travelCost: 60.0,
      departureTime: "2023-10-13 15:00:00",
      currentAddress: "1234 Elm Street",
      destinationAddress: "5678 Oak Avenue",
      driver: DriverModel(
        driverName: "Alice Johnson",
        driverImage: "assets/saim.jpg",
        driverNumber: 9876543210,
        ratings: 4.8,
        trips: 150,
        years: 4.0,
        joiningYear: 2016,
      ),
      car: CarModel(
        driverCarImages: "assets/car.PNG",
        carModel: "Honda Accord",
        carPlateNumber: "XYZ 789",
      ),
    ),
    TripModel(
      seatsLeft: 2,
      travelDistance: 80.0,
      travelTime: 2.7,
      travelCost: 45.0,
      departureTime: "2023-10-14 16:30:00",
      currentAddress: "7890 Maple Lane",
      destinationAddress: "1234 Pine Street",
      driver: DriverModel(
        driverName: "Eve Smith",
        driverImage: "assets/saim.jpg",
        driverNumber: 5555555555,
        ratings: 4.2,
        trips: 120,
        years: 5.2,
        joiningYear: 2015,
      ),
      car: CarModel(
        driverCarImages: "assets/car.PNG",
        carModel: "Ford Fusion",
        carPlateNumber: "LMN 456",
      ),
    ),
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
                    itemCount: bookedCarRides.length,
                    itemBuilder: (context, index) {
                      return TripInfoWidget(
                        model: bookedCarRides[index],
                        isBooked: true,
                        seePickupPoints: true,
                        color: Colors.black87,
                        buttonText: 'Book Seat',
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
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: bookedCarRides.length,
                    itemBuilder: (context, index) {
                      return TripInfoWidget(
                        model: bookedCarRides[index],
                        isBooked: false,
                        seePickupPoints: false,
                        color: Colors.black87,
                        buttonText: 'Book Seat',
                        onTap: () => Get.to(BookingCarSeatScreen(),
                            transition: Transition.downToUp),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
