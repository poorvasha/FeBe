class Aadhar {
  String? front;
  String? back;

  Aadhar({this.front, this.back});

  Aadhar.fromJson(Map<String, dynamic> json) {
    front = json['front'];
    back = json['back'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['front'] = this.front;
    data['back'] = this.back;
    return data;
  }
}
