import 'package:feature_based/feature/Chat/model/messages.dart';

class History {
  int id;
  final DateTime dateTime;
  List<Messages> chatList;
  History({required this.dateTime, required this.chatList, required this.id});

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      id: int.parse(json['id']),
      dateTime: DateTime.parse(json['dateTime']),
      chatList: List<Messages>.from(
          json['chatList'].map((x) => Messages.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id.toString(),
        "dateTime": dateTime.toIso8601String(),
        "chatList": List<dynamic>.from(chatList.map((x) => x.toJson())),
      };
}
