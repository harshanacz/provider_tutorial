import 'package:easy_todo/model/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Counter(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: TextCounter()),
        body: Center(child: TextCounter()),
        floatingActionButton: IncrementButton(),
      ),
    );
  }
}

class TextCounter extends StatelessWidget {
  const TextCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Text(
      'Count: ${counter.count}',
      style: const TextStyle(fontSize: 40),
    );
  }
}

class IncrementButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Provider.of<Counter>(context, listen: false).increment();
      },
      child: Icon(Icons.add),
    );
  }
}
