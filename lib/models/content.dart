// To parse this JSON data, do
//
//     final slide = slideFromJson(jsonString);

import 'dart:convert';

Content slideFromJson(String str) => Content.fromJson(json.decode(str));

String slideToJson(Content data) => json.encode(data.toJson());

class Content {
  Content({
    this.title,
    this.subtitle,
    this.shortDescription,
    this.description,
    this.image,
    this.imageDark,
  });

  final String? title;
  final String? subtitle;
  final String? shortDescription;
  final String? description;
  final String? image;
  final String? imageDark;

  Content copyWith({
    String? title,
    String? subtitle,
    String? shortDescription,
    String? description,
    String? image,
    String? imageDark,
  }) =>
      Content(
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        description: description ?? this.description,
        shortDescription: shortDescription ?? this.shortDescription,
        image: image ?? this.image,
        imageDark: imageDark ?? imageDark,
      );

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        title: json["title"],
        subtitle: json["subtitle"],
        shortDescription: json["short_description"],
        description: json["description"],
        image: json["image"],
        imageDark: json["image_dark"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "short_description": shortDescription,
        "description": description,
        "image": image,
        "image_dark": imageDark,
      };
}
