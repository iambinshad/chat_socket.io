class Message {
  final bool myself;
  final String message;

  Message({required this.myself, required this.message});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      myself: json['myself'],
      message: json['message'],
    );
  }
}
class MessageResponse {
  final List<Message> messages;

  MessageResponse({required this.messages});

  factory MessageResponse.fromJson(List<dynamic> json) {
    List<Message> messages = json.map((item) => Message.fromJson(item)).toList();
    return MessageResponse(messages: messages);
  }
}