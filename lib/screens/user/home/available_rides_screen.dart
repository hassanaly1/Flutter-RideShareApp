import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps/screens/user/home/book_car_seat_screen.dart';
import 'package:google_maps/screens/user/home/ride_search_dialog.dart';
import 'package:google_maps/widgets/animated_conatiner.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class AvailableRideScreen extends StatefulWidget {
  final String selectedDate;
  const AvailableRideScreen({Key? key, required this.selectedDate})
      : super(key: key);

  @override
  State<AvailableRideScreen> createState() => _AvailableRideScreenState();
}

class _AvailableRideScreenState extends State<AvailableRideScreen> {
  int _currentTabIndex = 0;
  final List availableDriverName = [
    'Rayford Midgett',
    'John Doe',
    'Jane Smith',
    'Alice Johnson',
    'Bob Wilson',
    'Emily Davis',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // appBar: CustomAppBarWidget(
        //   title: 'Available Rides',
        //   action: [
        //     Padding(
        //       padding: const EdgeInsets.only(right: 15),
        //       child: IconButton(
        //         onPressed: () {
        //           showDialog(
        //             barrierDismissible: false,
        //             context: context,
        //             builder: (BuildContext context) {
        //               return FilterRideDialog();
        //             },
        //           );
        //         },
        //         icon: Icon(FluentIcons.filter_12_filled),
        //       ),
        //     ),
        //   ],
        // ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: CustomTextWidget(
            text: 'Available Rides',
            fWeight: FontWeight.bold,
            fSize: 16.0,
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return FilterRideDialog();
                    },
                  );
                },
                icon: Icon(FluentIcons.filter_12_filled),
              ),
            ),
          ],
          bottom: TabBar(
            physics: AlwaysScrollableScrollPhysics(),
            labelStyle: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            tabs: [
              Tab(text: "All"),
              Tab(text: "Carpool"),
              Tab(text: "Bus"),
            ],
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: _currentTabIndex == 0 ? Colors.black : Colors.black,
            onTap: (index) {
              setState(() {
                _currentTabIndex = index;
              });
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextWidget(
                        text: "Available Rides for ${widget.selectedDate}",
                        fSize: 16,
                        fWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: availableDriverName.length,
                itemBuilder: (context, index) {
                  return AnimatedContainerWidget(
                    isBooked: true,
                    seePickupPoints: true,
                    text: '12 seat left',
                    color: Colors.black87,
                    buttonText: 'Book Seat',
                    driverName: availableDriverName[index].toString(),
                    onTap: () => Get.to(BookingCarSeatScreen(),
                        transition: Transition.downToUp),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
