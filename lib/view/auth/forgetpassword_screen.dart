import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/constants/colors.dart';
import 'package:google_maps/models/auth_model.dart';
import 'package:google_maps/view/auth/otp_screen.dart';
import 'package:google_maps/widgets/custom_button.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';
import 'package:google_maps/widgets/custom_textfield.dart';

class ForgetPasswordScreen extends StatefulWidget {
  ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppAssets.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppAssets.backgroundColor,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                SizedBox(height: Get.height * 0.15),
                Image.asset('assets/applogo.jpg', height: 120, width: 300),
                const SizedBox(height: 25),
                const CustomTextWidget(
                  text: 'Forget Password?',
                  fSize: 22.0,
                  fWeight: FontWeight.w700,
                ),
                const SizedBox(height: 10),
                const CustomTextWidget(
                  text: "No Worries, we'll send you the reset code.",
                  fSize: 14.0,
                  fWeight: FontWeight.w400,
                  textColor: Colors.black38,
                ),
                const SizedBox(height: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextWidget(
                      text: "Enter your number",
                      fSize: 16.0,
                      fWeight: FontWeight.w700,
                      textColor: Colors.black38,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      controller: numberController,
                      prefixIcon: Icons.call,
                      hintText: 'Phone Number',
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 25),
                    CustomButton(
                      buttonText: 'Reset Password',
                      onTap: () {
                        ForgotPasswordModel(number: numberController.text);
                        Get.to(const OTPScreen(),
                            transition: Transition.rightToLeft);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
