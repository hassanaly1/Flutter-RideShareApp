import 'package:flutter/material.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class CustomAddressWidget extends StatelessWidget {
  final String address;
  const CustomAddressWidget({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Icon(Icons.pin_drop),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: address,
                fSize: 16,
                fWeight: FontWeight.w700,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    text: 'Saket district center,district center, sector 6, ',
                    fSize: 12,
                    textColor: Colors.grey,
                  ),
                  CustomTextWidget(
                    text: 'pushp vihar, New Delhi, Delhi 110017',
                    fSize: 12,
                    textColor: Colors.grey,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
