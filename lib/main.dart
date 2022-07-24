import 'package:flutter/material.dart';
import 'package:library_app/Providers/preferences_form_provider.dart';
import 'package:library_app/Providers/ui_provider.dart';
import 'package:library_app/services/books_service.dart';
import 'package:library_app/share_preferences/prefrences.dart';
import 'package:provider/provider.dart';

import 'pages/pages.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(
    const AppState(),
  );
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UiProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => PreferencesFormProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => BooksService(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Library App',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomePage(),
        'preferences': (_) => const PreferencesPage(),
        'preferencesDetails': (_) => const PreferencesDetails(),
        'bookDetails': (_) => const BookDetailsPage()
      },
      theme: AppTheme.themeData,
    );
  }
}
