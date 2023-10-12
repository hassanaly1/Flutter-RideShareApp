import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_maps/constants/utils.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:google_maps/widgets/custom_button.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({super.key});

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  List<List<String>> paymentHistory = [
    ['Rayford Midgett', '\$25'],
    ['Alicia Johnson', '\$50'],
    ['John Smith', '\$75'],
    ['Emily Davis', '\$30'],
    ['Michael Brown', '\$100'],
    ['Maria Garcia', '\$45'],
    ['David Wilson', '\$60'],
    ['Linda Martinez', '\$55'],
    ['Robert Johnson', '\$70'],
    ['Susan Lee', '\$90'],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
          title: 'Payment History', automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Image.asset('assets/visa-card.png'),
            ),
            Divider(
              color: Colors.black26,
              height: 25,
              thickness: 1,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: paymentHistory.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      // onTap: () => Get.to(DriverChatScreen(),
                      // onTap: () => Get.to(() => DriverChatScreen(),
                      //     transition: Transition.rightToLeft),

                      leading: CircleAvatar(
                        child: Image(image: AssetImage('assets/saim.jpg')),
                        radius: 30,
                      ),
                      title: CustomTextWidget(
                        text: paymentHistory[index][0].toString(),
                        fSize: 16,
                        fWeight: FontWeight.w600,
                      ),
                      subtitle: InkWell(
                        onTap: () {
                          openModal();
                        },
                        child: CustomTextWidget(
                          text: 'Give Feedback',
                          textColor: Colors.red,
                          fSize: 14,
                          fWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: CustomTextWidget(
                        text: paymentHistory[index][1].toString(),
                        fSize: 16,
                        fWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              ),
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
            actions: [
              Center(
                child: CustomTextWidget(
                  text: 'How is your Driver?',
                  fSize: 16,
                  fWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 15),
              Center(
                child: RatingBar.builder(
                  itemSize: 30.0,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.black87,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
              SizedBox(height: 15),
              CustomButton(
                buttonText: 'Submit',
                onTap: () {
                  Utils().toastMessage('Review submitted Successfully');
                  Get.back();
                },
              ),
              SizedBox(height: 15),
            ],
          ),
        );
      },
    );
  }
}
