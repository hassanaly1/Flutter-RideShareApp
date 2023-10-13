import 'package:flutter/material.dart';
import 'package:google_maps/models/pickup_point_model.dart';
import 'package:google_maps/models/shedule_ride_model.dart';
import 'package:google_maps/view/driver/home/add_pickup_point_dialog.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class SheduleRideDialog extends StatefulWidget {
  final Function(SheduleRideModel) onRidePostCreated;

  SheduleRideDialog({required this.onRidePostCreated});

  @override
  _SheduleRideDialogState createState() => _SheduleRideDialogState();
}

class _SheduleRideDialogState extends State<SheduleRideDialog> {
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
                return AddPickupPointDialog(pickupPoint: pickupPoints[index]);
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
            final sheduleRide = SheduleRideModel(
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

            widget.onRidePostCreated(sheduleRide);
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
