import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps/models/chat_list_model.dart';
import 'package:google_maps/view/user/chats/driver_chat_screen.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

final List<ChatListModel> chatMessagesList = [
  ChatListModel(
    senderName: 'Rayford Midgett',
    senderImage: 'assets/saim.jpg',
    messageContent: 'Incoming call | 4:30 AM',
    messageType: 'Incoming call',
    timestamp: '4:30 AM',
  ),
  ChatListModel(
    senderName: 'John Doe',
    senderImage: 'assets/saim.jpg',
    messageContent: 'Outgoing call | 5:00 AM',
    messageType: 'Outgoing call',
    timestamp: '5:00 AM',
  ),
  ChatListModel(
    senderName: 'Jane Smith',
    senderImage: 'assets/saim.jpg',
    messageContent: 'Incoming message | 2:15 PM',
    messageType: 'Incoming message',
    timestamp: '2:15 PM',
  ),
  ChatListModel(
    senderName: 'Alice Johnson',
    senderImage: 'assets/saim.jpg',
    messageContent: 'Incoming call | 7:30 AM',
    messageType: 'Incoming call',
    timestamp: '7:30 AM',
  ),
  ChatListModel(
    senderName: 'Bob Wilson',
    senderImage: 'assets/saim.jpg',
    messageContent: 'Outgoing message | 10:45 AM',
    messageType: 'Outgoing message',
    timestamp: '10:45 AM',
  ),
  ChatListModel(
    senderName: 'Emily Davis',
    senderImage: 'assets/saim.jpg',
    messageContent: 'Incoming call | 11:20 AM',
    messageType: 'Incoming call',
    timestamp: '11:20 AM',
  ),
  ChatListModel(
    senderName: 'Michael Brown',
    senderImage: 'assets/saim.jpg',
    messageContent: 'Outgoing call | 1:00 PM',
    messageType: 'Outgoing call',
    timestamp: '1:00 PM',
  ),
  ChatListModel(
    senderName: 'Sarah White',
    senderImage: 'assets/saim.jpg',
    messageContent: 'Incoming message | 3:15 PM',
    messageType: 'Incoming message',
    timestamp: '3:15 PM',
  ),
  ChatListModel(
    senderName: 'David Lee',
    senderImage: 'assets/saim.jpg',
    messageContent: 'Incoming message | 6:00 AM',
    messageType: 'Incoming message',
    timestamp: '6:00 AM',
  ),
  ChatListModel(
    senderName: 'Linda Miller',
    senderImage: 'assets/saim.jpg',
    messageContent: 'Outgoing message | 8:30 AM',
    messageType: 'Outgoing message',
    timestamp: '8:30 AM',
  ),
  ChatListModel(
    senderName: 'Chris Anderson',
    senderImage: 'assets/saim.jpg',
    messageContent: 'Incoming call | 9:45 AM',
    messageType: 'Incoming call',
    timestamp: '9:45 AM',
  ),
  ChatListModel(
    senderName: 'Jennifer Taylor',
    senderImage: 'assets/saim.jpg',
    messageContent: 'Missed call | 2:00 PM',
    messageType: 'Missed call',
    timestamp: '2:00 PM',
  ),
  ChatListModel(
    senderName: 'William Moore',
    senderImage: 'assets/saim.jpg',
    messageContent: 'Outgoing call | 3:30 AM',
    messageType: 'Outgoing call',
    timestamp: '3:30 AM',
  ),
  ChatListModel(
    senderName: 'Susan Wilson',
    senderImage: 'assets/saim.jpg',
    messageContent: 'Incoming message | 4:15 PM',
    messageType: 'Incoming message',
    timestamp: '4:15 PM',
  ),
  ChatListModel(
    senderName: 'James Johnson',
    senderImage: 'assets/saim.jpg',
    messageContent: 'Incoming message | 7:00 AM',
    messageType: 'Incoming message',
    timestamp: '7:00 AM',
  ),
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
                itemCount: chatMessagesList.length,
                itemBuilder: (context, index) {
                  final chat = chatMessagesList[index];
                  return Column(
                    children: [
                      ListTile(
                        // onTap: () => Get.to(DriverChatScreen(),
                        onTap: () => Get.to(
                            () => DriverChatScreen(
                                  driverName: chat.senderName,
                                ),
                            transition: Transition.rightToLeft),

                        leading: CircleAvatar(
                          child: Image(image: AssetImage(chat.senderImage)),
                          radius: 25,
                        ),
                        title: CustomTextWidget(
                          text: chat.senderName,
                          fSize: 16,
                          fWeight: FontWeight.w600,
                        ),
                        subtitle: CustomTextWidget(
                          text: '${chat.messageType} at ${chat.timestamp}',
                          fSize: 11,
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
