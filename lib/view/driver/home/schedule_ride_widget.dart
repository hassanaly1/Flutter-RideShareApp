import 'package:flutter/material.dart';
import 'package:google_maps/models/shedule_ride_model.dart';
import 'package:google_maps/view/driver/home/add_pickup_point_dialog.dart';
import 'package:google_maps/view/driver/home/driver_home_screen.dart';

class SheduleRideWidget extends StatelessWidget {
  final SheduleRideModel ridePost;

  SheduleRideWidget({required this.ridePost});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoRowWidget(label: 'Origin', text: ridePost.origin),
              InfoRowWidget(label: 'Destination', text: ridePost.destination),
              InfoRowWidget(
                  label: 'Trip Description', text: ridePost.tripDescription),
              InfoRowWidget(
                  label: 'Empty Seats', text: ridePost.emptySeats.toString()),
              InfoRowWidget(
                  label: 'Leaving Date',
                  text:
                      '${ridePost.leavingDate.day.toString()} : ${ridePost.leavingDate.month.toString()} : ${ridePost.leavingDate.year.toString()}'),
              InfoRowWidget(
                  label: 'Leaving Time',
                  text:
                      '${ridePost.leavingTime.hour} : ${ridePost.leavingTime.minute}'),
              InfoRowWidget(
                  label: 'Luggage Option', text: ridePost.luggageOption),
              InfoRowWidget(
                  label: 'Price', text: ridePost.pricePerSeat.toString()),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: ridePost.pickupPoints.length,
          itemBuilder: (context, index) {
            return AddPickupPointDialog(
                pickupPoint: ridePost.pickupPoints[index]);
          },
        ),
      ],
    );
  }
}
