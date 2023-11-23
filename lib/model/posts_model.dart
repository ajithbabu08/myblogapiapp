import 'dart:convert';

List<Blogposts> blogpostsFromJson(String str) => List<Blogposts>.from(json.decode(str).map((x) => Blogposts.fromJson(x)));

String blogpostsToJson(List<Blogposts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Blogposts {
  int? userId;
  int? id;
  String? title;
  String? body;

  Blogposts({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Blogposts.fromJson(Map<String, dynamic> json) => Blogposts(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
