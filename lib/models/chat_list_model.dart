class ChatListModel {
  final String senderName;
  final String senderImage;
  final String messageContent;
  final String messageType;
  final String timestamp;

  ChatListModel({
    required this.senderName,
    required this.senderImage,
    required this.messageContent,
    required this.messageType,
    required this.timestamp,
  });
}
