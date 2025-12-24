
import 'package:task_kodevio/models/address.dart';
import 'package:task_kodevio/models/company.dart';

class User {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final String? phone;
  final String? website;
  final Address? address; 
  final Company? company;

  User(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.phone,
      required this.website,
      required this.address,
      required this.company
      });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        phone: json['phone'],
        website: json['website'],
        address: Address.fromJson(json['address']),
        company: Company.fromJson(json['company']));
  }
  static List<User> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((user) => User.fromJson(user as Map<String, dynamic>)).toList();
  }
}


