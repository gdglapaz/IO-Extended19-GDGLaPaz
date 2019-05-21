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
    var path = join(databasesPath, "IO19_LP.db");

    var exists = await databaseExists(path);

    if (!exists) {
      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "IO19_LP.db"));
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
    final response = await db.query('Speaker', where: 'id = ?', whereArgs: [id]);

    return response.isNotEmpty ? SpeakerModel.fromJson( response.first ) : null;
  }

  Future<List<SpeakerModel>> getAllSpeakers() async {
    final db = await database;
    final response = await db.query('Speaker');

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

  Future<List<Map>> getTechTalks() async {
    final db = await database;
    final response = await db.rawQuery(
      'SELECT Session.id_session, Speaker.id_speaker, Speaker.pathImage, Speaker.firstName, Speaker.lastName, Session.time, Session.title'
      ' FROM Session'
      ' LEFT JOIN Session_Speaker on Session_Speaker.id_session = Session.id_session'
      ' LEFT JOIN Speaker on Speaker.id_speaker = Session_Speaker.id_speaker'
      ' WHERE Session.type = "T"'
      ' ORDER BY Session.id_session ASC;'
    );

    List<Map> list = response.isNotEmpty
        ? response
        :[];
    print(list);
    return list;
  }

  Future<List<Map>> getCodelabs() async {
    final db = await database;
    final response = await db.rawQuery(
        'SELECT Session.id_session, Speaker.id_speaker, Speaker.pathImage, Speaker.firstName, Speaker.lastName, Session.time, Session.title'
            ' FROM Session'
            ' LEFT JOIN Session_Speaker on Session_Speaker.id_session = Session.id_session'
            ' LEFT JOIN Speaker on Speaker.id_speaker = Session_Speaker.id_speaker'
            ' WHERE Session.type = "C"'
            ' ORDER BY Session.id_session ASC;'
    );

    List<Map> list = response.isNotEmpty
        ? response
        :[];
    print(list);
    return list;
  }
}