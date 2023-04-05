import 'dart:convert';

class Post {
  int? userId;
  int? id;
  String? title;
  String? body;

  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Post.fromMap(Map map) {
    return Post(
        userId: map["userId"],
        id: map["id"],
        title: map["title"],
        body: map["body"]);
  }

  Map toMap() {
    return {"id": id, "title": title, "body": body, "userId": userId};
  }
}

List<Post> parsingPost(List json) {
  var list = List<Post>.from(json.map((map) => Post.fromMap(map)));

  return list;
}
