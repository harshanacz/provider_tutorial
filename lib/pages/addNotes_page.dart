// ignore: file_names
import 'package:easy_todo/models/note_model.dart';
import 'package:easy_todo/models/note_operations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({super.key});

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'Title',
                ),
              ),
              TextField(
                controller: _contentController,
                decoration: const InputDecoration(
                  hintText: 'Content',
                ),
                maxLines: 3,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_titleController.text.isEmpty) {
                    customShowDialog();
                  } else {
                    try {
                      Provider.of<NoteOperations>(context, listen: false).add(
                        Note(
                          title: _titleController.text,
                          content: _contentController.text,
                          date: DateTime.now(),
                        ),
                      );
                      Navigator.pop(context);
                    } catch (error) {
                      if (kDebugMode) {
                        print("Error adding note: $error");
                      }
                    }
                  }
                },
                child: const Text('Add Note'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void customShowDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Title cannot be empty'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
