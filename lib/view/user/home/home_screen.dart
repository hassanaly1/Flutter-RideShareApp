import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/models/driver_detail_model.dart';
import 'package:google_maps/view/user/home/book_car_seat_screen.dart';
import 'package:google_maps/view/user/home/request_ride_dialog.dart';
import 'package:google_maps/view/user/home/ride_notification_screen.dart';
import 'package:google_maps/view/user/home/search_rides_screen.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';
import 'package:google_maps/widgets/trip_info_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTabIndex = 0;
  final List availableCarDrivers = [
    TripModel(
      seatsLeft: 3,
      travelDistance: 100.0,
      travelTime: 2.5,
      travelCost: 50.0,
      departureTime: "2023-10-12 14:00:00",
      currentAddress: "4524 Hyde Park Road",
      destinationAddress: "3333 Albert Road",
      driver: DriverModel(
        driverName: "Rayford Midgett",
        driverImage: "assets/saim.jpg",
        driverNumber: 1234567890,
        ratings: 4.5,
        trips: 100,
        years: 3.5,
        joiningYear: 2018,
      ),
      car: CarModel(
        driverCarImages: "assets/car.PNG",
        carModel: "Toyota Camry",
        carPlateNumber: "ABC 123",
      ),
    ),
    TripModel(
      seatsLeft: 3,
      travelDistance: 100.0,
      travelTime: 2.5,
      travelCost: 50.0,
      departureTime: "2023-10-12 14:00:00",
      currentAddress: "4524 Hyde Park Road",
      destinationAddress: "3333 Albert Road",
      driver: DriverModel(
        driverName: "Mark Henry",
        driverImage: "assets/saim.jpg",
        driverNumber: 1234567890,
        ratings: 4.5,
        trips: 100,
        years: 3.5,
        joiningYear: 2018,
      ),
      car: CarModel(
        driverCarImages: "assets/car.PNG",
        carModel: "Mercedez Benz",
        carPlateNumber: "ABC 123",
      ),
    ),
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
                Get.to(SearchRideScreen(), transition: Transition.downToUp);
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
                    itemCount: availableCarDrivers.length,
                    itemBuilder: (context, index) {
                      return TripInfoWidget(
                        model: availableCarDrivers[index],
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
                  SizedBox(height: 15),
                  CustomTextWidget(
                    text: 'Recently Published Bus Rides',
                    fSize: 18,
                    fWeight: FontWeight.w500,
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: availableCarDrivers.length,
                    itemBuilder: (context, index) {
                      return TripInfoWidget(
                        model: availableCarDrivers[index],
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
