import 'dart:async';
import 'dart:io';

import 'package:our_mars/data/model/models.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "OurMars.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Photos ("
          "id INTEGER PRIMARY KEY,"
          "sol INTEGER,"
          "img_src TEXT,"
          "earth_date TEXT,"
          "camera TEXT,"
          "rover_type TEXT,"
          "is_favorite INTEGER"
          ")");
    });
  }

  insertPhotoModel(PhotoModel newPhotoModel) async {
    final db = await database;
    var raw = await db.rawInsert(
        "REPLACE Into Photos (id,sol,img_src,earth_date,camera,rover_type, is_favorite)"
        " VALUES (?,?,?,?,?,?,?)",
        [newPhotoModel.id, newPhotoModel.sol, newPhotoModel.imageUrl, newPhotoModel.earthDate,
          newPhotoModel.camera, newPhotoModel.roverType, newPhotoModel.isFavorite]);
    return raw;
  }

  updatePhoto(PhotoModel newPhotoModel) async {
    final db = await database;
    var res = await db.update("Photos", newPhotoModel.toMap(),
        where: "id = ?", whereArgs: [newPhotoModel.id]);
    return res;
  }

  getPhotoById(int id) async {
    final db = await database;
    var res = await db.query("Photos", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? PhotoModel.fromMap(res.first) : null;
  }

  Future<List<PhotoModel>> getFavoritePhotos() async {
    final db = await database;
    var res = await db.query("Photos", where: "is_favorite = 1");
    List<PhotoModel> list =
    res.isNotEmpty ? res.map((c) => PhotoModel.fromMap(c)).toList() : [];
    return list;
  }


  Future<List<PhotoModel>> getAllPhotos() async {
    final db = await database;
    var res = await db.query("Photos");
    List<PhotoModel> list =
        res.isNotEmpty ? res.map((c) => PhotoModel.fromMap(c)).toList() : [];
    return list;
  }

  deletePhotoById(int id) async {
    final db = await database;
    return db.delete("Photos", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("DELETE * FROM Photos");
  }
}
