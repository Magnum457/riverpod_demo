import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/notes_page.dart';
import 'theme/custom_theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void didChangeDependencies() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: CustomTheme.black,
      ),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Riverpod Demo',
      theme: ThemeData(
        primarySwatch: CustomTheme.black,
        scaffoldBackgroundColor: CustomTheme.black,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: CustomTheme.elevatedButtonStyle,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: CustomTheme.black,
        ),
      ),
      home: const NotesPage(),
    );
  }
}
