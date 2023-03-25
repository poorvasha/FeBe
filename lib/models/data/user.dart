import 'enabler.dart';
import 'entrepreneur.dart';
import 'location.dart';

class User {
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
      {this.name,
      this.phoneNumber,
      this.isSignupCompleted,
      this.type,
      this.enabler,
      this.entrepreneur,
      this.location,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    isSignupCompleted = json['isSignupCompleted'];
    type = json['type'];
    enabler =
        json['enabler'] != null ? new Enabler.fromJson(json['enabler']) : null;
    entrepreneur = json['entrepreneur'] != null
        ? new Entrepreneur.fromJson(json['entrepreneur'])
        : null;
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (name != null) data['name'] = name;
    if (phoneNumber != null) data['phoneNumber'] = phoneNumber;
    if (isSignupCompleted != null)
      data['isSignupCompleted'] = isSignupCompleted;
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
