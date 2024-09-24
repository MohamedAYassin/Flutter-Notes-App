import 'package:flutter/material.dart';
import 'note.dart';
import 'note_list_item.dart';
import 'new_note_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = [
    Note(title: 'Grocery List', content: 'Milk, eggs, bread'),
    Note(title: 'Project Ideas', content: 'Flutter app, web app, mobile app'),
    Note(title: 'Workout Plan', content: 'Monday: Run 5km, Tuesday: Strength training'),
  ];

  void addNewNote(Note newNote) {
    setState(() {
      notes.add(newNote);
    });
  }
  void removeNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Notes App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.note_add),
              title: Text('New Note'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewNoteScreen(addNewNote: addNewNote),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(notes[index].title),
            direction: DismissDirection.endToStart, // Change here
            onDismissed: (direction) {
              removeNote(index);
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: NoteListItem(
              note: notes[index],
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/note-detail',
                  arguments: notes[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
