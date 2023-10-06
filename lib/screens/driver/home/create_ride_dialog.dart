import 'package:flutter/material.dart';
import 'package:google_maps/screens/driver/home/under_city_rides_tab.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class CreateRideAlertDialog extends StatefulWidget {
  final Function(RideListing) onRideListingCreated;

  CreateRideAlertDialog({required this.onRideListingCreated});

  @override
  _CreateRideAlertDialogState createState() => _CreateRideAlertDialogState();
}

class _CreateRideAlertDialogState extends State<CreateRideAlertDialog> {
  String departureLocation = '';
  String arrivalLocation = '';
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  double? price;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CustomTextWidget(text: 'Create Ride Listing'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomTextWidget(text: 'Departure Location:'),
            TextField(
              onChanged: (value) {
                setState(() {
                  departureLocation = value;
                });
              },
            ),
            SizedBox(height: 10),
            CustomTextWidget(text: 'Arrival Location:'),
            TextField(
              onChanged: (value) {
                setState(() {
                  arrivalLocation = value;
                });
              },
            ),
            SizedBox(height: 10),
            CustomTextWidget(text: 'Date and Time:'),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: CustomTextWidget(text: 'Select Date'),
            ),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: CustomTextWidget(text: 'Select Time'),
            ),
            CustomTextWidget(
              text: selectedDate != null && selectedTime != null
                  ? '${selectedDate!.toLocal()} ${selectedTime!.format(context)}'
                  : 'Select Date and Time',
            ),
            SizedBox(height: 10),
            CustomTextWidget(text: 'Price:'),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  price = double.tryParse(value);
                });
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog.
          },
          child: CustomTextWidget(text: 'Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (departureLocation.isNotEmpty &&
                arrivalLocation.isNotEmpty &&
                selectedDate != null &&
                selectedTime != null &&
                price != null) {
              // Check if all required fields are filled.
              final rideListing = RideListing(
                departureLocation: departureLocation,
                arrivalLocation: arrivalLocation,
                dateTime: DateTime(
                  selectedDate!.year,
                  selectedDate!.month,
                  selectedDate!.day,
                  selectedTime!.hour,
                  selectedTime!.minute,
                ),
                price: price!,
              );

              widget.onRideListingCreated(rideListing);
              Navigator.of(context).pop(); // Close the dialog.
            } else {
              // Show an error message or handle the case where not all required fields are filled.
              // For simplicity, you can show an error message using a SnackBar.
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Please fill in all fields.'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          child: CustomTextWidget(text: 'Create Ride Listing'),
        ),
      ],
    );
  }
}
