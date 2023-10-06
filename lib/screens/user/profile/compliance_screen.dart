import 'package:flutter/material.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class ComplianceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Transportation Compliance'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text:
                  'Ensure Compliance with Local and National Transportation Regulations',
              fSize: 20,
              fWeight: FontWeight.w500,
            ),
            SizedBox(height: 16.0),
            CompliancePoint(point: 'Understand Regulatory Authorities'),
            CompliancePoint(point: 'Licensing and Permits'),
            CompliancePoint(point: 'Vehicle Maintenance'),
            CompliancePoint(point: 'Driver Training and Certification'),
            CompliancePoint(point: 'Safety Equipment'),
            CompliancePoint(point: 'Insurance'),
            CompliancePoint(point: 'Hours of Service Compliance'),
            CompliancePoint(point: 'Record Keeping'),
            CompliancePoint(point: 'Hazardous Materials'),
            CompliancePoint(point: 'Environmental Compliance'),
            CompliancePoint(point: 'Route Planning'),
            CompliancePoint(point: 'Safety Training'),
            CompliancePoint(point: 'Regular Audits'),
            CompliancePoint(point: 'Stay Informed'),
            CompliancePoint(point: 'Legal Counsel'),
            CompliancePoint(point: 'Whistleblower Programs'),
          ],
        ),
      ),
    );
  }
}

class CompliancePoint extends StatelessWidget {
  final String point;

  CompliancePoint({required this.point});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.check_circle, color: Colors.green),
      title: CustomTextWidget(text: point),
    );
  }
}
