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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['designations'] = designations;
    data['__v'] = iV;
    return data;
  }
}
