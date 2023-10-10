import 'package:flutter/material.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class RideNotificationScreen extends StatelessWidget {
  const RideNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Requested Rides'),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Image(image: AssetImage('assets/saim.jpg')),
                    radius: 30,
                  ),
                  title: CustomTextWidget(
                    text: 'David has invited you a ride',
                    fSize: 16,
                    fWeight: FontWeight.w500,
                  ),
                  trailing: CustomTextWidget(
                    text: '12:55 PM',
                    fSize: 14,
                    fWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      // body: Column(
      //   children: [
      //     ListTile(
      //       title: CustomTextWidget(text: 'David has requested you a ride'),
      //       trailing: CustomButton(
      //         buttonText: 'See Ride Details',
      //         onTap: () {},
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
