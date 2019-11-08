import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
//Models
import 'package:io_extended_gdglapaz/models/speakerModel.dart';
export 'package:io_extended_gdglapaz/models/speakerModel.dart';
import 'package:io_extended_gdglapaz/models/sessionModel.dart';
export 'package:io_extended_gdglapaz/models/sessionModel.dart';
import 'package:io_extended_gdglapaz/models/categoryModel.dart';
export 'package:io_extended_gdglapaz/models/categoryModel.dart';


class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if(_database != null)return _database;

    _database = await initDB();
    //await storeSomeRecords();

    return _database;
  }

  initDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "DEVFESTLP19.db");

    var exists = await databaseExists(path);

    if (!exists) {
      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "DEVFESTLP19.db"));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);

    }

    return await openDatabase(path);
  }

  //Create new Speakers
  newSpeaker( SpeakerModel newSpeaker ) async {
    final db = await database;
    final response = db.insert('Speaker', newSpeaker.toJson());
    return response;
  }

  //Get Speakers
  Future<SpeakerModel> getSpeakerId( int id ) async {
    final db = await database;
    final response = await db.query('Speaker', where: 'id_speaker = ?', whereArgs: [id]);

    return response.isNotEmpty ? SpeakerModel.fromJson( response.first ) : null;
  }

  Future<List<SpeakerModel>> getAllSpeakers() async {
    final db = await database;
    final response = await db.query('Speaker', orderBy:  'firstName');

    List<SpeakerModel> list = response.isNotEmpty
                            ? response.map((s) => SpeakerModel.fromJson(s)).toList()
                            :[];
    return list;
  }

  //Create new Session
  newSession( SessionModel newSpeaker ) async {
    final db = await database;
    final response = db.insert('Session', newSpeaker.toJson());
    return response;
  }

  //Get sessions
  Future<List<SessionModel>> getAllSessions() async {
    final db = await database;
    final response = await db.query('Session');

    List<SessionModel> list = response.isNotEmpty
        ? response.map((s) => SessionModel.fromJson(s)).toList()
        :[];

    return list;
  }

  Future<List<Map>> getSessionDetailById(int idSession) async {
    final db = await database;
    final response = await db.rawQuery(
        'SELECT *'
            ' FROM Session'
            ' LEFT JOIN Session_Speaker on Session_Speaker.id_session = Session.id_session'
            ' LEFT JOIN Speaker on Speaker.id_speaker = Session_Speaker.id_speaker'
            ' WHERE Session.id_session = ${idSession}'
            ' LIMIT 1;'
    );

    List<Map> sessionDetail = response.isNotEmpty
        ? response
        :[];

    print(sessionDetail);
    return sessionDetail;
  }

  Future<List<Map>> getTechTalks() async {
    final db = await database;
    final response = await db.rawQuery(
      '﻿SELECT Session.id_session, Speaker.id_speaker, Speaker.pathImage, Speaker.firstName, Speaker.lastName, Session.time, Session.title, Session.extraInfo, Session.extraTitle, Session.extraPathImage, Session.hasDetails'
      ' FROM Session'
      ' LEFT JOIN Session_Speaker on Session_Speaker.id_session = Session.id_session'
      ' LEFT JOIN Speaker on Speaker.id_speaker = Session_Speaker.id_speaker'
      ' WHERE Session.type = "T"'
      ' ORDER BY Session.id_session ASC;'
    );

    List<Map> list = response.isNotEmpty
        ? response
        :[];
    return list;
  }

  Future<List<Map>> getCodelabs() async {
    final db = await database;
    final response = await db.rawQuery(
      '﻿SELECT Session.id_session, Speaker.id_speaker, Speaker.pathImage, Speaker.firstName, Speaker.lastName, Session.time, Session.title, Session.extraInfo, Session.extraTitle, Session.extraPathImage, Session.hasDetails'
      ' FROM Session'
      ' LEFT JOIN Session_Speaker on Session_Speaker.id_session = Session.id_session'
      ' LEFT JOIN Speaker on Speaker.id_speaker = Session_Speaker.id_speaker'
      ' WHERE Session.type = "C"'
      ' ORDER BY Session.id_session ASC;'
    );

    List<Map> list = response.isNotEmpty
        ? response
        :[];
    return list;
  }

  //Get list of categories
  Future<List<CategoryModel>> getCategoriesBySession(int idSession) async {
    final db = await database;
    final response = await db.rawQuery(
      '﻿SELECT Category.id_category, Category.nameTechnology, Category.color'
      ' FROM Session_Category'
      ' INNER JOIN Category ON Category.id_category = Session_Category.id_category'
      ' WHERE Session_Category.id_session = ${idSession}'
    );

    print(response);
    List<CategoryModel> list = response.isNotEmpty
        ? response.map((s) => CategoryModel.fromJson(s)).toList()
        :[];

    return list;
  }
}