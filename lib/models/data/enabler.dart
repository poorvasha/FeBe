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
    data['about'] = this.about;
    data['linkedInURL'] = this.linkedInURL;
    data['portfolioURL'] = this.portfolioURL;
    if (this.aadhar != null) {
      data['aadhar'] = this.aadhar!.toJson();
    }
    data['designation'] = this.designation;
    return data;
  }
}
