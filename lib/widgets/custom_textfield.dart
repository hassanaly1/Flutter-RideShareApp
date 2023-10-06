import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final double? height;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller; // Add this line
  const CustomTextField({
    Key? key, // Add the key parameter
    required this.hintText,
    this.controller, // Add this line
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextFormField(
          controller: controller, // Use the provided controller
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.black87, fontSize: 16),
            border: InputBorder.none,
            prefixIcon: Icon(prefixIcon),
            hintText: hintText,
            suffixIcon: Icon(suffixIcon),
          ),
        ),
      ),
    );
  }
}
