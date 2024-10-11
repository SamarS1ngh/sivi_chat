class Messages {
  String message;
  String sender;

  Messages({required this.message, required this.sender});

  factory Messages.fromJson(Map<String, dynamic> json) =>
      Messages(message: json['message'], sender: json['sender']);

  Map<String, dynamic> toJson() => {"message": message, "sender": sender};
}
