// To parse this JSON data, do
//
//     final authorResponse = authorResponseFromMap(jsonString);

import 'dart:convert';

class AuthorResponse {
  AuthorResponse({
    this.wikipedia,
    this.sourceRecords,
    this.photos,
    this.alternateNames,
    this.name,
    this.birthDate,
    this.personalName,
    this.title,
    this.type,
    this.entityType,
    this.bio,
    this.key,
    this.latestRevision,
    this.revision,
  });

  String? wikipedia;
  List<String>? sourceRecords;
  List<int>? photos;
  List<String>? alternateNames;
  String? name;
  String? birthDate;
  String? personalName;
  String? title;
  Type? type;
  String? entityType;
  String? bio;
  String? key;
  int? latestRevision;
  int? revision;

  factory AuthorResponse.fromJson(String str) =>
      AuthorResponse.fromMap(json.decode(str));

  factory AuthorResponse.fromMap(Map<String, dynamic> json) => AuthorResponse(
        wikipedia: json["wikipedia"],
        sourceRecords: json["source_records"] == null
            ? null
            : List<String>.from(json["source_records"].map((x) => x)),
        photos: json["photos"] == null
            ? null
            : List<int>.from(json["photos"].map((x) => x)),
        alternateNames: json["alternate_names"] == null
            ? null
            : List<String>.from(json["alternate_names"].map((x) => x)),
        name: json["name"],
        birthDate: json["birth_date"],
        personalName: json["personal_name"],
        title: json["title"],
        entityType: json["entity_type"],
        bio: json["bio"],
        key: json["key"],
        latestRevision: json["latest_revision"],
        revision: json["revision"],
      );
}
