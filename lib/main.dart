import 'dart:developer';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:note_app/data/data.dart';
import 'package:note_app/data/note_model/note_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddNote(),
    );
  }
}

class AddNote extends StatelessWidget {
  AddNote({Key? key}) : super(key: key);

  Widget get savedButton => TextButton.icon(
      onPressed: () {
        saveNote();
      },
      icon: const Icon(
        Icons.save,
        color: Colors.white,
      ),
      label: const Text(
        'Save',
        style: TextStyle(color: Colors.white),
      ));

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Save Note Form'),
        actions: [
          savedButton,
        ],
      ),
      drawer: Drawer(),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Heading',
              ),
            ),
            TextFormField(
              controller: _contentController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Notes',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveNote() async {
    final title = _titleController.text;
    final content = _contentController.text;
    _titleController.text = '';
    _contentController.text = '';
 

    final _newNote = NoteModel.create(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        title: title,
        content: content);
    NoteDB().createNote(_newNote);
  }
}
