import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/models/user_info.dart';
import 'package:google_maps/view/auth/login_screen.dart';
import 'package:google_maps/view/user/profile/account_info.dart';
import 'package:google_maps/view/user/profile/compliance_screen.dart';
import 'package:google_maps/view/user/profile/emergency_screen.dart';
import 'package:google_maps/view/user/profile/mode_screen.dart';
import 'package:google_maps/view/user/profile/notification_screen.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';
import 'package:google_maps/widgets/reusable_profile_tabs.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserInfoModel userInfoModel = UserInfoModel(
    username: 'Andrew Smith',
    userEmail: 'andrew@gmail.com',
    userProfilePicture: 'assets/saim.jpg',
    userPhoneNumber: 1234567890,
    isDriver: false,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(
        title: 'Profile',
        leading: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Image(
            image: AssetImage('assets/applogo.jpg'),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      image:
                          AssetImage('${userInfoModel.userProfilePicture}'))),
            ),
            const SizedBox(height: 5),
            CustomTextWidget(
                text: '${userInfoModel.username}',
                fWeight: FontWeight.w500,
                fSize: 18),
            CustomTextWidget(
                text: '${userInfoModel.userPhoneNumber.toString()}',
                fWeight: FontWeight.w200,
                fSize: 14),
            const Divider(),
            ReUsableProfileTabs(
                text: 'Profile',
                onTap: () => Get.to(AccountInfo(userInfoModel: userInfoModel),
                    transition: Transition.upToDown),
                icon: Icons.person),
            ReUsableProfileTabs(
                text: 'Mode',
                onTap: () => Get.to(
                    ModeScreen(
                      isDriver: userInfoModel.isDriver,
                    ),
                    transition: Transition.rightToLeft),
                icon: Icons.notifications),
            ReUsableProfileTabs(
                text: 'Security', onTap: () {}, icon: Icons.security),
            ReUsableProfileTabs(
                text: 'Notifications',
                onTap: () => Get.to(const NotificationScreen(),
                    transition: Transition.rightToLeft),
                icon: Icons.person),
            ReUsableProfileTabs(
                text: 'Emergency',
                onTap: () => Get.to(const EmergencyScreen(),
                    transition: Transition.rightToLeft),
                icon: Icons.emergency_outlined),
            ReUsableProfileTabs(
                text: 'Compliance',
                onTap: () => Get.to(ComplianceScreen(),
                    transition: Transition.rightToLeft),
                icon: Icons.rule_sharp),
            ReUsableProfileTabs(
                text: 'Logout',
                onTap: () => Get.to(const LoginScreen(),
                    transition: Transition.downToUp),
                icon: Icons.logout_rounded),
          ],
        ),
      ),
    );
  }
}
