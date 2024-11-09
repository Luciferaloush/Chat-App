import 'package:chatappclone/model/reciver.dart';

class AllChat {
  String? sId;
  String? senderId;
  ReceiverId? receiverId;
  String? message;
  bool? isSender;
  String? timestamp;
  int? iV;

  AllChat(
      {this.sId,
        this.senderId,
        this.receiverId,
        this.message,
        this.isSender,
        this.timestamp,
        this.iV});

  AllChat.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    senderId = json['senderId'];
    receiverId = json['receiverId'] != null
        ? new ReceiverId.fromJson(json['receiverId'])
        : null;
    message = json['message'];
    isSender = json['isSender'];
    timestamp = json['timestamp'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['senderId'] = this.senderId;
    if (this.receiverId != null) {
      data['receiverId'] = this.receiverId!.toJson();
    }
    data['message'] = this.message;
    data['isSender'] = this.isSender;
    data['timestamp'] = this.timestamp;
    data['__v'] = this.iV;
    return data;
  }
}