import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/screens/user/home/checkout_screen.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:google_maps/widgets/custom_button.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';
import 'package:google_maps/widgets/custom_textfield.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

List<String> paymentTypes = ['My Wallet', 'Online Transfer'];

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedPaymentIndex = -1;

  bool isOnlineTransferSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Payment Methods'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            CustomTextWidget(
              text: 'Select the payment method you want to use',
              fSize: 18,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: paymentTypes.length,
              itemBuilder: (context, index) {
                return CustomPaymetWidget(
                  text: paymentTypes[index],
                  index: index,
                  isSelected: selectedPaymentIndex == index,
                  onTap: () {
                    setState(() {
                      selectedPaymentIndex = index;
                      // Update the boolean variable when "Online Transfer" is selected.
                      isOnlineTransferSelected =
                          index == paymentTypes.indexOf('Online Transfer');
                    });
                  },
                );
              },
            ),
            SizedBox(height: 40),
            SingleChildScrollView(
              child: Visibility(
                visible: isOnlineTransferSelected,
                child: Container(
                  height: Get.height * 0.4,
                  color: Colors.grey[300],
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      CustomTextWidget(
                        text: 'Card Information',
                        fSize: 20,
                        fWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 15),
                      CustomTextField(
                        height: 60,
                        hintText: 'Card Number',
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 15),
                      CustomTextField(
                        height: 60,
                        hintText: 'Card Epiration (mm/yy)',
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 15),
                      CustomTextField(
                        height: 60,
                        hintText: 'Card Security Code',
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            CustomButton(
              buttonText: 'Continue',
              onTap: () => Get.to(const CheckoutScreen(),
                  transition: Transition.rightToLeft),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

// The CustomPaymetWidget remains the same.

class CustomPaymetWidget extends StatelessWidget {
  final String text;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  CustomPaymetWidget({
    required this.text,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              leading: Icon(Icons.payment_rounded),
              title: Text(
                text,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              trailing: Icon(
                isSelected
                    ? Icons.radio_button_checked_rounded
                    : Icons.radio_button_off,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
