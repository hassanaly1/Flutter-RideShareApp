import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps/models/chat_message_model.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';
import 'package:pinput/pinput.dart';

class DriverChatScreen extends StatefulWidget {
  final String driverName;
  const DriverChatScreen({Key? key, required this.driverName})
      : super(key: key);

  @override
  State<DriverChatScreen> createState() => _DriverChatScreenState();
}

class _DriverChatScreenState extends State<DriverChatScreen> {
  TextEditingController chatController = TextEditingController();
  // Add a ScrollController
  ScrollController scrollController = ScrollController();

  List<dynamic> chatMessages = [
    ChatMessageModel('Hello?', true),
    ChatMessageModel('Where are you?', true),
    ChatMessageModel('I am at the location, where are you?', false),
    ChatMessageModel("I'll be there in 5 minutes.", false),
    ChatMessageModel("Great, I'll wait for you.", true),
    ChatMessageModel(
        'Is there any specific spot you want me to pick you up from?', false),
    ChatMessageModel("Yes, please pick me up from the front entrance.", true),
    ChatMessageModel('Sure, I got it.', false),
    ChatMessageModel('Hello?', true),
    ChatMessageModel('I am at the location, where are you?', false),
    ChatMessageModel('I am almost there, just a couple of blocks away.', false),
    ChatMessageModel('Okay, let me know when you arrive.', true),
    ChatMessageModel('I have arrived. I am outside the front entrance.', false),
  ];

  @override
  void initState() {
    super.initState();

    // Scroll to the latest message when the widget is first initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }

  @override
  void dispose() {
    // Dispose of the ScrollController when the widget is disposed
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: widget.driverName,
        action: [
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                  height: Get.height * 0.8,
                  color: Colors.white,
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: chatMessages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final message = chatMessages[index];

                      return Align(
                        alignment: message.isSender
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: message.isSender
                                  ? Colors.black87
                                  : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.all(12),
                            child: CustomTextWidget(
                              text: message.message,
                              fSize: 14,
                              textColor: message.isSender
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: TextFormField(
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    controller: chatController,
                    onFieldSubmitted: (message) {},
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      hintText: 'Message',
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.send,
                          size: 14,
                        ),
                        onPressed: () {
                          setState(() {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              scrollController.jumpTo(
                                  scrollController.position.maxScrollExtent);
                            });
                            if (chatController.length != 0) {
                              chatMessages.add(
                                  ChatMessageModel(chatController.text, true));
                              chatController.clear();
                              // setState(() {
                              //   scrollController.jumpTo(
                              //       scrollController.position.maxScrollExtent);
                              // });
                              // scrollController.jumpTo(
                              //     scrollController.position.maxScrollExtent);
                              // scrollController.animateTo(
                              //   scrollController.position.maxScrollExtent,
                              //   duration: Duration(milliseconds: 300),
                              //   curve: Curves.easeOut,
                              // );
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
