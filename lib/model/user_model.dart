import 'dart:convert';

import 'package:myblogapiapp/model/posts_model.dart';

List<UserBlog> userBlogFromJson(String str) => List<UserBlog>.from(json.decode(str).map((x) => UserBlog.fromJson(x)));

String userBlogToJson(List<UserBlog> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserBlog extends Blogposts {
  int? userid;
  String? name;

  UserBlog({
    this.userid,
    this.name,
  });

  factory UserBlog.fromJson(Map<String, dynamic> json) => UserBlog(
    userid: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": userid,
    "name": name,
  };
}

