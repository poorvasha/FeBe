import 'package:febe_frontend/models/data/enabler_designation.dart';
import 'package:febe_frontend/screens/finder_home_screen/user_designations.dart';

class EnablerCategory {
  String? sId;
  String? name;
  List<String>? designations;
  int? iV;

  EnablerCategory({this.sId, this.name, this.designations, this.iV});

  EnablerCategory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    designations = json['designations'].cast<String>();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['designations'] = designations;
    data['__v'] = iV;
    return data;
  }
}

class EnablerCategoryWithDesignation {
  String? sId;
  String? name;
  List<EnablerDesignation>? designations;
  int? iV;

  EnablerCategoryWithDesignation(
      {this.sId, this.name, this.designations, this.iV});

  EnablerCategoryWithDesignation.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    if (json['designations'] != null) {
      designations = <EnablerDesignation>[];
      json['designations'].forEach((v) {
        designations!.add(EnablerDesignation.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    if (designations != null) {
      data['designations'] = designations!.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    return data;
  }
}
