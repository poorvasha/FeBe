class ExpandedChatMessage{
  String? sId;
  FromId? fromId;
  ToId? toId;
  RoomId? roomId;
  String? text;
  bool? isRead;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ExpandedChatMessage(
      {this.sId,
      this.fromId,
      this.toId,
      this.roomId,
      this.text,
      this.isRead,
      this.createdAt,
      this.updatedAt,
      this.iV});

  ExpandedChatMessage.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fromId =
        json['fromId'] != null ? new FromId.fromJson(json['fromId']) : null;
    toId = json['toId'] != null ? new ToId.fromJson(json['toId']) : null;
    roomId =
        json['roomId'] != null ? new RoomId.fromJson(json['roomId']) : null;
    text = json['text'];
    isRead = json['isRead'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.fromId != null) {
      data['fromId'] = this.fromId!.toJson();
    }
    if (this.toId != null) {
      data['toId'] = this.toId!.toJson();
    }
    if (this.roomId != null) {
      data['roomId'] = this.roomId!.toJson();
    }
    data['text'] = this.text;
    data['isRead'] = this.isRead;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class FromId {
  String? sId;
  String? type;
  String? phoneNumber;
  bool? isSignupCompleted;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Enabler? enabler;
  String? name;
  Location? location;
  FromEntrepreneur? entrepreneur;

  FromId(
      {this.sId,
      this.type,
      this.phoneNumber,
      this.isSignupCompleted,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.enabler,
      this.name,
      this.location,
      this.entrepreneur});

  FromId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    phoneNumber = json['phoneNumber'];
    isSignupCompleted = json['isSignupCompleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    enabler =
        json['enabler'] != null ? new Enabler.fromJson(json['enabler']) : null;
    name = json['name'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    entrepreneur = json['entrepreneur'] != null
        ? new FromEntrepreneur.fromJson(json['entrepreneur'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['phoneNumber'] = this.phoneNumber;
    data['isSignupCompleted'] = this.isSignupCompleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.enabler != null) {
      data['enabler'] = this.enabler!.toJson();
    }
    data['name'] = this.name;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.entrepreneur != null) {
      data['entrepreneur'] = this.entrepreneur!.toJson();
    }
    return data;
  }
}

class Enabler {
  String? about;
  String? linkedInURL;
  String? portfolioURL;
  String? designation;
  String? sId;

  Enabler(
      {this.about,
      this.linkedInURL,
      this.portfolioURL,
      this.designation,
      this.sId});

  Enabler.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    linkedInURL = json['linkedInURL'];
    portfolioURL = json['portfolioURL'];
    designation = json['designation'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about'] = this.about;
    data['linkedInURL'] = this.linkedInURL;
    data['portfolioURL'] = this.portfolioURL;
    data['designation'] = this.designation;
    data['_id'] = this.sId;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    data['_id'] = this.sId;
    return data;
  }
}

class FromEntrepreneur {
  String? sId;

  FromEntrepreneur({this.sId});

  FromEntrepreneur.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    return data;
  }
}

class ToId {
  String? sId;
  String? type;
  String? phoneNumber;
  bool? isSignupCompleted;
  String? createdAt;
  String? updatedAt;
  int? iV;
  ToEntrepreneur? entrepreneur;
  String? name;
  Location? location;

  ToId(
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

  ToId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    phoneNumber = json['phoneNumber'];
    isSignupCompleted = json['isSignupCompleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    entrepreneur = json['entrepreneur'] != null
        ? new ToEntrepreneur.fromJson(json['entrepreneur'])
        : null;
    name = json['name'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['phoneNumber'] = this.phoneNumber;
    data['isSignupCompleted'] = this.isSignupCompleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.entrepreneur != null) {
      data['entrepreneur'] = this.entrepreneur!.toJson();
    }
    data['name'] = this.name;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}

class ToEntrepreneur {
  String? about;
  String? industry;
  String? companyName;
  String? websiteURL;
  String? linkedInURL;
  String? sId;

  ToEntrepreneur(
      {this.about,
      this.industry,
      this.companyName,
      this.websiteURL,
      this.linkedInURL,
      this.sId});

  ToEntrepreneur.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    industry = json['industry'];
    companyName = json['companyName'];
    websiteURL = json['websiteURL'];
    linkedInURL = json['linkedInURL'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about'] = this.about;
    data['industry'] = this.industry;
    data['companyName'] = this.companyName;
    data['websiteURL'] = this.websiteURL;
    data['linkedInURL'] = this.linkedInURL;
    data['_id'] = this.sId;
    return data;
  }
}

class RoomId {
  String? sId;
  List<String>? activeUsers;
  List<String>? targetUsers;
  String? createdAt;
  String? updatedAt;
  int? iV;

  RoomId(
      {this.sId,
      this.activeUsers,
      this.targetUsers,
      this.createdAt,
      this.updatedAt,
      this.iV});

  RoomId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    activeUsers = json['activeUsers'].cast<String>();
    targetUsers = json['targetUsers'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['activeUsers'] = this.activeUsers;
    data['targetUsers'] = this.targetUsers;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
