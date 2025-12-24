
import 'package:task_kodevio/models/geo.dart';

class Address{
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final GeoLoactions? geo;
  Address({required this.street,required this.suite,required this.city,required this.zipcode,required this.geo});

  factory Address.fromJson(Map<String,dynamic>json){
    return Address(
      street: json['street'], 
      suite: json['suite'], 
      city: json['city'], 
      zipcode: json['zipcode'], 
      geo: GeoLoactions.fromJson(json['geo']),
      );
  }
}