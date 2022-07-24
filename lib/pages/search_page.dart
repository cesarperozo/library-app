import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_app/models/models.dart';
import 'package:library_app/services/books_service.dart';
import 'package:library_app/theme/app_theme.dart';
import 'package:library_app/widgets/input_search.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final booksService = Provider.of<BooksService>(context);

    final books = booksService.books;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Libreria',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            InputSearch(
              textEditingController: booksService.textEditingController,
            ),
            booksService.isLoading
                ? Column(
                    children: const [
                      SizedBox(
                        height: 250,
                      ),
                      CupertinoActivityIndicator(
                        color: AppTheme.primary,
                        radius: 40,
                      ),
                    ],
                  )
                : Expanded(
                    child: books.isEmpty
                        ? const Icon(
                            Icons.movie_creation_outlined,
                            color: Colors.grey,
                            size: 130,
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.only(bottom: 40, top: 20),
                            itemCount: books.length,
                            itemBuilder: (context, i) {
                              final book = books[i];
                              return _BookCard(book: book);
                            },
                          ),
                  )
          ],
        ),
      ),
    );
  }
}

class _BookCard extends StatelessWidget {
  final Book book;
  const _BookCard({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => {
        Navigator.of(context).pushNamed('bookDetails', arguments: book),
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: _cardBorders(),
        height: 200,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: 150,
                  height: double.infinity,
                  child: FadeInImage(
                    image: NetworkImage(book.coverImg),
                    placeholder: const AssetImage('assets/jar-loading.gif'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            _CardDetails(
              book: book,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
        color: AppTheme.baseColor,
        borderRadius: BorderRadius.circular(15),
      );
}

class _CardDetails extends StatelessWidget {
  const _CardDetails({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    final author = book.authorName?[0].toString();

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 190,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: 225,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              book.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textColor),
            ),
            if (author != null)
              Text(
                'de  $author',
                style: const TextStyle(
                  fontSize: 16,
                  color: AppTheme.textColor,
                ),
              ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Publicado por primera vez en ${book.firstPublishYear}',
              maxLines: 2,
              style: const TextStyle(
                fontSize: 16,
                color: AppTheme.textColor,
              ),
            ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'Ver detalles',
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 16,
                      color: AppTheme.primary,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.arrow_forward_ios_rounded,
                    size: 15, color: AppTheme.primary)
              ],
            )
          ],
        ),
      ),
    );
  }
}
