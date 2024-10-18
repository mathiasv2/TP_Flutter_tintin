import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tintin/models/album.dart';

class LikesProvider extends ChangeNotifier{
  final List<Album> _albums = [];


  Future<Database> initializeDatabase() async {
  final dbPath = await getDatabasesPath();

  return openDatabase(
    join(dbPath, "likedAlbum.db"),
    onCreate: (db, version) async {
      await db.execute(
        '''CREATE TABLE likedAlbums(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          numero INTEGER,
          year INTEGER,
          yearInColor INTEGER,
          image TEXT,
          resume TEXT,
          location TEXT
        )'''
      );
    },
    version: 1,
  );
}

  Future<void> insertAlbum(Album album) async {
    final db = await initializeDatabase();

    await db.insert("likedAlbums", album.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteAlbum(Album album) async {
    final db = await initializeDatabase();

      await db.delete("likedAlbums", where: "id = ?",);
  }

  Future<List<Album>> getLikedAlbums() async {
    final db = await initializeDatabase();

    final List<Map<String, Object?>> albumMaps = await db.query("likedAlbums");

    return [
      for (final {
        "id" : id as int,
        "title" : title as String,
        "numero": numero as int,
        "year": year as int,
        "yearInColor": yearInColor as int,
        "image": image as String,
        "resume": resume as String,
        "location": location as String,
        
      } in albumMaps)
      Album(title: title, numero: numero, year: year, yearInColor: yearInColor, image: image, resume: resume, location: location)
    ];
  }

  void likeAlbum(Album album){
    _albums.add(album);

    notifyListeners();
  }

  void unlikeAlbum(Album album){
    _albums.remove(album);

    notifyListeners();
  }

  bool isLiked(Album album){
    return _albums.contains(album);
  }

  // void likeAlbum(Album album) {
  //   _albums.add(album);
  //   insertAlbum(album).then((_) => notifyListeners());
  // }

  // void unlikeAlbum(Album album) {
  //   _albums.remove(album);
  //   deleteAlbum(album).then((_) => notifyListeners());
  // }

  // bool isLiked(Album album) {
  //   return _albums.contains(album);
}