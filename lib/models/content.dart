// To parse this JSON data, do
//
//     final slide = slideFromJson(jsonString);

import 'dart:convert';

Content slideFromJson(String str) => Content.fromJson(json.decode(str));

String slideToJson(Content data) => json.encode(data.toJson());

class Content {
  Content({
    this.title,
    this.content,
    this.image,
  });

  final String? title;
  final String? content;
  final String? image;

  Content copyWith({
    String? title,
    String? content,
    String? image,
  }) =>
      Content(
        title: title ?? this.title,
        content: content ?? this.content,
        image: image ?? this.image,
      );

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        title: json["title"],
        content: json["content"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "image": image,
      };
}
