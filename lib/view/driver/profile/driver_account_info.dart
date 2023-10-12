import 'package:flutter/material.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';
import 'package:google_maps/constants/colors.dart';

class DriverAccountInfo extends StatelessWidget {
  const DriverAccountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAssets.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppAssets.backgroundColor,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: 'Account info',
                fSize: 25,
                fWeight: FontWeight.w700,
              ),
              SizedBox(height: 10),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/saim.jpg'),
              ),
              SizedBox(height: 10),
              CustomTextWidget(
                text: 'Basic info',
                fSize: 20,
                fWeight: FontWeight.w500,
              ),
              ReUsableAccountInfoWidget(
                infoType: 'Name',
                infoValue: 'John Smith',
              ),
              ReUsableAccountInfoWidget(
                infoType: 'Phone Number',
                infoValue: '+123456789',
              ),
              ReUsableAccountInfoWidget(
                infoType: 'Email',
                infoValue: 'john@gmail.com',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReUsableAccountInfoWidget extends StatelessWidget {
  final String infoType;
  final String infoValue;

  const ReUsableAccountInfoWidget({
    Key? key,
    required this.infoType,
    required this.infoValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(
            text: infoType,
            fSize: 20,
            fWeight: FontWeight.w300,
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: infoValue,
                      hintStyle: const TextStyle(color: Colors.black87),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
