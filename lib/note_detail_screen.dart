import 'package:flutter/material.dart';
import 'note.dart';

class NoteDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Note note = ModalRoute.of(context)!.settings.arguments as Note;

    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.content,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Image.asset('assets/images/note.png'),
          ],
        ),
      ),
    );
  }
}