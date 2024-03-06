import 'package:flutter/material.dart';

import 'components/home_page.dart';

main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(25, 135, 84, 1),
        ),
      ),
      home: HomePage(),
    );
  }
}

