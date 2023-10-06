import 'package:flutter/material.dart';
import 'package:google_maps/widgets/custom_button.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

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

class CityRides extends StatefulWidget {
  const CityRides({Key? key}) : super(key: key);

  @override
  _CityRidesState createState() => _CityRidesState();
}

class _CityRidesState extends State<CityRides> {
  List<PickupPoint> pickupPoints = [];

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        pickupPoints.length == 0
            ? CustomTextWidget(
                text: 'No Rides Schedule',
                fSize: 22,
                fWeight: FontWeight.w700,
                textAlign: TextAlign.center,
              )
            : Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: pickupPoints.length,
                  itemBuilder: (context, index) {
                    final pickupPoint = pickupPoints[index];
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        title: CustomTextWidget(
                          text: 'Pickup Point Address: ${pickupPoint.address}',
                          fSize: 20,
                          fWeight: FontWeight.w700,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget(
                              text: 'Arrival Time: ${pickupPoint.arrivalTime}',
                              fSize: 16,
                              fWeight: FontWeight.w400,
                            ),
                            CustomTextWidget(
                              text:
                                  'Departure Time: ${pickupPoint.departureTime}',
                              fSize: 16,
                              fWeight: FontWeight.w400,
                            ),
                            CustomTextWidget(
                              text:
                                  'Price: \$${pickupPoint.price.toStringAsFixed(2)}',
                              fSize: 16,
                              fWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
        SizedBox(height: 20),
        CustomButton(
          buttonText: 'Create Pickup Point',
          onTap: () {
            showAddPickupPointDialog(context);
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }
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
