import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class PillCarousel extends StatelessWidget {
  final List<String> date;
  final String title;
  const PillCarousel({Key? key, required this.date, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            title,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 40,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: date.length,
              itemBuilder: (_, int index) {
                final publicationPlace = date[index];
                return Container(
                  decoration: BoxDecoration(
                    color: AppTheme.baseColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    publicationPlace,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
