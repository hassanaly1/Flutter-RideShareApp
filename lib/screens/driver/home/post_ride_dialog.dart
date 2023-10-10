// import 'package:flutter/material.dart';
// import 'package:google_maps/screens/driver/home/driver_home_screen.dart';
// import 'package:google_maps/screens/driver/home/outside_city_rides_tab.dart';
// import 'package:google_maps/widgets/custom_text_widget.dart';

// class PostRideDialog extends StatefulWidget {
//   @override
//   _PostRideDialogState createState() => _PostRideDialogState();
// }

// class _PostRideDialogState extends State<PostRideDialog> {
//   String origin = '';
//   String destination = '';
//   List<PickupPoint> pickupPoints = [];
//   DateTime? leavingDate;
//   TimeOfDay? leavingTime;
//   String selectedLuggageOption = 'Small';
//   int emptySeats = 1;
//   double pricePerSeat = 0;
//   String tripDescription = '';

//   List<String> luggageOptions = ['Small', 'Medium', 'Large'];

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: CustomTextWidget(text: 'Post a Ride'),
//       content: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             CustomTextWidget(text: 'Origin:'),
//             TextField(
//               onChanged: (value) {
//                 setState(() {
//                   origin = value;
//                 });
//               },
//             ),
//             SizedBox(height: 10),
//             CustomTextWidget(text: 'Destination:'),
//             TextField(
//               onChanged: (value) {
//                 setState(() {
//                   destination = value;
//                 });
//               },
//             ),
//             SizedBox(height: 10),
//             CustomTextWidget(text: 'Add Pickup Points:'),
//             ListView.builder(
//               shrinkWrap: true,
//               itemCount: pickupPoints.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: CustomTextWidget(
//                     text: 'Address: ${pickupPoints[index].address}',
//                     fSize: 16,
//                     fWeight: FontWeight.w700,
//                   ),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CustomTextWidget(
//                         text:
//                             'Arrival Time: ${pickupPoints[index].arrivalTime}',
//                         fSize: 14,
//                         fWeight: FontWeight.w400,
//                       ),
//                       CustomTextWidget(
//                         text:
//                             'Departure Time: ${pickupPoints[index].departureTime}',
//                         fSize: 14,
//                         fWeight: FontWeight.w400,
//                       ),
//                       CustomTextWidget(
//                         text:
//                             'Price: \$${pickupPoints[index].price.toStringAsFixed(2)}',
//                         fSize: 14,
//                         fWeight: FontWeight.w400,
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 _addPickupPoint();
//               },
//               child: CustomTextWidget(text: 'Add Pickup Point'),
//             ),
//             SizedBox(height: 10),
//             CustomTextWidget(text: 'Leaving Date:'),
//             ElevatedButton(
//               onPressed: () async {
//                 final pickedDate = await showDatePicker(
//                   context: context,
//                   initialDate: leavingDate ?? DateTime.now(),
//                   firstDate: DateTime(2023, 9, 20),
//                   lastDate: DateTime(2101),
//                 );
//                 if (pickedDate != null) {
//                   setState(() {
//                     leavingDate = pickedDate;
//                   });
//                 }
//               },
//               child: CustomTextWidget(text: 'Select Leaving Date'),
//             ),
//             CustomTextWidget(
//               text: leavingDate != null
//                   ? leavingDate!.toLocal().toString()
//                   : 'Select Leaving Date',
//             ),
//             SizedBox(height: 10),
//             CustomTextWidget(text: 'Leaving Time:'),
//             ElevatedButton(
//               onPressed: () async {
//                 final pickedTime = await showTimePicker(
//                   context: context,
//                   initialTime: leavingTime ?? TimeOfDay.now(),
//                 );
//                 if (pickedTime != null) {
//                   setState(() {
//                     leavingTime = pickedTime;
//                   });
//                 }
//               },
//               child: CustomTextWidget(text: 'Select Leaving Time'),
//             ),
//             CustomTextWidget(
//               text: leavingTime != null
//                   ? leavingTime!.format(context)
//                   : 'Select Leaving Time',
//             ),
//             SizedBox(height: 10),
//             CustomTextWidget(text: 'Luggage Option:'),
//             DropdownButton<String>(
//               value: selectedLuggageOption,
//               onChanged: (value) {
//                 setState(() {
//                   selectedLuggageOption = value!;
//                 });
//               },
//               items: luggageOptions.map((String option) {
//                 return DropdownMenuItem<String>(
//                   value: option,
//                   child: CustomTextWidget(text: option),
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: 10),
//             CustomTextWidget(text: 'Empty Seats Number:'),
//             Slider(
//               value: emptySeats.toDouble(),
//               onChanged: (value) {
//                 setState(() {
//                   emptySeats = value.toInt();
//                 });
//               },
//               min: 1,
//               max: 10,
//               divisions: 9,
//               label: emptySeats.toString(),
//             ),
//             SizedBox(height: 10),
//             CustomTextWidget(text: 'Price per Seat:'),
//             TextField(
//               onChanged: (value) {
//                 setState(() {
//                   pricePerSeat = double.tryParse(value) ?? 0;
//                 });
//               },
//               keyboardType: TextInputType.numberWithOptions(decimal: true),
//             ),
//             SizedBox(height: 10),
//             CustomTextWidget(text: 'Trip Description:'),
//             TextField(
//               onChanged: (value) {
//                 setState(() {
//                   tripDescription = value;
//                 });
//               },
//               maxLines: 3,
//             ),
//           ],
//         ),
//       ),
//       actions: <Widget>[
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           child: CustomTextWidget(text: 'Cancel'),
//         ),
//         TextButton(
//           onPressed: () {
//             // Implement your post ride functionality here.
//             // You can use the values of origin, destination, pickupPoints, leavingDate, leavingTime, selectedLuggageOption, emptySeats, pricePerSeat, and tripDescription to post a ride.
//             Navigator.of(context).pop();
//           },
//           child: CustomTextWidget(text: 'Post Ride'),
//         ),
//       ],
//     );
//   }

//   void _addPickupPoint() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AddPickupPointDialog(
//           onPickupPointCreated: (pickupPoint) {
//             setState(() {
//               pickupPoints.add(pickupPoint);
//             });
//           },
//         );
//       },
//     );
//   }
// }
