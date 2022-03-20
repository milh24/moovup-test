class Name {
  late String last;
  late String first;

  Name.fromJson(Map<String, dynamic> json) {
    last = json['last'];
    first = json['first'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last'] = last;
    data['first'] = first;
    return data;
  }
}
