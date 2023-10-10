import 'package:flutter/material.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class FilterRideDialog extends StatefulWidget {
  @override
  _FilterRideDialogState createState() => _FilterRideDialogState();
}

class _FilterRideDialogState extends State<FilterRideDialog> {
  String departureLocation = '';
  String arrivalLocation = '';
  DateTime? startDate;
  DateTime? endDate;
  double? maxPrice;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CustomTextWidget(text: 'Search Rides'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            CustomTextWidget(text: 'Date Range:'),
            ElevatedButton(
              onPressed: () async {
                final pickedStartDate = await showDatePicker(
                  context: context,
                  initialDate: startDate ?? DateTime.now(),
                  firstDate: DateTime(2023, 9, 20),
                  lastDate: DateTime(2101),
                );
                if (pickedStartDate != null) {
                  final pickedEndDate = await showDatePicker(
                    context: context,
                    initialDate: endDate ?? DateTime.now(),
                    firstDate: pickedStartDate,
                    lastDate: DateTime(2101),
                  );
                  if (pickedEndDate != null) {
                    setState(() {
                      startDate = pickedStartDate;
                      endDate = pickedEndDate;
                    });
                  }
                }
              },
              child: CustomTextWidget(text: 'Select Date Range'),
            ),
            CustomTextWidget(
              text: startDate != null && endDate != null
                  ? '${startDate!.toLocal()} - ${endDate!.toLocal()}'
                  : 'Select Date Range',
            ),
            SizedBox(height: 10),
            CustomTextWidget(text: 'Maximum Price:'),
            Slider(
              value: maxPrice ?? 0,
              onChanged: (value) {
                setState(() {
                  maxPrice = value;
                });
              },
              min: 0,
              max: 1000,
              divisions: 20,
              label: maxPrice?.toStringAsFixed(2) ?? "0.0",
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
            // Implement your search functionality here.
            // You can use the values of departureLocation, arrivalLocation, startDate, endDate, and maxPrice to filter rides.
            Navigator.of(context).pop();
          },
          child: CustomTextWidget(text: 'Search'),
        ),
      ],
    );
  }
}
