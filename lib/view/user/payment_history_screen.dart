import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_maps/constants/utils.dart';
import 'package:google_maps/models/payment_history_model.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:google_maps/widgets/custom_button.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({super.key});

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  List<PaymentHistoryModel> paymentHistory = [
    PaymentHistoryModel(
      userName: 'Rayford Midgett',
      userImage: 'assets/saim.jpg',
      price: 25.00,
      feedback: 4,
    ),
    PaymentHistoryModel(
      userName: 'John Doe',
      userImage: 'assets/saim.jpg',
      price: 30.50,
      feedback: 5,
    ),
    PaymentHistoryModel(
      userName: 'Jane Smith',
      userImage: 'assets/saim.jpg',
      price: 15.25,
      feedback: 3,
    ),
    PaymentHistoryModel(
      userName: 'Alice Johnson',
      userImage: 'assets/saim.jpg',
      price: 40.00,
      feedback: 5,
    ),
    PaymentHistoryModel(
      userName: 'Bob Wilson',
      userImage: 'assets/saim.jpg',
      price: 18.75,
      feedback: 4,
    ),
    PaymentHistoryModel(
      userName: 'Eva Brown',
      userImage: 'assets/saim.jpg',
      price: 22.80,
      feedback: 4,
    ),
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
                  final payment = paymentHistory[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Image(image: AssetImage(payment.userImage)),
                        radius: 30,
                      ),
                      title: CustomTextWidget(
                        text: payment.userName,
                        fSize: 16,
                        fWeight: FontWeight.w500,
                      ),
                      subtitle: InkWell(
                        onTap: () {
                          openModal(
                            userName: payment.userName,
                            userImage: payment.userImage,
                            price: payment.price,
                            feedback: payment.feedback,
                          );
                        },
                        child: CustomTextWidget(
                          text: 'Give Feedback',
                          textColor: Colors.red,
                          fSize: 12,
                          fWeight: FontWeight.w300,
                        ),
                      ),
                      trailing: CustomTextWidget(
                        text: '\$${payment.price.toString()}',
                        fSize: 14,
                        fWeight: FontWeight.w300,
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

  Future<dynamic> openModal(
      {required userName,
      required userImage,
      required price,
      required feedback}) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: AlertDialog(
            actions: [
              Column(
                children: [
                  Center(
                    child: CustomTextWidget(
                      text: 'Give feedback of Driver',
                      fSize: 14,
                      fWeight: FontWeight.w500,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                    child: CustomTextWidget(
                      text: '$userName',
                      fSize: 16,
                      fWeight: FontWeight.w700,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
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
                  PaymentHistoryModel(
                      userName: userName,
                      userImage: userImage,
                      price: price,
                      feedback: feedback);
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
