import 'dart:convert';

SessionModel sessionModelFromJson(String str) => SessionModel.fromJson(json.decode(str));

String sessionModelToJson(SessionModel data) => json.encode(data.toJson());

class SessionModel {
  int id;
  String title;
  String description;
  String date;
  String time;
  String type;
  int idSpeaker;
  String technologies;

  SessionModel({
    this.id,
    this.title,
    this.description,
    this.date,
    this.time,
    this.type,
    this.idSpeaker,
    this.technologies,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) => new SessionModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    date: json["date"],
    time: json["time"],
    type: json["type"],
    idSpeaker: json["id_speaker"],
    technologies: json["technologies"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "date": date,
    "time": time,
    "type": type,
    "id_speaker": idSpeaker,
    "technologies": technologies,
  };
}
