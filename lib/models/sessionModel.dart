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

  SessionModel({
    this.id,
    this.title,
    this.description,
    this.date,
    this.time,
    this.type
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) => new SessionModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    date: json["date"],
    time: json["time"],
    type: json["type"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "date": date,
    "time": time,
    "type": type
  };
}
