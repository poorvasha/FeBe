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
    data['about'] = about;
    data['industry'] = industry;
    data['companyName'] = companyName;
    data['websiteURL'] = websiteURL;
    data['linkedInURL'] = linkedInURL;
    if (companyRegistrationDocument != null) {
      data['companyRegistrationDocument'] =
          companyRegistrationDocument!.toJson();
    }
    return data;
  }
}
