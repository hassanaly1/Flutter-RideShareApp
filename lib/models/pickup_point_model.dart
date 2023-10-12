class PickupPointModel {
  final String address;
  final DateTime arrivalTime;
  final DateTime departureTime;
  final double price;

  PickupPointModel({
    required this.address,
    required this.arrivalTime,
    required this.departureTime,
    required this.price,
  });
}
