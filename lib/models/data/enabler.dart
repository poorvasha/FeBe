import 'package:febe_frontend/models/data/enabler_designation.dart';

import 'aadhar.dart';

class Enabler {
  String? about;
  String? linkedInURL;
  String? portfolioURL;
  Aadhar? aadhar;
  String? designation;

  Enabler(
      {this.about,
      this.linkedInURL,
      this.portfolioURL,
      this.aadhar,
      this.designation});

  Enabler.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    linkedInURL = json['linkedInURL'];
    portfolioURL = json['portfolioURL'];
    aadhar = json['aadhar'] != null ? Aadhar.fromJson(json['aadhar']) : null;
    designation = json['designation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (about != null) data['about'] = about;
    if (linkedInURL != null) data['linkedInURL'] = linkedInURL;
    if (portfolioURL != null) data['portfolioURL'] = portfolioURL;
    if (aadhar != null) {
      data['aadhar'] = aadhar!.toJson();
    }
    if (designation != null) data['designation'] = designation;
    return data;
  }
}

class ExpandedEnabler {
  String? about;
  String? linkedInURL;
  EnablerDesignation? designation;
  String? sId;
  String? portfolioURL;

  ExpandedEnabler(
      {this.about,
      this.linkedInURL,
      this.designation,
      this.sId,
      this.portfolioURL});

  ExpandedEnabler.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    linkedInURL = json['linkedInURL'];
    linkedInURL = json['portfolioURL'];
    designation = json['designation'] != null
        ? EnablerDesignation.fromJson(json['designation'])
        : null;
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['about'] = about;
    data['linkedInURL'] = linkedInURL;
    data['portfolioURL'] = portfolioURL;
    if (designation != null) {
      data['designation'] = designation!.toJson();
    }
    data['_id'] = sId;
    return data;
  }
}
