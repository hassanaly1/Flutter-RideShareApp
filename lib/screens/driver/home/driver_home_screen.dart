import 'package:flutter/material.dart';
import 'package:google_maps/widgets/custom_button.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';
import 'package:timeline_tile/timeline_tile.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({super.key});

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  List<PickupPoint> pickupPoints = [
    PickupPoint(
      address: 'Toronto International Airport',
      arrivalTime: DateTime(2023, 9, 25, 10, 30),
      departureTime: DateTime(2023, 9, 25, 11, 0),
      price: 50.0,
    ),
    PickupPoint(
      address: 'Union Station',
      arrivalTime: DateTime(2023, 9, 25, 12, 0),
      departureTime: DateTime(2023, 9, 25, 12, 30),
      price: 40.0,
    ),
  ];

  void addPickupPoint(PickupPoint pickupPoint) {
    setState(() {
      pickupPoints.add(pickupPoint);
    });
  }

  Future<void> showAddPickupPointDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddPickupPointDialog(
          onPickupPointCreated: addPickupPoint,
        );
      },
    );
  }

  // List<PickupPoint> pickupPoints = [
  //   PickupPoint(
  //     address: 'Toronto International Airport',
  //     arrivalTime: DateTime(2023, 9, 25, 10, 30),
  //     departureTime: DateTime(2023, 9, 25, 11, 0),
  //     price: 50.0,
  //   ),
  //   PickupPoint(
  //     address: 'Union Station',
  //     arrivalTime: DateTime(2023, 9, 25, 12, 0),
  //     departureTime: DateTime(2023, 9, 25, 12, 30),
  //     price: 40.0,
  //   ),
  //   PickupPoint(
  //     address: 'Pearson GO Station',
  //     arrivalTime: DateTime(2023, 9, 25, 14, 0),
  //     departureTime: DateTime(2023, 9, 25, 14, 30),
  //     price: 60.0,
  //   ),
  //   PickupPoint(
  //     address: 'Pearson Airport Terminal',
  //     arrivalTime: DateTime(2023, 9, 25, 15, 0),
  //     departureTime: DateTime(2023, 9, 25, 15, 30),
  //     price: 55.0,
  //   ),
  //   PickupPoint(
  //     address: 'Union International Airport',
  //     arrivalTime: DateTime(2023, 9, 26, 10, 0),
  //     departureTime: DateTime(2023, 9, 26, 10, 30),
  //     price: 65.0,
  //   ),
  // ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: CustomTextWidget(
            text: 'Welcome back Andrew👋🏻',
            fSize: 20.0,
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
                  fSize: 22,
                  fWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                ),
                TimelineTile(
                  alignment: TimelineAlign.start,
                  indicatorStyle: IndicatorStyle(
                    width: 15,
                    color: Colors.black, // Timeline color is green
                  ),
                  endChild: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: CustomTextWidget(
                      text: 'From Toronto',
                      textColor: Colors.black,
                      fSize: 22,
                      fWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TimelineTile(
                  alignment: TimelineAlign.start,
                  indicatorStyle: IndicatorStyle(
                    width: 15,
                    color: Colors.black, // Timeline color is green
                  ),
                  endChild: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: CustomTextWidget(
                      text: 'To Victoria',
                      textColor: Colors.black,
                      fSize: 22,
                      fWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Divider(thickness: 2),
                CustomTextWidget(
                  text: 'Pickup Points',
                  fSize: 22,
                  fWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: pickupPoints.length,
                  itemBuilder: (context, index) {
                    return TimelineTile(
                        alignment: TimelineAlign.start,
                        indicatorStyle: IndicatorStyle(
                          width: 15,
                          color: Colors.black, // Timeline color is black
                        ),
                        endChild: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ListTile(
                                title: CustomTextWidget(
                                  text:
                                      'Pickup Point: ${pickupPoints[index].address}',
                                  fSize: 20,
                                  fWeight: FontWeight.w700,
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      text:
                                          'Arrival Time: ${pickupPoints[index].arrivalTime}',
                                      fSize: 16,
                                      fWeight: FontWeight.w400,
                                    ),
                                    CustomTextWidget(
                                      text:
                                          'Departure Time: ${pickupPoints[index].departureTime}',
                                      fSize: 16,
                                      fWeight: FontWeight.w400,
                                    ),
                                    CustomTextWidget(
                                      text:
                                          'Price: \$${pickupPoints[index].price.toStringAsFixed(2)}',
                                      fSize: 16,
                                      fWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ));
                  },
                ),
                SizedBox(height: 20),
                CustomButton(
                  buttonText: 'Add Pickup Point',
                  onTap: () {
                    showAddPickupPointDialog(context);
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PickupPoint {
  final String address;
  final DateTime arrivalTime;
  final DateTime departureTime;
  final double price;

  PickupPoint({
    required this.address,
    required this.arrivalTime,
    required this.departureTime,
    required this.price,
  });
}

class AddPickupPointDialog extends StatefulWidget {
  final Function(PickupPoint) onPickupPointCreated;

  AddPickupPointDialog({required this.onPickupPointCreated});

  @override
  _AddPickupPointDialogState createState() => _AddPickupPointDialogState();
}

class _AddPickupPointDialogState extends State<AddPickupPointDialog> {
  late TextEditingController addressController;
  late DateTime arrivalTime;
  late DateTime departureTime;
  late TextEditingController priceController;

  @override
  void initState() {
    super.initState();
    addressController = TextEditingController();
    arrivalTime = DateTime.now();
    departureTime = DateTime.now();
    priceController = TextEditingController();
  }

  @override
  void dispose() {
    addressController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Pickup Point'),
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
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            final address = addressController.text;
            final price = double.parse(priceController.text);

            final newPickupPoint = PickupPoint(
              address: address,
              arrivalTime: arrivalTime,
              departureTime: departureTime,
              price: price,
            );

            widget.onPickupPointCreated(newPickupPoint);
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
  }
}
