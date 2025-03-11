// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final Function Addnotes;
  
  Footer({super.key, required this.Addnotes});
  TextEditingController noteFooter = TextEditingController();

  void _Click() {
    Addnotes(noteFooter.text);
    noteFooter.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return Container(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: const Color.fromARGB(255, 210, 180, 217),
                ),
                height: 200,
                width: 450,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextField(
                      controller: noteFooter,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Thêm ghi chú',
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      height: 50,
                      
                      child: ElevatedButton(
                        onPressed: _Click,
                        style: ElevatedButton.styleFrom(
                        
                          backgroundColor: Color.fromARGB(224, 130, 3, 241),
                        ),
                        child: Text("Lưu",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255)
                        ),),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      hoverColor: Color.fromARGB(224, 130, 3, 241),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Icon(Icons.add),
    );
  }
}
