import 'package:easy_todo/models/note_operations.dart';
import 'package:easy_todo/widgets/noteCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy Todo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addNotes');
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer<NoteOperations>(
        builder: (context, noteOperations, child) {
          return ListView.builder(
            itemCount: noteOperations.getNotes.length,
            itemBuilder: (context, index) {
              return NoteCard(note: noteOperations.getNotes[index]);
            },
          );
        },
      ),
    );
  }
}
