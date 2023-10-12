import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/Widgets/custom_button.dart';
import 'package:google_maps/models/search_ride_model.dart';
import 'package:google_maps/view/user/home/available_rides_screen.dart';
import 'package:google_maps/widgets/custom_address_widget.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:intl/intl.dart';
import 'package:timeline_tile/timeline_tile.dart';

class SearchRideScreen extends StatefulWidget {
  const SearchRideScreen({super.key});

  @override
  State<SearchRideScreen> createState() => _SearchRideScreenState();
}

class _SearchRideScreenState extends State<SearchRideScreen> {
  TextEditingController currentLocationController = TextEditingController();
  TextEditingController destinationLocationController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String? formattedDate;
  final List<String> streetAddresses = [
    '123 Main St, Springfield, IL',
    '456 Elm St, Bristol, CT',
    '789 Oak Ave, Seattle, WA',
    '123 Main St, Springfield, IL',
    '456 Elm St, Bristol, CT',
    '789 Oak Ave, Seattle, WA',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: ''),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TimelineTile(
                  alignment: TimelineAlign.start,
                  indicatorStyle: IndicatorStyle(
                    width: 15,
                    color: Colors.black, // Timeline color is green
                  ),
                  endChild: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: currentLocationController,
                        decoration: InputDecoration(
                          hintStyle:
                              TextStyle(color: Colors.black54, fontSize: 14),
                          border: InputBorder.none,
                          hintText: 'Current Location',
                        ),
                      ),
                    ),
                  )),
              SizedBox(height: 10),
              TimelineTile(
                  alignment: TimelineAlign.start,
                  indicatorStyle: IndicatorStyle(
                    width: 15,
                    color: Colors.black, // Timeline color is green
                  ),
                  endChild: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: destinationLocationController,
                        decoration: InputDecoration(
                          hintStyle:
                              TextStyle(color: Colors.black54, fontSize: 14),
                          border: InputBorder.none,
                          hintText: 'Where to?',
                        ),
                      ),
                    ),
                  )),
              SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DatePicker(
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: Colors.black,
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
                      print(date);
                      setState(() {
                        _selectedDate = date;
                        formattedDate =
                            DateFormat('dd-MM-yyyy').format(_selectedDate);
                        // print("After Formating: $formattedDate");
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(
                thickness: 2,
                color: Colors.black12,
              ),
              Container(
                height: Get.height * 0.4,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: streetAddresses.length,
                  itemBuilder: (context, index) {
                    return CustomAddressWidget(
                      address: streetAddresses[index],
                    );
                  },
                ),
              ),
              SizedBox(height: Get.height * 0.08),
              CustomButton(
                buttonText: 'Search Rides',
                onTap: () {
                  SearchRideModel(
                      currentLocation: currentLocationController.text,
                      destinationLocation: destinationLocationController.text);
                  Get.to(
                      AvailableRideScreen(
                          selectedDate: formattedDate.toString()),
                      transition: Transition.downToUp);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
