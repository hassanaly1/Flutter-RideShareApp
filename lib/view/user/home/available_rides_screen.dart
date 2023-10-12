import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps/models/driver_detail_model.dart';
import 'package:google_maps/view/user/home/book_car_seat_screen.dart';
import 'package:google_maps/view/user/home/filter_ride_dialog.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';
import 'package:google_maps/widgets/trip_info_widget.dart';

class AvailableRideScreen extends StatefulWidget {
  final String selectedDate;
  const AvailableRideScreen({Key? key, required this.selectedDate})
      : super(key: key);

  @override
  State<AvailableRideScreen> createState() => _AvailableRideScreenState();
}

class _AvailableRideScreenState extends State<AvailableRideScreen> {
  int _currentTabIndex = 0;
  final List allRides = [
    'Rayford Midgett',
    'John Doe',
    'Jane Smith',
    'Alice Johnson',
    'Bob Wilson',
    'Emily Davis',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          // appBar: CustomAppBarWidget(
          //   title: 'Available Rides',
          //   action: [
          //     Padding(
          //       padding: const EdgeInsets.only(right: 15),
          //       child: IconButton(
          //         onPressed: () {
          //           showDialog(
          //             barrierDismissible: false,
          //             context: context,
          //             builder: (BuildContext context) {
          //               return FilterRideDialog();
          //             },
          //           );
          //         },
          //         icon: Icon(FluentIcons.filter_12_filled),
          //       ),
          //     ),
          //   ],
          // ),
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: CustomTextWidget(
              text: 'Available Rides',
              fWeight: FontWeight.bold,
              fSize: 16.0,
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return FilterRideDialog();
                      },
                    );
                  },
                  icon: Icon(FluentIcons.filter_12_filled),
                ),
              ),
            ],
            bottom: TabBar(
              physics: AlwaysScrollableScrollPhysics(),
              labelStyle: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              tabs: [
                Tab(text: "All"),
                Tab(text: "Carpool"),
                Tab(text: "Bus"),
              ],
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor:
                  _currentTabIndex == 0 ? Colors.black : Colors.black,
              onTap: (index) {
                setState(() {
                  _currentTabIndex = index;
                });
              },
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomTextWidget(
                              text:
                                  " All Available Rides for ${widget.selectedDate}",
                              fSize: 16,
                              fWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: allRides.length,
                      itemBuilder: (context, index) {
                        final model = TripModel(
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
                        );
                        return TripInfoWidget(
                          model: model,
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
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomTextWidget(
                              text:
                                  " Car Available Rides for ${widget.selectedDate}",
                              fSize: 16,
                              fWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: allRides.length,
                      itemBuilder: (context, index) {
                        final model = TripModel(
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
                        );
                        return TripInfoWidget(
                          model: model,
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
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomTextWidget(
                              text:
                                  "Bus Available Rides for ${widget.selectedDate}",
                              fSize: 16,
                              fWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: allRides.length,
                      itemBuilder: (context, index) {
                        final model = TripModel(
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
                        );
                        return TripInfoWidget(
                          model: model,
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
          )),
    );
  }
}
