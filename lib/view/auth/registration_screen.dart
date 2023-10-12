import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/constants/utils.dart';
import 'package:google_maps/models/auth_model.dart';
import 'package:google_maps/view/auth/login_screen.dart';
import 'package:google_maps/widgets/custom_button.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';
import 'package:google_maps/widgets/custom_textfield.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                Image.asset('assets/applogo.jpg', height: 120, width: 300),
                const SizedBox(height: 25),
                const CustomTextWidget(
                  text: 'Register Account',
                  fSize: 22,
                  fWeight: FontWeight.w700,
                ),
                const SizedBox(height: 25),
                const CustomTextField(
                  hintText: 'First Name',
                  prefixIcon: Icons.person_2_rounded,
                ),
                const SizedBox(height: 25),
                const CustomTextField(
                  hintText: 'Last Name',
                  prefixIcon: Icons.person_2_rounded,
                ),
                const SizedBox(height: 25),
                const CustomTextField(
                  hintText: 'Date of Birth',
                  prefixIcon: Icons.date_range_rounded,
                ),
                const SizedBox(height: 25),
                const CustomTextField(
                  hintText: 'Email',
                  prefixIcon: Icons.email_outlined,
                ),
                const SizedBox(height: 25),
                const CustomTextField(
                  hintText: 'Password',
                  prefixIcon: Icons.password,
                ),
                const SizedBox(height: 25),
                const CustomTextField(
                  hintText: 'Confirm Password',
                  prefixIcon: Icons.lock_open_outlined,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  buttonText: 'SignUp',
                  onTap: () {
                    Get.to(const LoginScreen(),
                        transition: Transition.downToUp);
                    Utils().toastMessage('Account created Successfully');
                    RegistrationModel(
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      dateOfBirth: dateOfBirthController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  },
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Get.to(const LoginScreen(),
                        transition: Transition.downToUp);
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Already have an Account? ',
                      style: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.grey),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
