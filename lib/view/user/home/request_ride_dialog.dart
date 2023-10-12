import 'package:flutter/material.dart';
import 'package:google_maps/models/request_ride_model.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class RequestRideDialog extends StatefulWidget {
  const RequestRideDialog({
    super.key,
  });
  @override
  _RequestRideDialogState createState() => _RequestRideDialogState();
}

class _RequestRideDialogState extends State<RequestRideDialog> {
  String departureLocation = '';
  String arrivalLocation = '';
  DateTime leavingDate = DateTime.now();
  int seatsRequired = 1;
  String description = '';

  TextEditingController departureLocationController = TextEditingController();
  TextEditingController arrivalLocationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List<int> seatOptions = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CustomTextWidget(
        text: 'Request Ride',
        fSize: 16,
        fWeight: FontWeight.w700,
        textAlign: TextAlign.center,
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomTextWidget(text: 'Origin:'),
            TextField(
              onChanged: (value) {
                setState(() {
                  departureLocation = value;
                });
              },
            ),
            SizedBox(height: 10),
            CustomTextWidget(text: 'Destination:'),
            TextField(
              onChanged: (value) {
                setState(() {
                  arrivalLocation = value;
                });
              },
            ),
            SizedBox(height: 10),
            CustomTextWidget(text: 'Leaving Date:'),
            ElevatedButton(
              onPressed: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: leavingDate,
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
                text:
                    '${leavingDate.day}-${leavingDate.month}-${leavingDate.year}'),
            SizedBox(height: 10),
            CustomTextWidget(text: 'Seats Required:'),
            DropdownButton<int>(
              value: seatsRequired,
              onChanged: (value) {
                setState(() {
                  seatsRequired = value!;
                });
              },
              items: seatOptions.map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: CustomTextWidget(text: value.toString()),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            CustomTextWidget(text: 'Description:'),
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            RequestRideModel(
                originLocation: departureLocationController.text,
                destinationLocation: descriptionController.text,
                seatsRequired: seatsRequired,
                leavingDate: leavingDate,
                description: descriptionController.text);
            Navigator.of(context).pop();
          },
          child: CustomTextWidget(text: 'Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: CustomTextWidget(text: 'Request'),
        ),
      ],
    );
  }
}
