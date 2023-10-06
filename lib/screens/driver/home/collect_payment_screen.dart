import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_maps/constants/utils.dart';
import 'package:google_maps/screens/driver/driver_bottombar.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:google_maps/widgets/custom_button.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class CollectPaymentScreen extends StatefulWidget {
  const CollectPaymentScreen({super.key});

  @override
  State<CollectPaymentScreen> createState() => _CollectPaymentScreenState();
}

class _CollectPaymentScreenState extends State<CollectPaymentScreen> {
  bool isPaymentCollected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
          title: 'Collect Payment', automaticallyImplyLeading: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: AnimatedContainer(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          duration: Duration(microseconds: 0),
          height: isPaymentCollected ? Get.height * 0.65 : Get.height * 0.4,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextWidget(
                text: "You have recieved your payment",
                fSize: 30,
                fWeight: FontWeight.w700,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              CustomTextWidget(
                text: 'Collect Payment.',
                fSize: 22,
                fWeight: FontWeight.w500,
              ),
              SizedBox(height: 15),
              CustomTextWidget(
                text: '\$15',
                fSize: 30,
                fWeight: FontWeight.w700,
              ),
              SizedBox(height: 15),
              CustomButton(
                  buttonText: 'Collect Payment',
                  onTap: () {
                    setState(() {
                      isPaymentCollected = true;
                    });
                  }
                  // Get.offAll(BottomBar(), transition: Transition.upToDown),
                  ),
              SizedBox(height: 15),
              isPaymentCollected
                  ? Column(
                      children: [
                        CustomTextWidget(
                          text: 'How is your Customer?',
                          fSize: 24,
                          fWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 15),
                        RatingBar.builder(
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
                        SizedBox(height: 15),
                        CustomButton(
                          buttonText: 'Submit',
                          onTap: () {
                            Utils()
                                .toastMessage('Review submitted Successfully');
                            Get.offAll(DriverBottomBar(),
                                transition: Transition.upToDown);
                          },
                        ),
                        SizedBox(height: 15),
                        TextButton(
                          onPressed: () {},
                          child: CustomTextWidget(
                            text: 'Report User?',
                            fSize: 16,
                            textColor: Colors.red,
                            fWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 15),
                      ],
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
