class Gps {
  late double latitude;
  late double longitude;

  Gps({required this.latitude, required this.longitude});

  @override
  String toString(){
    return "Gps{latitude:$latitude, longitude:$longitude}";
  }
}