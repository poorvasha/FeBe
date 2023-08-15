import 'package:febe_frontend/models/data/user.dart';

class ChatItem {
  User? targetUser;
  RecentMessage? recentMessage;
  int? unreadCount;
  Room? room;

  ChatItem({this.targetUser, this.recentMessage, this.unreadCount, this.room});

  ChatItem.fromJson(Map<String, dynamic> json) {
    targetUser =
        json['targetUser'] != null ? User.fromJson(json['targetUser']) : null;
    recentMessage = json['recentMessage'] != null
        ? RecentMessage.fromJson(json['recentMessage'])
        : null;
    unreadCount = json['unreadCount'];
    room = json['room'] != null ? Room.fromJson(json['room']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (targetUser != null) {
      data['targetUser'] = targetUser!.toJson();
    }
    if (recentMessage != null) {
      data['recentMessage'] = recentMessage!.toJson();
    }
    data['unreadCount'] = unreadCount;
    if (room != null) {
      data['room'] = room!.toJson();
    }
    return data;
  }
}

class RecentMessage {
  String? sId;
  String? fromId;
  String? toId;
  String? roomId;
  String? text;
  bool? isRead;
  String? createdAt;
  String? updatedAt;
  int? iV;

  RecentMessage(
      {this.sId,
      this.fromId,
      this.toId,
      this.roomId,
      this.text,
      this.isRead,
      this.createdAt,
      this.updatedAt,
      this.iV});

  RecentMessage.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fromId = json['fromId'];
    toId = json['toId'];
    roomId = json['roomId'];
    text = json['text'];
    isRead = json['isRead'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['fromId'] = fromId;
    data['toId'] = toId;
    data['roomId'] = roomId;
    data['text'] = text;
    data['isRead'] = isRead;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Room {
  String? sId;
  List<Null>? activeUsers;
  List<String>? targetUsers;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Room(
      {this.sId,
      this.activeUsers,
      this.targetUsers,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Room.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['activeUsers'] != null) {
      activeUsers = <Null>[];
      json['activeUsers'].forEach((v) {
        activeUsers!.add(Null.fromJson(v));
      });
    }
    targetUsers = json['targetUsers'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    if (activeUsers != null) {
      data['activeUsers'] = activeUsers!.map((v) => v.toJson()).toList();
    }
    data['targetUsers'] = targetUsers;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
