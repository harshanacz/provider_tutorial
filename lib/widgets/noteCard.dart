import 'package:easy_todo/models/note_model.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  const NoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        child: ListTile(
          title: Text(note.title),
          subtitle: Text(note.content),
          trailing: Text(note.date.toString()),
        ),
      ),
    );
  }
}
