import 'location.dart';
import 'name.dart';

class Person {
  late String id;
  late Name name;
  late String email;
  late String picture;
  late Location location;

  Person.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = Name.fromJson(json['name']);
    email = json['email'];
    picture = json['picture'];
    location = Location.fromJson(json['location']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name.toJson();
    data['email'] = email;
    data['picture'] = picture;
    data['location'] = location.toJson();
    return data;
  }
}
