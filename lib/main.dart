import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'screens/cardlist_screen.dart';


void main() async {
  await dotenv.load(fileName: '.env');
  runApp(MyApp());
}

ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(),
  useMaterial3: true,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flashcard',
      theme: ThemeData.light(),
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: CardListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}