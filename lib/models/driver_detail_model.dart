// class DriverModel {
//   final String driverName;
//   final String driverImage;
//   final int driverNumber;
//   final double ratings;
//   final double trips;
//   final double years;
//   final int joiningYear;

//   final String driverCarImages;
//   final String carModel;
//   final String carPlateNumber;

//   final int seatsLeft;
//   final double travelDistance;
//   final double travelTime;
//   final double travelCost;
//   final String departureTime;
//   final String currentAddress;
//   final String destinationAddress;

//   DriverModel({
//     required this.seatsLeft,
//     required this.travelDistance,
//     required this.travelTime,
//     required this.travelCost,
//     required this.departureTime,
//     required this.currentAddress,
//     required this.destinationAddress,
//     required this.driverImage,
//     required this.driverName,
//     required this.driverNumber,
//     required this.driverCarImages,
//     required this.ratings,
//     required this.trips,
//     required this.years,
//     required this.joiningYear,
//     required this.carModel,
//     required this.carPlateNumber,
//   });
// }

class DriverModel {
  final String driverName;
  final String driverImage;
  final int driverNumber;
  final double ratings;
  final double trips;
  final double years;
  final int joiningYear;

  DriverModel({
    required this.driverName,
    required this.driverImage,
    required this.driverNumber,
    required this.ratings,
    required this.trips,
    required this.years,
    required this.joiningYear,
  });
}

class CarModel {
  final String driverCarImages;
  final String carModel;
  final String carPlateNumber;

  CarModel({
    required this.driverCarImages,
    required this.carModel,
    required this.carPlateNumber,
  });
}

class TripModel {
  final int seatsLeft;
  final double travelDistance;
  final double travelTime;
  final double travelCost;
  final String departureTime;
  final String currentAddress;
  final String destinationAddress;
  final DriverModel driver;
  final CarModel car;

  TripModel({
    required this.seatsLeft,
    required this.travelDistance,
    required this.travelTime,
    required this.travelCost,
    required this.departureTime,
    required this.currentAddress,
    required this.destinationAddress,
    required this.driver,
    required this.car,
  });
}
