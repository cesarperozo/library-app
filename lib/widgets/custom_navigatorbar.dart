import 'package:flutter/material.dart';

import '../Providers/ui_provider.dart';
import 'package:provider/provider.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final selectedIndex = uiProvider.selectMenuOption;

    return BottomNavigationBar(
      onTap: (int i) => uiProvider.selectMenuOption = i,
      currentIndex: selectedIndex,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Inicio'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Preferencias'),
      ],
    );
  }
}
