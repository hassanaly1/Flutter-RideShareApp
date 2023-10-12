import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/constants/colors.dart';
import 'package:google_maps/constants/utils.dart';
import 'package:google_maps/models/auth_model.dart';
import 'package:google_maps/view/user/bottombar.dart';
import 'package:google_maps/widgets/custom_button.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController pinController = TextEditingController();

  bool _timerInProgress = true;
  int _start = 60;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        setState(() {
          _timerInProgress = false;
        });
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAssets.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppAssets.backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: Get.height * 0.1),
                Image.asset('assets/applogo.jpg', height: 120, width: 300),
                const SizedBox(height: 25),
                const CustomTextWidget(
                  text: 'Enter OTP',
                  fSize: 22.0,
                  fWeight: FontWeight.w700,
                ),
                const SizedBox(height: 10.0),
                const CustomTextWidget(
                  text: 'We have sent you the code at your number',
                  textColor: Colors.grey,
                ),
                const SizedBox(height: 20.0),
                Pinput(
                  controller: pinController,
                  validator: (s) {
                    return s == '2222' ? null : 'Pin is incorrect';
                  },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) {
                    if (pin == '2222') {
                      OTPModel(number: pinController.text);
                      Get.to(const BottomBar());
                      Utils().toastMessage('Login Successfully');
                    }
                    setState(() {
                      pinController.clear();
                      _timerInProgress = false;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                _timerInProgress
                    ? CustomTextWidget(text: 'Resend OTP in $_start seconds')
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomTextWidget(
                            text: 'Didnt recieve OTP?',
                            textColor: Colors.black,
                            fSize: 15,
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _timerInProgress = true;
                                _start = 60;
                              });
                              pinController.clear();
                              startTimer();
                            },
                            child: const CustomTextWidget(
                              text: 'Resend OTP',
                              fSize: 15,
                              fWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                //

                const SizedBox(height: 20.0),
                CustomButton(
                  buttonText: 'Submit',
                  onTap: () {
                    // Validate OTP and perform actions
                    String enteredOTP = pinController.text;
                    if (enteredOTP.length == 4) {
                      // Perform validation and actions here
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
