class ChatsData {
  TargetUser? targetUser;
  RecentMessage? recentMessage;
  int? unreadCount;
  Room? room;

  ChatsData({this.targetUser, this.recentMessage, this.unreadCount, this.room});

  ChatsData.fromJson(Map<String, dynamic> json) {
    targetUser = json['targetUser'] != null
        ? TargetUser.fromJson(json['targetUser'])
        : null;
    recentMessage = json['recentMessage'] != null
        ? RecentMessage.fromJson(json['recentMessage'])
        : null;
    unreadCount = json['unreadCount'];
    room = json['room'] != null ?  Room.fromJson(json['room']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
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

class TargetUser {
  String? sId;
  String? type;
  String? phoneNumber;
  bool? isSignupCompleted;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Entrepreneur? entrepreneur;
  String? name;
  Location? location;

  TargetUser(
      {this.sId,
      this.type,
      this.phoneNumber,
      this.isSignupCompleted,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.entrepreneur,
      this.name,
      this.location});

  TargetUser.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    phoneNumber = json['phoneNumber'];
    isSignupCompleted = json['isSignupCompleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    entrepreneur = json['entrepreneur'] != null
        ?  Entrepreneur.fromJson(json['entrepreneur'])
        : null;
    name = json['name'];
    location = json['location'] != null
        ?  Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['_id'] = sId;
    data['type'] = type;
    data['phoneNumber'] = phoneNumber;
    data['isSignupCompleted'] = isSignupCompleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    if (entrepreneur != null) {
      data['entrepreneur'] = entrepreneur!.toJson();
    }
    data['name'] = name;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    return data;
  }
}

class Entrepreneur {
  String? about;
  String? industry;
  String? companyName;
  String? websiteURL;
  String? linkedInURL;
  String? sId;

  Entrepreneur(
      {this.about,
      this.industry,
      this.companyName,
      this.websiteURL,
      this.linkedInURL,
      this.sId});

  Entrepreneur.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    industry = json['industry'];
    companyName = json['companyName'];
    websiteURL = json['websiteURL'];
    linkedInURL = json['linkedInURL'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['about'] = about;
    data['industry'] = industry;
    data['companyName'] = companyName;
    data['websiteURL'] = websiteURL;
    data['linkedInURL'] = linkedInURL;
    data['_id'] = sId;
    return data;
  }
}

class Location {
  String? type;
  List<double>? coordinates;
  String? sId;

  Location({this.type, this.coordinates, this.sId});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['type'] = type;
    data['coordinates'] = coordinates;
    data['_id'] = sId;
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
    final Map<String, dynamic> data =  <String, dynamic>{};
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
  List<String>? activeUsers;
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
    activeUsers = json['activeUsers'].cast<String>();
    targetUsers = json['targetUsers'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['_id'] = sId;
    data['activeUsers'] = activeUsers;
    data['targetUsers'] = targetUsers;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
