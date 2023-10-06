import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/Widgets/custom_button.dart';
import 'package:google_maps/screens/user/bottombar.dart';
import 'package:google_maps/screens/user/home/available_rides_screen.dart';
import 'package:google_maps/widgets/custom_address_widget.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:intl/intl.dart';
import 'package:timeline_tile/timeline_tile.dart';

class SearchRidesScreen extends StatefulWidget {
  const SearchRidesScreen({super.key});

  @override
  State<SearchRidesScreen> createState() => _SearchRidesScreenState();
}

class _SearchRidesScreenState extends State<SearchRidesScreen> {
  DateTime _selectedDate = DateTime.now();
  String? formattedDate;
  final List<String> streetAddresses = [
    '123 Main St, Springfield, IL',
    '456 Elm St, Bristol, CT',
    '789 Oak Ave, Seattle, WA',
    '321 Pine Rd, Portland, OR',
    '567 Maple Ln, Los Angeles, CA',
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.to(BottomBar(), transition: Transition.upToDown);
        return false;
      },
      child: Scaffold(
        // endDrawer: Drawer(
        //   backgroundColor: Colors.red,

        // ),
        appBar: CustomAppBarWidget(title: ''),
        body: Padding(
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
                        decoration: InputDecoration(
                          hintStyle:
                              TextStyle(color: Colors.black54, fontSize: 18),
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
                        decoration: InputDecoration(
                          hintStyle:
                              TextStyle(color: Colors.black54, fontSize: 18),
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
              // Text(
              //   // Format the selected date as "dd-MM-yyyy"
              //   DateFormat('dd-MM-yyyy').format(_selectedDate),
              //   style: TextStyle(
              //     fontSize: 30,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              SizedBox(height: 10),
              Divider(
                thickness: 2,
                color: Colors.black12,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: streetAddresses.length,
                itemBuilder: (context, index) {
                  return CustomAddressWidget(
                    address: streetAddresses[index],
                  );
                },
              ),
              Spacer(),
              CustomButton(
                buttonText: 'Search Rides',
                // onTap: () => Get.to(SelectTripScreen(),
                //     transition: Transition.downToUp),
                onTap: () => Get.to(
                    AvailableRideScreen(
                      selectedDate: formattedDate.toString(),
                    ),
                    transition: Transition.downToUp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
