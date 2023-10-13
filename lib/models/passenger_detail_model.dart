class PassengerModel {
  final String passengerName;
  final String passengerPicture;
  final int passengerNumber;

  PassengerModel({
    required this.passengerName,
    required this.passengerPicture,
    required this.passengerNumber,
  });
}

class PassengerRideRequestModel {
  final String pickupLocation;
  final String dropoffLocation;
  final double price;
  bool isRideAccepted;
  final PassengerModel passenger;

  PassengerRideRequestModel({
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.price,
    required this.isRideAccepted,
    required this.passenger,
  });
}
