import 'package:flutter/material.dart';
import 'package:library_app/Providers/ui_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';
import 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigatorBar(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final selectedidnex = uiProvider.selectMenuOption;

    switch (selectedidnex) {
      case 0:
        return const SearchPage();

      case 1:
        return const PreferencesPage();

      default:
        return const SearchPage();
    }
  }
}
