import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/Widgets/custom_button.dart';
import 'package:google_maps/constants/utils.dart';
import 'package:google_maps/screens/user/bottombar.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(title: 'Checkout'),
      body: Container(
        color: Colors.white,
        width: Get.width,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextWidget(
                text: "Your Order", fWeight: FontWeight.w600, fSize: 18),
            const Divider(
              color: Colors.grey,
            ),
            const Row(
              //  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextWidget(text: "Bus Ticket", fSize: 14),
                SizedBox(
                  width: 20,
                ),
                CustomTextWidget(
                    text: "  × 1", fWeight: FontWeight.w600, fSize: 14)
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            const Row(
              //  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextWidget(text: "Ticket Number", fSize: 14),
                SizedBox(
                  width: 20,
                ),
                CustomTextWidget(
                    text: "26", fWeight: FontWeight.w600, fSize: 14),
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            const Row(
              //  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextWidget(text: "Pickup", fSize: 14),
                SizedBox(
                  width: 20,
                ),
                CustomTextWidget(
                    text: "abc, Canada", fWeight: FontWeight.w600, fSize: 14),
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            const Row(
              //  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextWidget(text: "Dropoff", fSize: 14),
                SizedBox(
                  width: 20,
                ),
                CustomTextWidget(
                    text: "xyz, Canada", fWeight: FontWeight.w600, fSize: 14),
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            const Row(
              //  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextWidget(text: "Payment\nMethod:", fSize: 14),
                SizedBox(
                  width: 10,
                ),
                CustomTextWidget(
                    text: "Online Transfer",
                    fWeight: FontWeight.w600,
                    fSize: 14),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            const Divider(
              color: Colors.grey,
            ),
            const Row(
              //  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextWidget(text: "Total", fSize: 14),
                SizedBox(
                  width: 45,
                ),
                CustomTextWidget(
                    text: "\$40.00", fWeight: FontWeight.w600, fSize: 14),
              ],
            ),
            Spacer(),
            CustomButton(
              buttonText: 'Checkout',
              onTap: () {
                openModal();
              },
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> openModal() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: AlertDialog(
            title: CustomTextWidget(
              text: "Thankyou for booking with Rillu",
              fSize: 16,
              fWeight: FontWeight.w500,
            ),
            content: CustomTextWidget(
              text: 'See you on the trip.',
              fSize: 14,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  buttonText: 'Back to Home Screen',
                  onTap: () {
                    Utils().toastMessage('Ticket booked Successfully.');
                    Get.offAll(BottomBar(), transition: Transition.upToDown);
                  },
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        );
      },
    );
  }
}
