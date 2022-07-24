import 'package:flutter/material.dart';
import 'package:library_app/models/book.dart';

import '../widgets/widgets.dart';

class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Book book = ModalRoute.of(context)?.settings.arguments as Book;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(
            book: book,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                AuthorCard(idAuthor: book.authorKey![0]),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Publicado por primera vez',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'en ${book.firstPublishYear}',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                if (book.publishPlace != null)
                  PillCarousel(
                    date: book.publishPlace!,
                    title: 'Lugares de publicación',
                  ),
                if (book.language != null)
                  PillCarousel(
                    date: book.language!,
                    title: 'Lenguajes',
                  ),
                /* _Overview(overview: movie.overview),
                const SizedBox(
                  height: 20,
                ),
                CastingCards(movieId: movie.id), */
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Book book;
  const _CustomAppBar({
    Key? key,
    required this.book,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.only(bottom: 16, left: 10, right: 10),
          child: Text(
            book.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(book.fullBackdropPathImg),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
