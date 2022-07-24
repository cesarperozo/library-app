import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../helpers/debouncer.dart';
import '../models/models.dart';

class BooksService with ChangeNotifier {
  final String _baseUrl = 'openlibrary.org';
  List<Book> books = [];
  bool isLoading = false;

  final textEditingController = TextEditingController();

  BooksService() {
    textEditingController.addListener(onChangeSearch);
  }

  final debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );

  onChangeSearch() async {
    if (textEditingController.text.length < 3) {
      books = [];
      notifyListeners();
      return;
    }
    ;
    debouncer.value = '';
    debouncer.onValue = (value) async {
      await getBooks(value);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debouncer.value = textEditingController.text;
      notifyListeners();
    });

    Future.delayed(const Duration(milliseconds: 301))
        .then((_) => timer.cancel());
  }

  getBooks(String query) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(
      _baseUrl,
      'search.json',
      {
        'q': query,
        'limit': '40',
      },
    );
    print(url);
    final response = await http.get(url);

    final booksResponse = BooksResponse.fromJson(response.body);

    books = booksResponse.docs;
    notifyListeners();

    isLoading = false;
    notifyListeners();
  }

  Future<AuthorResponse> getAuthorTheBook(String id) async {
    final url = Uri.https(
      _baseUrl,
      '/authors/$id.json',
    );

    final response = await http.get(url);

    final author = AuthorResponse.fromJson(response.body);

    return author;
  }
}
