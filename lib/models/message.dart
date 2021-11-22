import 'package:chat_app/services/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String? uid;
  String? content;
  String? senderUID;
  String? reciverUID;
  Timestamp? createAt;
  Message(
      {this.content, this.createAt, this.reciverUID, this.senderUID, this.uid});
  Message.fromJson(Map<String, dynamic> json, String id) {
    uid = id;
    content = json['content'];
    senderUID = json['senderUID'];
    reciverUID = json['reciverUID'];
    createAt = json['createAt'];
  }
  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'senderUID': senderUID,
      'reciverUID': reciverUID,
      'createAt': createAt,
    };
  }

  bool get isMe => AuthServices().user.uid == senderUID;
}
