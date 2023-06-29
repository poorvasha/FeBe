import 'enabler.dart';
import 'entrepreneur.dart';
import 'location.dart';

class ExpandedUser {
  String? sId;
  String? phoneNumber;
  String? type;
  bool? isSignupCompleted;
  String? createdAt;
  String? updatedAt;
  String? dateOfBirth;
  ExpandedEnabler? enabler;
  Location? location;
  String? name;
  ExpandedEntrepreneur? entrepreneur;

  ExpandedUser(
      {this.sId,
      this.phoneNumber,
      this.type,
      this.isSignupCompleted,
      this.createdAt,
      this.updatedAt,
      this.dateOfBirth,
      this.enabler,
      this.location,
      this.name,
      this.entrepreneur});

  ExpandedUser.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phoneNumber = json['phoneNumber'];
    type = json['type'];
    isSignupCompleted = json['isSignupCompleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    dateOfBirth = json['dateOfBirth'];
    enabler = json['enabler'] != null
        ? ExpandedEnabler.fromJson(json['enabler'])
        : null;
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    name = json['name'];
    entrepreneur = json['entrepreneur'] != null
        ? ExpandedEntrepreneur.fromJson(json['entrepreneur'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['phoneNumber'] = phoneNumber;
    data['type'] = type;
    data['isSignupCompleted'] = isSignupCompleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['dateOfBirth'] = dateOfBirth;
    if (enabler != null) {
      data['enabler'] = enabler!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['name'] = name;
    if (entrepreneur != null) {
      data['entrepreneur'] = entrepreneur!.toJson();
    }
    return data;
  }
}
