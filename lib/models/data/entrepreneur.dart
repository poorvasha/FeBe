import 'company_registration.dart';

class Entrepreneur {
  String? about;
  String? industry;
  String? companyName;
  String? websiteURL;
  String? linkedInURL;
  CompanyRegistrationDocument? companyRegistrationDocument;

  Entrepreneur(
      {this.about,
      this.industry,
      this.companyName,
      this.websiteURL,
      this.linkedInURL,
      this.companyRegistrationDocument});

  Entrepreneur.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    industry = json['industry'];
    companyName = json['companyName'];
    websiteURL = json['websiteURL'];
    linkedInURL = json['linkedInURL'];
    companyRegistrationDocument = json['companyRegistrationDocument'] != null
        ? CompanyRegistrationDocument.fromJson(
            json['companyRegistrationDocument'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (about != null) data['about'] = about;
    if (industry != null) data['industry'] = industry;
    if (companyName != null) data['companyName'] = companyName;
    if (websiteURL != null) data['websiteURL'] = websiteURL;
    if (linkedInURL != null) data['linkedInURL'] = linkedInURL;
    if (companyRegistrationDocument != null) {
      data['companyRegistrationDocument'] =
          companyRegistrationDocument!.toJson();
    }
    return data;
  }
}
