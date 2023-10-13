import 'package:flutter/material.dart';
import 'package:google_maps/models/pickup_point_model.dart';

class SheduleRideModel {
  final String origin;
  final String destination;
  final List<PickupPointModel> pickupPoints;
  final DateTime leavingDate;
  final TimeOfDay leavingTime;
  final String luggageOption;
  final int emptySeats;
  final double pricePerSeat;
  final String tripDescription;

  SheduleRideModel({
    required this.origin,
    required this.destination,
    required this.pickupPoints,
    required this.leavingDate,
    required this.leavingTime,
    required this.luggageOption,
    required this.emptySeats,
    required this.pricePerSeat,
    required this.tripDescription,
  });
}
