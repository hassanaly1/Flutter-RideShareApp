import 'package:flutter/material.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> names = [
      'Allen John',
      'John Doe',
      'Jane Smith',
      'Tom Brown',
      'Emily Davis'
    ];
    List<String> phoneNumbers = [
      '+1 123456789',
      '+1 987654321',
      '+1 555555555',
      '+1 777777777',
      '+1 888888888'
    ];
    return Scaffold(
        appBar: CustomAppBarWidget(title: 'Emergency Contacts'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: ListView.builder(
            itemCount: 5, // Set the number of items in the list
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                        text: names[index],
                        fSize: 20,
                      ),
                      CustomTextWidget(
                        text: phoneNumbers[index],
                        fSize: 20,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
