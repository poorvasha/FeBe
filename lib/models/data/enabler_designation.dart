class EnablerDesignation {
  String? sId;
  String? name;
  String? category;
  int? iV;

  EnablerDesignation({this.sId, this.name, this.category, this.iV});

  EnablerDesignation.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    category = json['category'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['category'] = category;
    data['__v'] = iV;
    return data;
  }
}
