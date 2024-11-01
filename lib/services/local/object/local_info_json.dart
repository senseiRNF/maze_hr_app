import 'dart:convert';

class LocalInfoJson {
  String? title;
  String? datePublished;
  String? content;
  String? publishedBy;
  String? department;

  LocalInfoJson({
    this.title,
    this.datePublished,
    this.content,
    this.publishedBy,
    this.department,
  });

  String simplify() => jsonEncode({
    "title": title,
    "date_published": datePublished,
    "content": content,
    "published_by": publishedBy,
    "department": department,
  });

  static LocalInfoJson obscure({String? source}) {
    LocalInfoJson result = LocalInfoJson();

    if(source != null) {
      Map<String, dynamic> data = jsonDecode(source);

      result = LocalInfoJson(
        title: data["title"],
        datePublished: data["date_published"],
        content: data["content"],
        publishedBy: data["published_by"],
        department: data["department"],
      );
    }

    return result;
  }
}