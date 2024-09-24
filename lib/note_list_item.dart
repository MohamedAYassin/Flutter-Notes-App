import 'package:flutter/material.dart';
import 'note.dart';

class NoteListItem extends StatelessWidget {
  final Note note;
  final VoidCallback onTap;

  NoteListItem({required this.note, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(note.title),
      subtitle: Text(note.content.length > 50
          ? '${note.content.substring(0, 50)}...'
          : note.content),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}