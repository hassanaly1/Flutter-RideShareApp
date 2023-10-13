import 'package:flutter/material.dart';
import 'package:google_maps/models/pickup_point_model.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';
import 'package:timeline_tile/timeline_tile.dart';

class AddPickupPointDialog extends StatelessWidget {
  final PickupPointModel pickupPoint;

  AddPickupPointDialog({required this.pickupPoint});

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.start,
      indicatorStyle: IndicatorStyle(
        width: 15,
        color: Colors.black,
      ),
      endChild: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListTile(
              title: CustomTextWidget(
                text: 'Pickup Point: ${pickupPoint.address}',
                fSize: 16,
                fWeight: FontWeight.w700,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text:
                        'Arrival Time: ${pickupPoint.arrivalTime.day}-${pickupPoint.arrivalTime.month}-${pickupPoint.arrivalTime.year} at ${pickupPoint.arrivalTime.hour}:${pickupPoint.arrivalTime.minute}',
                    fSize: 14,
                    fWeight: FontWeight.w400,
                  ),
                  CustomTextWidget(
                    text:
                        'Departure Time: ${pickupPoint.departureTime.day}-${pickupPoint.departureTime.month}-${pickupPoint.departureTime.year} at ${pickupPoint.departureTime.hour}:${pickupPoint.departureTime.minute}',
                    fSize: 14,
                    fWeight: FontWeight.w400,
                  ),
                  CustomTextWidget(
                    text: 'Price: \$${pickupPoint.price.toStringAsFixed(2)}',
                    fSize: 14,
                    fWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
