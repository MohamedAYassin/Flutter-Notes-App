import 'package:flutter/material.dart';
import 'note.dart';

class NewNoteScreen extends StatefulWidget {
  final Function(Note) addNewNote;

  NewNoteScreen({required this.addNewNote});

  @override
  _NewNoteScreenState createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Note'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Enter note title',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _contentController,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Enter note content',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final Note newNote = Note(
                  title: _titleController.text,
                  content: _contentController.text,
                );
                widget.addNewNote(newNote); // Call the function to add the new note
                Navigator.pop(context);
              },
              child: Text('Save Note'),
            ),
          ],
        ),
      ),
    );
  }
}
