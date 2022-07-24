import 'package:flutter/material.dart';
import 'package:library_app/theme/app_theme.dart';

class InputSearch extends StatelessWidget {
  final TextEditingController textEditingController;
  const InputSearch({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      width: double.infinity,
      child: TextField(
        controller: textEditingController,
        autofocus: true,
        style: const TextStyle(color: AppTheme.textColor, fontSize: 16),
        decoration: const InputDecoration(
          suffixIconConstraints: BoxConstraints(maxHeight: 10),
          hintText: 'Buscar libros...',
          prefixIcon: Icon(
            Icons.search_rounded,
            color: AppTheme.textColor,
            size: 30,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
