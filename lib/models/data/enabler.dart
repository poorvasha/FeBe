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
    aadhar =
        json['aadhar'] != null ? new Aadhar.fromJson(json['aadhar']) : null;
    designation = json['designation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
