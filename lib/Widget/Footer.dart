// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Footer extends StatefulWidget {
  final Function Addnotes;

  const Footer({super.key, required this.Addnotes});
  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  var today = DateTime.now();
  late TextEditingController noteFooter;

  @override
  void initState() {
    super.initState();
    noteFooter = TextEditingController();
  }

  void _Click() {
    widget.Addnotes(noteFooter.text);
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
                height: 400,
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
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          useSafeArea: true,
                          context: context,
                          builder: (BuildContext context) {
                            var timeDialog = today;
                            return StatefulBuilder(
                              builder: (content, setStateDialog) {
                                return AlertDialog(
                                  content: Center(
                                    child: SizedBox(
                                      width: double.maxFinite,
                                      height: 400,
                                      child: TableCalendar(
                                        calendarStyle: CalendarStyle(
                                          markerSizeScale: 0.5,
                                        ),
                                        focusedDay: timeDialog,
                                        firstDay: DateTime.utc(2000, 1, 1),
                                        lastDay: DateTime.utc(2100, 12, 31),
                                        selectedDayPredicate:
                                            (day) => isSameDay(timeDialog, day),
                                        onDaySelected: (
                                          selectedDay,
                                          focusedDay,
                                        ) {
                                          setStateDialog(() {
                                            timeDialog = selectedDay;
                                            timeDialog = focusedDay;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Text('Thời gian'),
                    ),
                    SizedBox(
                      width: 250,
                      height: 50,

                      child: ElevatedButton(
                        onPressed: _Click,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(224, 130, 3, 241),
                        ),
                        child: Text(
                          "Lưu",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
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
