class EntrepreneurIndustry {
  String? sId;
  String? name;
  int? iV;

  EntrepreneurIndustry({this.sId, this.name, this.iV});

  EntrepreneurIndustry.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['__v'] = iV;
    return data;
  }
}
