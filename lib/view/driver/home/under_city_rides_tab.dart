import 'package:flutter/material.dart';
import 'package:google_maps/view/driver/home/create_ride_dialog.dart';
import 'package:google_maps/widgets/custom_button.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class UnderCityRides extends StatefulWidget {
  UnderCityRides({Key? key}) : super(key: key);

  @override
  _UnderCityRidesState createState() => _UnderCityRidesState();
}

class _UnderCityRidesState extends State<UnderCityRides> {
  List<RideListing> rideListings = [];

  void addRideListing(RideListing rideListing) {
    setState(() {
      rideListings.add(rideListing);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        CustomTextWidget(
          text: 'Your Under city rides:',
          fSize: 22,
          fWeight: FontWeight.w700,
        ),
        SizedBox(height: 15),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: rideListings.length,
            itemBuilder: (context, index) {
              final rideListing = rideListings[index];
              return ListTile(
                title: CustomTextWidget(
                  text:
                      'From ${rideListing.departureLocation} to ${rideListing.arrivalLocation}',
                  fSize: 20,
                  fWeight: FontWeight.w700,
                ),
                subtitle: CustomTextWidget(
                  text:
                      'Date: ${rideListing.dateTime.toLocal()} | Price: \$${rideListing.price.toStringAsFixed(2)}',
                  fSize: 16,
                  fWeight: FontWeight.w400,
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20),
        CustomButton(
          buttonText: 'Create Ride Listing',
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CreateRideAlertDialog(
                  onRideListingCreated: addRideListing,
                );
              },
            );
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class RideListing {
  final String departureLocation;
  final String arrivalLocation;
  final DateTime dateTime;
  final double price;

  RideListing({
    required this.departureLocation,
    required this.arrivalLocation,
    required this.dateTime,
    required this.price,
  });
}
