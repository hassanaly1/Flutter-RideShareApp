import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/screens/user/home/driver_chat_screen.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

final List<List<String>> chatData = [
  ['Rayford Midgett', 'Incoming call | 4:30 AM'],
  ['John Doe', 'Outgoing call | 5:00 AM'],
  ['Jane Smith', 'Incoming message | 2:15 PM'],
  ['Alice Johnson', 'Incoming call | 7:30 AM'],
  ['Bob Wilson', 'Outgoing message | 10:45 AM'],
  ['Emily Davis', 'Incoming call | 11:20 AM'],
  ['Michael Brown', 'Outgoing call | 1:00 PM'],
  ['Sarah White', 'Incoming message | 3:15 PM'],
  ['David Lee', 'Incoming message | 6:00 AM'],
  ['Linda Miller', 'Outgoing message | 8:30 AM'],
  ['Chris Anderson', 'Incoming call | 9:45 AM'],
  ['Jennifer Taylor', 'Missed call | 2:00 PM'],
  ['William Moore', 'Outgoing call | 3:30 AM'],
  ['Susan Wilson', 'Incoming message | 4:15 PM'],
  ['James Johnson', 'Incoming message | 7:00 AM'],
  ['Karen Davis', 'Outgoing message | 10:15 AM'],
  ['Robert Clark', 'Incoming call | 12:30 PM'],
  ['Lisa Jones', 'Incoming message | 2:45 PM'],
  ['Kevin Allen', 'Outgoing call | 5:30 AM'],
  ['Samantha Harris', 'Incoming message | 6:15 PM'],
];

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBarWidget(title: 'Chats', automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  text: 'Inbox',
                  fSize: 25,
                  fWeight: FontWeight.w700,
                ),
                Icon(CupertinoIcons.search)
              ],
            ),
            Divider(
              color: Colors.black26,
              height: 25,
              thickness: 1,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: chatData.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        // onTap: () => Get.to(DriverChatScreen(),
                        onTap: () => Get.to(() => DriverChatScreen(),
                            transition: Transition.rightToLeft),

                        leading: CircleAvatar(
                          child: Image(image: AssetImage('assets/saim.jpg')),
                          radius: 30,
                        ),
                        title: CustomTextWidget(
                          text: chatData[index][0].toString(),
                          fSize: 22,
                          fWeight: FontWeight.w600,
                        ),
                        subtitle: CustomTextWidget(
                          text: chatData[index][1].toString(),
                          fSize: 18,
                          fWeight: FontWeight.w400,
                        ),
                        trailing: Icon(CupertinoIcons.phone_arrow_down_left),
                      ),
                      const Divider(
                        color: Colors.black26,
                        height: 25,
                        thickness: 1,
                        indent: 5,
                        endIndent: 5,
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
