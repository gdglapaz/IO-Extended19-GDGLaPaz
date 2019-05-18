import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
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
    //Defining the path
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    
    String path = join(documentsDirectory.path, 'ioExtendedDBPrueba3.db');
    
    return await openDatabase(
      path,
      version: 11,
      onOpen: (db) {},
      onCreate: ( Database db, int version) async {
        await db.execute(
          'CREATE TABLE Speaker ('
          ' id INTEGER PRIMARY KEY,'
          ' pathImage TEXT,'
          ' firstName TEXT,'
          ' lastName TEXT,'
          ' jobTitle TEXT,'
          ' countyName TEXT,'
          ' twitterUSer TEXT,'
          ' linkedinPath TEXT,'
          ' about TEXT'
          ')'
        );

        await db.execute(
          'CREATE TABLE Session ('
          ' id INTEGER PRIMARY KEY,'
          ' title TEXT,'
          ' description TEXT,'
          ' date TEXT,'
          ' time TEXT,'
          ' type TEXT,'
          ' id_speaker INTEGER,'
          ' technologies TEXT'
          ')'
        );
      }
    );
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

  storeSomeRecords() async {
    SpeakerModel speaker = SpeakerModel(id: 1, pathImage: 'https://emea-assets.eventbase.com/uploaded/images/mymwc/mwc19barcelona/c5ffaef5-951e-496b-a4dc-af9bfa49ac1f.jpg', firstName: 'Matt', lastName: 'Sullivan', jobTitle: 'Google Developer Expert in Android', countyName: 'EEUU', twitterUSer: '@matt', linkedinPath:'', about:'...' );
    SpeakerModel speaker2 = SpeakerModel(id: 2, pathImage: 'https://www.websa100.com/wp-content/uploads/2016/05/foto-en-blanco-y-negro.png', firstName: 'Pawan', lastName: 'Kumar', jobTitle: 'Google Developer Expert in Flutter', countyName: 'India', twitterUSer: '@pawan', linkedinPath:'', about:'...' );
    SpeakerModel speaker3 = SpeakerModel(id: 3, pathImage: 'https://emea-assets.eventbase.com/uploaded/images/mymwc/mwc19barcelona/c5ffaef5-951e-496b-a4dc-af9bfa49ac1f.jpg', firstName: 'Gotten', lastName: 'Lhoras', jobTitle: 'Google Developer Expert in Firebase', countyName: 'Finlandia', twitterUSer: '@gothen', linkedinPath:'', about:'...' );
    SpeakerModel speaker4 = SpeakerModel(id: 4, pathImage: 'https://www.websa100.com/wp-content/uploads/2016/05/foto-en-blanco-y-negro.png', firstName: 'Alan', lastName: 'Sampten', jobTitle: 'Google Developer Expert in Firebase', countyName: 'Finlandia', twitterUSer: '@gothen', linkedinPath:'', about:'...' );

    db.newSpeaker(speaker);
    db.newSpeaker(speaker2);
    db.newSpeaker(speaker3);
    db.newSpeaker(speaker4);

    SessionModel session = SessionModel(id: 1, title: 'Title Tech Talk', description: '....', date: '01/06/2019', time: '09:00', type: 'Techtalk', idSpeaker: 1, technologies:'1,2,3' );
    SessionModel session2 = SessionModel(id: 2, title: 'Title Tech Talk 2', description: '....', date: '01/06/2019', time: '09:45', type: 'Techtalk', idSpeaker: 2, technologies:'1,3' );
    SessionModel session3 = SessionModel(id: 3, title: 'Title Tech Talk 3', description: '....', date: '01/06/2019', time: '10:15', type: 'Techtalk', idSpeaker: 3, technologies:'2,3' );

    db.newSession(session);
    db.newSession(session2);
    db.newSession(session3);
  }

  Future<List<Map>> getTechTalks() async {
    final db = await database;
    final response = await db.rawQuery('SELECT Session.id_speaker, Speaker.pathImage, Speaker.firstName, Speaker.lastName, Session.id, Session.time, Session.title, Session.technologies FROM Speaker, Session WHERE Session.id_speaker = Speaker.id');

    List<Map> list = response.isNotEmpty
        ? response
        :[];
    print(list);
    return list;
  }
}