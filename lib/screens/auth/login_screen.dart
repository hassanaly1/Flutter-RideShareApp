import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/screens/user/bottombar.dart';
import 'package:google_maps/screens/auth/forgetpassword_screen.dart';
import 'package:google_maps/screens/auth/signup.dart';
import 'package:google_maps/widgets/custom_button.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';
import 'package:google_maps/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Future<void> loginUser() async {
  //   final String apiUrl = 'http://192.168.1.120:8000/api/login';

  //   final response = await http.post(
  //     Uri.parse(apiUrl),
  //     body: {
  //       'email': emailController.text,
  //       'password': passwordController.text,
  //     },
  //   );

  //   print('Request: ${response.request}');

  //   if (response.statusCode == 200) {
  //     final responseData = json.decode(response.body);
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => BottomBar()),
  //     );
  //   } else {
  //     final errorMessage = json.decode(response.body)['message'];
  //     print('Login failed: $errorMessage');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Get.height * 0.15),
                Image.asset('assets/applogo.jpg', height: 120, width: 300),
                const SizedBox(height: 20),
                const CustomTextWidget(
                  text: 'Login to your account',
                  fSize: 30,
                  fWeight: FontWeight.w700,
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  hintText: 'Email',
                  prefixIcon: Icons.email_rounded,
                  suffixIcon: Icons.attach_email,
                  controller: emailController,
                ),
                SizedBox(height: 20),
                CustomTextField(
                    hintText: 'Password',
                    prefixIcon: Icons.lock_open_outlined,
                    suffixIcon: Icons.remove_red_eye,
                    controller: passwordController),
                const SizedBox(height: 20),
                CustomButton(
                  buttonText: 'Login',
                  onTap: () =>
                      Get.to(BottomBar(), transition: Transition.rightToLeft),
                  //  onTap: loginUser,
                ),
                const SizedBox(height: 14),
                InkWell(
                  onTap: () => Get.to(const ForgetPasswordScreen(),
                      transition: Transition.downToUp),
                  child: const CustomTextWidget(text: 'Forget Password?'),
                )
                // InkWell(
                //   onTap: () => Get.to(const ForgotPasswordScreen()),
                //   child: const Text(
                //     'Forgot Password?',
                //     style: TextStyle(
                //         fontWeight: FontWeight.w500,
                //         fontSize: 18,
                //         color: Colors.black87),
                //   ),
                // ),
                // Row(
                //   children: [
                //     Expanded(
                //         child: Container(
                //       margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                //       child: const Divider(color: Colors.black, height: 36),
                //     )),
                //     const Text(
                //       '  or continue with',
                //       style: TextStyle(
                //           fontWeight: FontWeight.w500,
                //           fontSize: 18,
                //           color: Colors.black54),
                //     ),
                //     Expanded(
                //         child: Container(
                //       margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                //       child: const Divider(color: Colors.black),
                //     )),
                //   ],
                // ),
                // const SizedBox(height: 10),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Container(
                //       height: 60,
                //       width: 60,
                //       decoration: BoxDecoration(
                //           color: Colors.white,
                //           border: Border.all(color: Colors.grey.shade300),
                //           borderRadius: BorderRadius.circular(15)),
                //       child: Center(
                //         child: Image.asset('assets/fblogo.png',
                //             height: 30, width: 30),
                //       ),
                //     ),
                //     const SizedBox(width: 20),
                //     Container(
                //       height: 60,
                //       width: 60,
                //       decoration: BoxDecoration(
                //           color: Colors.white,
                //           border: Border.all(color: Colors.grey.shade300),
                //           borderRadius: BorderRadius.circular(15)),
                //       child: Center(
                //         child: Image.asset('assets/googlelogo.png',
                //             height: 30, width: 30),
                //       ),
                //     ),
                //     const SizedBox(width: 20),
                //     Container(
                //       height: 60,
                //       width: 60,
                //       decoration: BoxDecoration(
                //           color: Colors.white,
                //           border: Border.all(color: Colors.grey.shade300),
                //           borderRadius: BorderRadius.circular(15)),
                //       child: Center(
                //         child: Image.asset('assets/applelogo.png',
                //             height: 30, width: 30),
                //       ),
                //     ),
                //   ],
                // ),
                ,
                const SizedBox(height: 20),
                InkWell(
                  onTap: () => Get.to(const SignUpScreen(),
                      transition: Transition.downToUp),
                  child: RichText(
                    text: const TextSpan(
                      text: 'Dont have a account? ',
                      style: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.grey),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Signup',
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
