import 'package:easy_todo/models/note_model.dart';
import 'package:flutter/material.dart';

class NoteOperations with ChangeNotifier {
  final List<Note> _notes = [];

  NoteOperations() {
    _notes.add(Note(
        title: 'First Note',
        content: 'This is the first note',
        date: DateTime.now()));
  }

  List<Note> get getNotes => _notes;

  void add(Note note) {
    _notes.add(note);
    notifyListeners();
  }
}
