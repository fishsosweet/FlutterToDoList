import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_app/Models/Note.dart';
import 'package:my_app/Widget/Content.dart';
import 'package:my_app/Widget/Footer.dart';
import 'package:my_app/Widget/Header.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(child: MyHome()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  final List<Note> notes = [];

  void Addnotes(String name) {
    var idRandom = Uuid();
    final Note note = Note(id: idRandom.v4(), name: name);
    setState(() {
      notes.add(note);
    });
  }

  void DeleteNotes(dynamic noteDelete) {
    setState(() {
      notes.removeWhere((note) => note.id == noteDelete);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children:
              notes
                  .map((note) => Content(note: note, DeleteNotes: DeleteNotes))
                  .toList(),
        ),
      ),
      floatingActionButton: Footer(Addnotes: Addnotes),
    );
  }
}
