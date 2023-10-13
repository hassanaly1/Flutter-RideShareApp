import 'package:flutter/material.dart';
import 'package:google_maps/models/passenger_detail_model.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class SeePassengerList extends StatefulWidget {
  SeePassengerList({super.key});

  @override
  State<SeePassengerList> createState() => _SeePassengerListState();
}

class _SeePassengerListState extends State<SeePassengerList> {
  List passangerList = [
    PassengerModel(
        passengerName: 'David Root',
        passengerPicture: 'assets/saim.jpg',
        passengerNumber: 123456789),
    PassengerModel(
        passengerName: 'Clark Smith',
        passengerPicture: 'assets/saim.jpg',
        passengerNumber: 123456789),
    PassengerModel(
        passengerName: 'Mr John',
        passengerPicture: 'assets/saim.jpg',
        passengerNumber: 123456789),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarWidget(title: 'Passengers List'),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: passangerList.length,
            itemBuilder: (context, index) {
              PassengerModel passenger = passangerList[index];
              return Card(
                elevation: 3,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(passenger.passengerPicture),
                    backgroundColor: Colors.grey,
                  ),
                  title: CustomTextWidget(
                    text: passenger.passengerName,
                    fSize: 16,
                    fWeight: FontWeight.w500,
                  ),
                ),
              );
            },
          ),
        ));
  }
}
