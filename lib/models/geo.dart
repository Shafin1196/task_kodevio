class GeoLoactions{
  final String? lat;
  final String? lng;
  GeoLoactions({required this.lat,required this.lng});

  factory GeoLoactions.fromJson(Map<String,dynamic>json){
    return GeoLoactions(
      lat: json['lat'], 
      lng: json['lng']
      );
  }
}