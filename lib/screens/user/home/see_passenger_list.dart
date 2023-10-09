import 'package:flutter/material.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class SeePassengerList extends StatelessWidget {
  const SeePassengerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarWidget(title: 'Passengers List'),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                  ),
                  title: CustomTextWidget(
                    text: 'Tom Smith',
                    fSize: 16,
                    fWeight: FontWeight.w500,
                  ),
                  subtitle: CustomTextWidget(
                    text: '4753 Hyde Park Road',
                  ),
                ),
              );
            },
          ),
        ));
  }
}
