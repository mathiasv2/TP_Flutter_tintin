import 'dart:convert';
import 'dart:core';
import 'dart:math';
import 'package:faker/faker.dart';
import 'package:flutter/services.dart';
import '../models/album.dart';
import '../models/gps.dart';

class AlbumService{
 

  static Album generateRandomAlbum(){
    Faker faker = Faker();
    List<String> images = ["assets/coke-en-stock.jpg", "assets/l-affaire-tournesol.jpg", "assets/l-etoile-mysterieuse.jpg", "assets/l-ile-noire.jpg", "assets/le-crabe-aux-pinces-d-or.jpg", "assets/l-oreile-cassee.jpg", "assets/le-tresor-de-rackham-le-rouge.jpg", "assets/le-lotus-bleu.jpg", "assets/le-sceptre-d-ottokar.jpg", "assets/le-temple-du-soleil.jpg", "assets/le-secret-de-la-licorne.jpg", "assets/les-7-boules-de-cristal.jpg", "assets/objectif-lune.jpg", "assets/tintin-au-congo.jpg", "assets/les-cigares-du-pharaon.jpg", "assets/on-a-marche-sur-la-lune.jpg", "assets/tintin-au-pays-de-l-or-noir.jpg", "assets/tintin-au-pays-des-soviets.jpg", "assets/tintin-au-tibet.jpg", "assets/tintin-et-l-alph-art.jpg", "assets/tintin-en-amerique.jpg", "assets/tintin-et-les-picaros.jpg", "assets/vol-714-pour-sydney.jpg"];
    List<String> titres= ["coke en stock", "l'affaire tournesol", "l'étoile mystérieuse", "l'oreille cassée", "le crabe aux pinces d'or", "le lotus bleu", "le sceptre doré", "le secret de la licorne", "le temple du soeil", "les boules de cristal", "les cigares du pharaon", "objectif lune", "on a marché sur la lune", "tintin au congo", "tintin au pays de l'or noir", "tintin au pays des soviets", "tintin au tibet", "tintin en amérique", "tintin et l'alph art", "tintin et les picoras", "vol 714 pour sydney"];
    int random = Random().nextInt(21);
    print(random);

    return Album(
      title: titres[random],
      numero: faker.randomGenerator.integer(50),
      year: faker.date.dateTime(minYear: 1980, maxYear: 2010).year,
      yearInColor: faker.randomGenerator.integer(100),
      image: images[random],
      resume: faker.lorem.sentences(5).toString(),
      // gps: Gps(latitude: faker.geo.latitude(), longitude: faker.geo.longitude()),
      location: faker.address.country(),
    );
  }

  static Future<List<Album>> generateRandomAlbumS() async{
    return List.generate(21, (index) => generateRandomAlbum());
    
  }

  static Future<List<Album>> fetchAlbums() async {
    final String jsonString = await rootBundle.loadString("data/albums.json");
    final List<dynamic>data = jsonDecode(jsonString);
    return data.map((album) => Album.fromJson(album)).toList();
    
  }
}

    


