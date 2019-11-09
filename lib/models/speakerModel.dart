
class SpeakerModel {
  final int id_speaker;
  final String pathImage;
  final String firstName;
  final String lastName;
  final String jobTitle;
  final String countyName;
  final String twitterUSer;
  final String linkedinPath;
  final String about;
  final int isExpert;

  SpeakerModel({this.id_speaker, this.pathImage, this.firstName, this.lastName, this.jobTitle, this.countyName, this.twitterUSer, this.linkedinPath, this.about, this.isExpert});

  factory SpeakerModel.fromJson(Map<String, dynamic> json) => new SpeakerModel(
    id_speaker: json["id_speaker"],
    pathImage: json["pathImage"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    jobTitle: json["jobTitle"],
    countyName: json["countyName"],
    twitterUSer: json["twitterUSer"],
    linkedinPath: json["linkedinPath"],
    about: json["about"],
    isExpert: json["isExpert"]
  );

  Map<String, dynamic> toJson() => {
    "id_speaker": id_speaker,
    "pathImage": pathImage,
    "firstName": firstName,
    "lastName": lastName,
    "jobTitle": jobTitle,
    "countyName": countyName,
    "twitterUSer": twitterUSer,
    "linkedinPath": linkedinPath,
    "about": about,
    "isExpert" : isExpert
  };
}