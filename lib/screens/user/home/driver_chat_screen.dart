import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps/widgets/custom_appbar.dart';
import 'package:google_maps/widgets/custom_text_widget.dart';
import 'package:pinput/pinput.dart';

class DriverChatScreen extends StatefulWidget {
  const DriverChatScreen({Key? key}) : super(key: key);

  @override
  State<DriverChatScreen> createState() => _DriverChatScreenState();
}

class _DriverChatScreenState extends State<DriverChatScreen> {
  TextEditingController chatController = TextEditingController();
  // Add a ScrollController
  ScrollController scrollController = ScrollController();

  List<dynamic> chatMessages = [
    ChatMessage('Hello?', true),
    ChatMessage('Where are you?', true),
    ChatMessage('I am at the location, where are you?', false),
    ChatMessage("I'll be there in 5 minutes.", false),
    ChatMessage("Great, I'll wait for you.", true),
    ChatMessage(
        'Is there any specific spot you want me to pick you up from?', false),
    ChatMessage("Yes, please pick me up from the front entrance.", true),
    ChatMessage('Sure, I got it.', false),
    ChatMessage('Hello?', true),
    ChatMessage('I am at the location, where are you?', false),
    ChatMessage('I am almost there, just a couple of blocks away.', false),
    ChatMessage('Okay, let me know when you arrive.', true),
    ChatMessage('I have arrived. I am outside the front entrance.', false),
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
        title: 'Daniel Austin',
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
                              fSize: 20,
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
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 18),
                  child: TextFormField(
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    controller: chatController,
                    onFieldSubmitted: (message) {},
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      border: InputBorder.none,
                      hintText: 'Message',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          setState(() {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              scrollController.jumpTo(
                                  scrollController.position.maxScrollExtent);
                            });
                            if (chatController.length != 0) {
                              chatMessages
                                  .add(ChatMessage(chatController.text, true));
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

class ChatMessage {
  final String message;
  final bool isSender;

  ChatMessage(this.message, this.isSender);
}
