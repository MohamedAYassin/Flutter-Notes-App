import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'note_detail_screen.dart';
import 'new_note_screen.dart';

void main() {
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Raleway',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/note-detail': (context) => NoteDetailScreen(),
        '/new-note': (context) => NewNoteScreen(addNewNote: (Note ) {  },),
      },
    );
  }
}