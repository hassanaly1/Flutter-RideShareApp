import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/models/pickup_point_model.dart';
import 'package:google_maps/view/user/home/book_bus_seat_screen.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:google_maps/widgets/custom_button.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class PickUpPointsScreen extends StatefulWidget {
  const PickUpPointsScreen({super.key});

  @override
  State<PickUpPointsScreen> createState() => _PickUpPointsScreenState();
}

class _PickUpPointsScreenState extends State<PickUpPointsScreen> {
  List<PickupPointModel> pickupPoints = [
    PickupPointModel(
      address: 'Toronto International Airport',
      arrivalTime: DateTime(2023, 9, 25, 10, 30),
      departureTime: DateTime(2023, 9, 25, 11, 0),
      price: 50.0,
    ),
    PickupPointModel(
      address: 'Union Station',
      arrivalTime: DateTime(2023, 9, 25, 12, 0),
      departureTime: DateTime(2023, 9, 25, 12, 30),
      price: 40.0,
    ),
    PickupPointModel(
      address: 'Pearson GO Station',
      arrivalTime: DateTime(2023, 9, 25, 14, 0),
      departureTime: DateTime(2023, 9, 25, 14, 30),
      price: 60.0,
    ),
    PickupPointModel(
      address: 'Pearson Airport Terminal',
      arrivalTime: DateTime(2023, 9, 25, 15, 0),
      departureTime: DateTime(2023, 9, 25, 15, 30),
      price: 55.0,
    ),
    PickupPointModel(
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
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    height: Get.height * 0.22,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                    fSize: 14,
                                    fWeight: FontWeight.w500,
                                  ),
                                  CustomTextWidget(
                                    text:
                                        'Arrival Time: ${pickupPoints[index].arrivalTime.toString()}',
                                    fSize: 12,
                                    fWeight: FontWeight.w400,
                                  ),
                                  CustomTextWidget(
                                    text:
                                        'Departure Time: ${pickupPoints[index].departureTime.toString()}',
                                    fSize: 12,
                                    fWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                              CustomTextWidget(
                                text:
                                    'Price: \$${pickupPoints[index].price.toString()}',
                                fSize: 12,
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
