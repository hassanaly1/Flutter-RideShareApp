import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/screens/user/home/book_bus_seat_screen.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:google_maps/widgets/custom_button.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class PickUpPoints extends StatefulWidget {
  const PickUpPoints({super.key});

  @override
  State<PickUpPoints> createState() => _PickUpPointsState();
}

class _PickUpPointsState extends State<PickUpPoints> {
  List<PickupPoint> pickupPoints = [
    PickupPoint(
      address: 'Toronto International Airport',
      arrivalTime: DateTime(2023, 9, 25, 10, 30),
      departureTime: DateTime(2023, 9, 25, 11, 0),
      price: 50.0,
    ),
    PickupPoint(
      address: 'Union Station',
      arrivalTime: DateTime(2023, 9, 25, 12, 0),
      departureTime: DateTime(2023, 9, 25, 12, 30),
      price: 40.0,
    ),
    PickupPoint(
      address: 'Pearson GO Station',
      arrivalTime: DateTime(2023, 9, 25, 14, 0),
      departureTime: DateTime(2023, 9, 25, 14, 30),
      price: 60.0,
    ),
    PickupPoint(
      address: 'Pearson Airport Terminal',
      arrivalTime: DateTime(2023, 9, 25, 15, 0),
      departureTime: DateTime(2023, 9, 25, 15, 30),
      price: 55.0,
    ),
    PickupPoint(
      address: 'Union International Airport',
      arrivalTime: DateTime(2023, 9, 26, 10, 0),
      departureTime: DateTime(2023, 9, 26, 10, 30),
      price: 65.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Pickup Points'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: pickupPoints.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  height: Get.height * 0.25,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextWidget(
                                  text: pickupPoints[index].address,
                                  fSize: 20,
                                  fWeight: FontWeight.w700,
                                ),
                                CustomTextWidget(
                                  text:
                                      'Arrival Time: ${pickupPoints[index].arrivalTime.toString()}',
                                  fSize: 15,
                                  fWeight: FontWeight.w400,
                                ),
                                CustomTextWidget(
                                  text:
                                      'Departure Time: ${pickupPoints[index].departureTime.toString()}',
                                  fSize: 15,
                                  fWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                            CustomTextWidget(
                              text:
                                  'Price: \$${pickupPoints[index].price.toString()}',
                              fSize: 18,
                              fWeight: FontWeight.w500,
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
                        CustomButton(
                          buttonText: 'Book Seat',
                          onTap: () => Get.to(BookingBusSeatScreen(),
                              transition: Transition.downToUp),
                        ),
                        const Divider(
                          color: Colors.black26,
                          height: 25,
                          thickness: 1,
                          indent: 5,
                          endIndent: 5,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PickupPoint {
  final String address;
  final DateTime arrivalTime;
  final DateTime departureTime;
  final double price;

  PickupPoint({
    required this.address,
    required this.arrivalTime,
    required this.departureTime,
    required this.price,
  });
}
