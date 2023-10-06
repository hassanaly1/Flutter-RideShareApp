import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/screens/user/bookings/my_bookings.dart';
import 'package:google_maps/screens/user/chats/chat_screen.dart';
import 'package:google_maps/screens/user/home/home_screen.dart';
import 'package:google_maps/screens/user/payment_history_screen.dart';
import 'package:google_maps/screens/user/profile/profile_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        children: const [
          HomeScreen(),
          MyBookings(),
          ChatScreen(),
          PaymentHistory(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: Get.height * 0.1,
        child: CupertinoTabBar(
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    FluentIcons.home_12_filled,
                    color: _page == 0 ? Colors.black87 : Colors.black45,
                  ),
                  label: '',
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(FluentIcons.credit_card_clock_20_filled,
                      color: _page == 1 ? Colors.black87 : Colors.black45),
                  label: '',
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(FluentIcons.chat_12_filled,
                      color: _page == 2 ? Colors.black87 : Colors.black45),
                  label: '',
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(FluentIcons.payment_16_filled,
                      color: _page == 3 ? Colors.black87 : Colors.black45),
                  label: '',
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(FluentIcons.person_12_filled,
                      color: _page == 4 ? Colors.black87 : Colors.black45),
                  label: '',
                  backgroundColor: Colors.white),
            ],
            onTap: navigationTapped),
      ),
    );
  }
}
