import 'package:flutter/material.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final Color? buttonColor;
  final Color? textColor;
  final double width;
  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.onTap,
      this.width = double.infinity,
      this.buttonColor = Colors.black87,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 40,
          width: width,
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(12)),
          child: Center(
              child: CustomTextWidget(
            text: buttonText,
            fSize: 14,
            textColor: textColor ?? Colors.white,
            fWeight: FontWeight.w600,
          ))),
    );
  }
}
