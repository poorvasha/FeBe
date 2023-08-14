import 'package:febe_frontend/models/data/expanded_user.dart';

import 'enabler.dart';
import 'entrepreneur.dart';
import 'location.dart';

class User {
  String? sId;
  String? name;
  String? phoneNumber;
  bool? isSignupCompleted;
  String? type;
  Enabler? enabler;
  Entrepreneur? entrepreneur;
  Location? location;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? dob;

  User(
      {this.sId,
      this.name,
      this.phoneNumber,
      this.isSignupCompleted,
      this.type,
      this.enabler,
      this.entrepreneur,
      this.location,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    isSignupCompleted = json['isSignupCompleted'];
    type = json['type'];
    enabler =
        json['enabler'] != null ? Enabler.fromJson(json['enabler']) : null;
    entrepreneur = json['entrepreneur'] != null
        ? Entrepreneur.fromJson(json['entrepreneur'])
        : null;
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
  }

  User.fromExpandedUser(ExpandedUser user) {
    createdAt = user.createdAt;
    updatedAt = user.updatedAt;
    enabler = Enabler(
        about: user.enabler?.about,
        designation: user.enabler?.designation?.sId,
        linkedInURL: user.enabler?.linkedInURL,
        portfolioURL: user.enabler?.portfolioURL);
    entrepreneur = Entrepreneur(
        about: user.entrepreneur?.about,
        companyName: user.entrepreneur?.companyName,
        websiteURL: user.entrepreneur?.websiteURL,
        industry: user.entrepreneur?.industry?.sId,
        linkedInURL: user.entrepreneur?.linkedInURL);
    type = user.type;
    location = user.location;
    phoneNumber = user.phoneNumber;
    isSignupCompleted = user.isSignupCompleted;
    name = user.name;
    dob = user.dateOfBirth;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) data['name'] = name;
    if (phoneNumber != null) data['phoneNumber'] = phoneNumber;
    if (isSignupCompleted != null) {
      data['isSignupCompleted'] = isSignupCompleted;
    }
    if (type != null) data['type'] = type;
    if (enabler != null) {
      data['enabler'] = enabler!.toJson();
    }
    if (entrepreneur != null) {
      data['entrepreneur'] = entrepreneur!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (createdAt != null) data['createdAt'] = createdAt.toString();
    if (createdAt != null) data['updatedAt'] = updatedAt.toString();
    return data;
  }
}
