import 'package:flutter/material.dart';
import 'package:google_maps/models/pickup_point_model.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';
import 'package:timeline_tile/timeline_tile.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({super.key});

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  List<RidePost> ridePosts = [];
  Future<void> showPostRideDialog(BuildContext context) async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return PostRideDialog(
          onRidePostCreated: addRidePost,
        );
      },
    );
  }

  void addRidePost(RidePost ridePost) {
    setState(() {
      ridePosts.add(ridePost);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: CustomTextWidget(
            text: 'Welcome back Andrew👋🏻',
            fSize: 16.0,
            fWeight: FontWeight.w700,
          ),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
            child: Column(
              children: [
                CustomTextWidget(
                  text: 'Your Rides Schedule',
                  fSize: 16,
                  fWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                ),

                // Display ride posts dynamically
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: ridePosts.length,
                  itemBuilder: (context, index) {
                    return RidePostWidget(ridePost: ridePosts[index]);
                  },
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: () {
            showPostRideDialog(context);
          },
          label: CustomTextWidget(
            text: 'Post a Ride?',
            fWeight: FontWeight.w700,
            textColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

class RidePost {
  final String origin;
  final String destination;
  final List<PickupPointModel> pickupPoints;
  final DateTime leavingDate;
  final TimeOfDay leavingTime;
  final String luggageOption;
  final int emptySeats;
  final double pricePerSeat;
  final String tripDescription;

  RidePost({
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

class PostRideDialog extends StatefulWidget {
  final Function(RidePost) onRidePostCreated;

  PostRideDialog({required this.onRidePostCreated});

  @override
  _PostRideDialogState createState() => _PostRideDialogState();
}

class _PostRideDialogState extends State<PostRideDialog> {
  String origin = '';
  String destination = '';
  List<PickupPointModel> pickupPoints = [];
  DateTime? leavingDate;
  TimeOfDay? leavingTime;
  String selectedLuggageOption = 'Small';
  int emptySeats = 1;
  double pricePerSeat = 0;
  String tripDescription = '';

  List<String> luggageOptions = ['Small', 'Medium', 'Large'];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CustomTextWidget(text: 'Post a Ride'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomTextWidget(text: 'Origin:'),
            TextField(
              onChanged: (value) {
                setState(() {
                  origin = value;
                });
              },
            ),
            SizedBox(height: 10),
            CustomTextWidget(text: 'Destination:'),
            TextField(
              onChanged: (value) {
                setState(() {
                  destination = value;
                });
              },
            ),
            SizedBox(height: 10),
            CustomTextWidget(text: 'Leaving Date:'),
            ElevatedButton(
              onPressed: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: leavingDate ?? DateTime.now(),
                  firstDate: DateTime(2023, 9, 20),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  setState(() {
                    leavingDate = pickedDate;
                  });
                }
              },
              child: CustomTextWidget(text: 'Select Leaving Date'),
            ),
            CustomTextWidget(
              text: leavingDate != null
                  ? leavingDate!.toLocal().toString()
                  : 'Select Leaving Date',
            ),
            SizedBox(height: 10),
            CustomTextWidget(text: 'Leaving Time:'),
            ElevatedButton(
              onPressed: () async {
                final pickedTime = await showTimePicker(
                  context: context,
                  initialTime: leavingTime ?? TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  setState(() {
                    leavingTime = pickedTime;
                  });
                }
              },
              child: CustomTextWidget(text: 'Select Leaving Time'),
            ),
            CustomTextWidget(
              text: leavingTime != null
                  ? leavingTime!.format(context)
                  : 'Select Leaving Time',
            ),
            SizedBox(height: 10),
            CustomTextWidget(text: 'Luggage Option:'),
            DropdownButton<String>(
              value: selectedLuggageOption,
              onChanged: (value) {
                setState(() {
                  selectedLuggageOption = value!;
                });
              },
              items: luggageOptions.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: CustomTextWidget(text: option),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            CustomTextWidget(text: 'Empty Seats Number:'),
            Slider(
              value: emptySeats.toDouble(),
              onChanged: (value) {
                setState(() {
                  emptySeats = value.toInt();
                });
              },
              min: 1,
              max: 10,
              divisions: 9,
              label: emptySeats.toString(),
            ),
            SizedBox(height: 10),
            CustomTextWidget(text: 'Price per Seat:'),
            TextField(
              onChanged: (value) {
                setState(() {
                  pricePerSeat = double.tryParse(value) ?? 0;
                });
              },
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 10),
            CustomTextWidget(text: 'Trip Description:'),
            TextField(
              onChanged: (value) {
                setState(() {
                  tripDescription = value;
                });
              },
              maxLines: 3,
            ),
            SizedBox(height: 10),
            CustomTextWidget(text: 'Pickup Points:'),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: pickupPoints.length,
              itemBuilder: (context, index) {
                return PickupPointWidget(pickupPoint: pickupPoints[index]);
              },
            ),
            ElevatedButton(
              onPressed: () {
                _addPickupPoint();
              },
              child: CustomTextWidget(text: 'Add Pickup Point'),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: CustomTextWidget(text: 'Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Create a new RidePost object with the entered data and pass it to the callback
            final ridePost = RidePost(
              origin: origin,
              destination: destination,
              pickupPoints: pickupPoints,
              leavingDate: leavingDate!,
              leavingTime: leavingTime!,
              luggageOption: selectedLuggageOption,
              emptySeats: emptySeats,
              pricePerSeat: pricePerSeat,
              tripDescription: tripDescription,
            );

            widget.onRidePostCreated(ridePost);

            // Close the dialog
            Navigator.of(context).pop();
          },
          child: CustomTextWidget(text: 'Post Ride'),
        ),
      ],
    );
  }

  void _addPickupPoint() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        late TextEditingController addressController;
        late DateTime arrivalTime;
        late DateTime departureTime;
        late TextEditingController priceController;

        addressController = TextEditingController();
        arrivalTime = DateTime.now();
        departureTime = DateTime.now();
        priceController = TextEditingController();

        return AlertDialog(
          title: CustomTextWidget(text: 'Add Pickup Point'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(labelText: 'Address'),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text('Arrival Time'),
                        subtitle: Text(arrivalTime.toString()),
                        onTap: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: arrivalTime,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101),
                          );

                          final selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(arrivalTime),
                          );

                          if (selectedDate != null && selectedTime != null) {
                            setState(() {
                              arrivalTime = DateTime(
                                selectedDate.year,
                                selectedDate.month,
                                selectedDate.day,
                                selectedTime.hour,
                                selectedTime.minute,
                              );
                            });
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('Departure Time'),
                        subtitle: Text(departureTime.toString()),
                        onTap: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: departureTime,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101),
                          );

                          final selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(departureTime),
                          );

                          if (selectedDate != null && selectedTime != null) {
                            setState(() {
                              departureTime = DateTime(
                                selectedDate.year,
                                selectedDate.month,
                                selectedDate.day,
                                selectedTime.hour,
                                selectedTime.minute,
                              );
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
                TextField(
                  controller: priceController,
                  decoration: InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                final address = addressController.text;
                final price = double.parse(priceController.text);

                final newPickupPoint = PickupPointModel(
                  address: address,
                  arrivalTime: arrivalTime,
                  departureTime: departureTime,
                  price: price,
                );

                pickupPoints.add(newPickupPoint);

                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

class RidePostWidget extends StatelessWidget {
  final RidePost ridePost;

  RidePostWidget({required this.ridePost});

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
            return PickupPointWidget(pickupPoint: ridePost.pickupPoints[index]);
          },
        ),
      ],
    );
  }
}

class PickupPointWidget extends StatelessWidget {
  final PickupPointModel pickupPoint;

  PickupPointWidget({required this.pickupPoint});

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

class InfoRowWidget extends StatelessWidget {
  final String label;
  final String text;

  InfoRowWidget({required this.label, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextWidget(
          text: '$label: ',
          fSize: 16,
          fWeight: FontWeight.w700,
        ),
        CustomTextWidget(
          text: text,
          fSize: 16,
          fWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
