import 'dart:core';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Album {
  String title;
  int numero;
  int year;
  int? yearInColor;
  String image;
  String resume;
  // Gps gps;
  String location;



  
  Album({required this.title, required this.numero, required this.image, required this.location, required this.resume, required this.year, this.yearInColor});


  Map<String, Object?> toMap(){
    var map = <String, Object?>{
      "title": title,
      "numero": numero,
      "year": year,
      "yearInColor": yearInColor,
      "image": image,
      "resume": resume,
      "location": location,
    };
    return map;
  }

  @override
  String toString(){
    return "Album{title: $title, numero: $numero, année: $year, annéeEnCouleur: $yearInColor, image: $image, resume: $resume, location: $location}";
  }


  Map<String, dynamic> toJson() => {
      "title": title,
      "numero": numero,
      "year": year,
      "yearInColor": yearInColor ?? 0,
      "image": image,
      "resume": resume,
      // "gps": {
      //   "latitude": gps.latitude,
      //   "longitude": gps.longitude,
      // },
      "location": location,
    };

    factory Album.fromJson(Map<String, dynamic> json){
      return Album(
        image: json["image"],
        title: json["titre"],
        numero: json["numero"],
        year: json["parution"],
        yearInColor: json["parutionEnCouleur"],
        resume: json["resume"],
        location: json["lieu"],
        // gps: json["gps"],
      );
    }
  }
