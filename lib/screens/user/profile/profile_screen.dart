import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/screens/auth/login_screen.dart';
import 'package:google_maps/screens/user/profile/account_info.dart';
import 'package:google_maps/screens/user/profile/compliance_screen.dart';
import 'package:google_maps/screens/user/profile/emergency_screen.dart';
import 'package:google_maps/screens/user/profile/mode_screen.dart';
import 'package:google_maps/screens/user/profile/notification_screen.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';
import 'package:google_maps/widgets/reusable_profile_tabs.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool notification = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(
        title: 'Profile',
        leading: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Image(
            image: AssetImage(
              'assets/applogo.jpg',
            ),
          ),
        ),
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: const Padding(
      //     padding: EdgeInsets.fromLTRB(10.0, 10, 0, 10),
      //     child: Image(
      //       image: AssetImage(
      //         'assets/applogo.jpg',
      //       ),
      //     ),
      //   ),
      //   title: const CustomTextWidget(
      //       text: 'Profile', fWeight: FontWeight.w500, fSize: 16),
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: const DecorationImage(
                      image: AssetImage('assets/saim.jpg'))),
            ),
            const SizedBox(height: 5),
            const CustomTextWidget(
                text: 'Andrew Ainsley', fWeight: FontWeight.w500, fSize: 18),
            const CustomTextWidget(
                text: '+123456789', fWeight: FontWeight.w200, fSize: 14),
            const Divider(),
            ReUsableProfileTabs(
                text: 'Profile',
                onTap: () => Get.to(const AccountInfo(),
                    transition: Transition.upToDown),
                icon: Icons.person),
            ReUsableProfileTabs(
                text: 'Mode',
                onTap: () => Get.to(const ModeScreen(),
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
                icon: Icons.person),
          ],
        ),
      ),
    );
  }
}
