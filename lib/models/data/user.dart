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
    data['name'] = this.name;
    data['phoneNumber'] = this.phoneNumber;
    data['isSignupCompleted'] = this.isSignupCompleted;
    data['type'] = this.type;
    if (this.enabler != null) {
      data['enabler'] = this.enabler!.toJson();
    }
    if (this.entrepreneur != null) {
      data['entrepreneur'] = this.entrepreneur!.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['createdAt'] = this.createdAt.toString();
    data['updatedAt'] = this.updatedAt.toString();
    return data;
  }
}
