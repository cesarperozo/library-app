import 'dart:convert';

import 'models.dart';

class BooksResponse {
  BooksResponse({
    required this.numFound,
    required this.start,
    required this.numFoundExact,
    required this.docs,
    required this.booksResponseNumFound,
    required this.q,
    this.offset,
  });

  int numFound;
  int start;
  bool numFoundExact;
  List<Book> docs;
  int booksResponseNumFound;
  String q;
  dynamic offset;

  factory BooksResponse.fromJson(String str) =>
      BooksResponse.fromMap(json.decode(str));

  factory BooksResponse.fromMap(Map<String, dynamic> json) => BooksResponse(
        numFound: json["numFound"],
        start: json["start"],
        numFoundExact: json["numFoundExact"],
        docs: List<Book>.from(json["docs"].map((x) => Book.fromMap(x))),
        booksResponseNumFound: json["num_found"],
        q: json["q"],
        offset: json["offset"],
      );
}
