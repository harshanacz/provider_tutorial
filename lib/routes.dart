import 'package:easy_todo/pages/addNotes_page.dart';
import 'package:easy_todo/pages/home_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> get appRoutes => {
      '/': (context) => const HomeScreen(),
      '/addNotes': (context) => const AddNotesScreen(),
    };
