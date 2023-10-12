import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/models/driver_detail_model.dart';
import 'package:google_maps/view/user/chats/driver_chat_screen.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class DriverProfileView extends StatefulWidget {
  final TripModel model;
  const DriverProfileView({
    super.key,
    required this.model,
  });

  @override
  State<DriverProfileView> createState() => _DriverProfileViewState();
}

class _DriverProfileViewState extends State<DriverProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Driver Details'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              CircleAvatar(
                child:
                    Image(image: AssetImage(widget.model.driver.driverImage)),
                radius: 60,
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomIconContainer(
                    icon: Icons.chat_sharp,
                    onTap: () {
                      Get.to(
                          DriverChatScreen(
                            driverName: widget.model.driver.driverName,
                          ),
                          transition: Transition.rightToLeft);
                    },
                  ),
                  Column(
                    children: [
                      CustomTextWidget(
                        text: widget.model.driver.driverName,
                        fSize: 16,
                        fWeight: FontWeight.w600,
                      ),
                      CustomTextWidget(
                        text: widget.model.driver.driverNumber.toString(),
                        fSize: 14,
                        fWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  CustomIconContainer(
                    icon: Icons.call,
                    onTap: () {},
                  )
                ],
              ),
              SizedBox(height: 5),
              CarouselSlider(
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(color: Colors.amber),
                            child: Image.asset(
                              widget.model.car.driverCarImages,
                              fit: BoxFit.cover,
                            ));
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    animateToClosest: false,
                    height: 150,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,

                    // onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                  )),
              SizedBox(height: 12),
              Container(
                height: Get.height * 0.2,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomRatingWidget(
                      text: widget.model.driver.ratings.toString(),
                      subText: 'Ratings',
                      icon: Icons.star_outline,
                    ),
                    CustomRatingWidget(
                      text: widget.model.driver.trips.toString(),
                      subText: 'Trips',
                      icon: Icons.card_giftcard_sharp,
                    ),
                    CustomRatingWidget(
                      text: widget.model.driver.years.toString(),
                      subText: 'years',
                      icon: Icons.timer,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Container(
                  padding: EdgeInsets.all(10),
                  height: Get.height * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                              text: 'Member Since',
                              fSize: 14,
                              fWeight: FontWeight.w400),
                          CustomTextWidget(
                              text: widget.model.driver.joiningYear.toString(),
                              fSize: 14,
                              fWeight: FontWeight.w400),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                              text: 'Car Model',
                              fSize: 14,
                              fWeight: FontWeight.w400),
                          CustomTextWidget(
                              text: widget.model.car.carModel,
                              fSize: 14,
                              fWeight: FontWeight.w400),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextWidget(
                              text: 'Plate Number',
                              fSize: 14,
                              fWeight: FontWeight.w400),
                          CustomTextWidget(
                              text: widget.model.car.carPlateNumber,
                              fSize: 14,
                              fWeight: FontWeight.w400),
                        ],
                      ),
                    ],
                  )),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomIconContainer extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const CustomIconContainer({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black87,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(
            icon,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class CustomRatingWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final String subText;
  const CustomRatingWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon),
          CustomTextWidget(
            text: text,
            fSize: 16,
            fWeight: FontWeight.w700,
          ),
          CustomTextWidget(
            text: subText,
            fSize: 16,
            fWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
