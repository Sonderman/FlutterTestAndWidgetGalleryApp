class JsonModel {
  int userId;
  int id;
  String title;
  String body;

  JsonModel({this.userId, this.id, this.title, this.body});

  factory JsonModel.fromMap(Map<String, dynamic> json) => JsonModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
