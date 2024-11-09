import 'package:chatappclone/model/reciver.dart';

import 'auth/user.dart';
import 'auth/users.dart';

class Message {
  final String type;
  final String message;
  final String time;
  final String path;
  Message({required this.type, required this.message, required this.time, required this.path });
}

class Messages {
  String? sId;
  User? senderId;
  String? path;
 // Users? receiverId;
  String? message;
  String? timestamp;
  int? iV;
  ReceiverId? receiverId;

  bool? isSender;

  Messages(
      {this.sId,
        this.senderId,
        this.path,
        this.receiverId,
        this.message,
        this.timestamp,
        this.iV,
        this.isSender,

      });

  Messages.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    senderId = json['senderId'] != null
        ? User.fromJson(json['senderId'])
        : null;
    path = json['path'];
    receiverId = json['receiverId'] != null
        ? ReceiverId.fromJson(json['receiverId'])
        : null;
    message = json['message'];
    timestamp = json['timestamp'];
    iV = json['__v'];
    isSender = json['isSender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (senderId != null) {
      data['senderId'] = senderId!.toJson();
    }
    if (receiverId != null) {
      data['receiverId'] = receiverId!.toJson();
    }
    data['message'] = message;
    data['path'] = path;
    data['timestamp'] = timestamp;
    data['__v'] = iV;
    data['isSender'] = isSender;
    return data;
  }
}

