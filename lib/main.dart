import 'package:easy_todo/models/note_operations.dart';
import 'package:easy_todo/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => NoteOperations(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: appRoutes,
        ));
  }
}
