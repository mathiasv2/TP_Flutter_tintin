// import 'package:sqflite/sqflite.dart';

// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper._internal();
//   factory DatabaseHelper() => _instance;

//   static Database? _database;

//   DatabaseHelper._internal();

//   Future<Database> get database async {
//     if(_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     String path = join(await getDatabasesPath(), "likesProviderMemory.db");
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _onCreate,
//     );
//   }

//   Future _onCreate(Database db, int version) async {
//     db.execute(
//       '''CREATE TABLE likesProviderMemory(
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         title TEXT,
//         numero INTEGER,
//         year INTEGER,
//         yearInColor INTEGER,
//         image TEXT,
//         resume TEXT,
//         location TEXT
//       )'''
//     );
//   }








// }