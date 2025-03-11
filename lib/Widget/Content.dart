// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  final note;
  final id;
  Content({super.key, required this.note, required this.DeleteNotes, this.id});
  final Function DeleteNotes;

  void deleteNotes(String note) {
    DeleteNotes(note);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(224, 130, 3, 241),
      ),
      margin: EdgeInsets.only(bottom: 10, top: 10),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              note.name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 255, 255, 255)),
            ),
            FloatingActionButton(
              onPressed: () => deleteNotes(note.id),
              child: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
