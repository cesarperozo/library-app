import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_app/models/models.dart';
import 'package:library_app/services/books_service.dart';
import 'package:provider/provider.dart';

class AuthorCard extends StatelessWidget {
  final String idAuthor;
  const AuthorCard({Key? key, required this.idAuthor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
/*     final author = book.authorName?[0].toString();
 */

    final booksProvider = Provider.of<BooksService>(context, listen: false);

    return FutureBuilder(
      future: booksProvider.getAuthorTheBook(idAuthor),
      builder: (_, AsyncSnapshot<AuthorResponse> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox(
            height: 180,
            child: CupertinoActivityIndicator(),
          );
        }
        final author = snapshot.data;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  'Autor',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${author?.name}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(fontSize: 20),
                  ),
                  if (author != null)
                    Text('${author.bio}', style: const TextStyle(fontSize: 16)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
