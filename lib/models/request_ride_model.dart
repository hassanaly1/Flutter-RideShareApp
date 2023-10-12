class RequestRideModel {
  final String originLocation;
  final String destinationLocation;
  final DateTime leavingDate;
  final int seatsRequired;
  final String description;

  RequestRideModel(
      {required this.originLocation,
      required this.destinationLocation,
      required this.leavingDate,
      required this.seatsRequired,
      required this.description});
}
