import 'package:flutter/material.dart';
import 'package:notesapp/screens/add_note.dart';
import 'package:notesapp/screens/display_note.dart';
import 'package:notesapp/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage().NamedRoute,
      routes: {
        HomePage().NamedRoute: (context) => HomePage(),
        '/addnote': (context) => AddNote(),
        '/shownote': (context) => ShowNote()
      },
      title: 'Note App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}
