import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'home_screen.dart';
import 'note_structure.dart';

class CardNewNotes extends StatefulWidget {
  const CardNewNotes({Key? key}) : super(key: key);

  @override
  State<CardNewNotes> createState() => _CardNewNotesState();
}

class _CardNewNotesState extends State<CardNewNotes> {
  //text editing controller
  final captureNewNoteText = TextEditingController();
  final captureNewNoteTextInFull = TextEditingController();

  //reference box
  final _notesBox = Hive.box('testAdpBox');

  // add new notes
  void newNotes() {
    setState(() {
      //_notesBox.add(captureNewNoteText.text);
      _notesBox.add(NoteStructure(
          heading: captureNewNoteText.text,
          note: captureNewNoteTextInFull.text));

      captureNewNoteText.clear();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add',
                    style: TextStyle(
                      fontFamily: 'Merriweather Sans',
                      fontWeight: FontWeight.w800,
                      fontSize: 50.0,
                      color: const Color(0xFFF4EEE0),
                    ),
                  ),
                  Text(
                    'Notes',
                    style: TextStyle(
                      fontFamily: 'Merriweather Sans',
                      fontWeight: FontWeight.w800,
                      fontSize: 50.0,
                      color: const Color(0xFFF4EEE0),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    cursorColor: const Color(0xFFF4EEE0),
                    style: TextStyle(
                      color: const Color(0xFFF4EEE0),
                    ),
                    decoration: InputDecoration(
                        labelText: 'Notes heading',
                        labelStyle: TextStyle(
                          color: const Color(0xFFF4EEE0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          //width: 3.0,
                          color: const Color(0xFFF4EEE0),
                        )),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          //width: 3.0,
                          color: const Color(0xFFF4EEE0),
                        ))),
                    maxLines: 20,
                    minLines: 1,
                    controller: captureNewNoteText,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    cursorColor: const Color(0xFFF4EEE0),
                    style: TextStyle(
                      color: const Color(0xFFF4EEE0),
                    ),
                    decoration: InputDecoration(
                        labelText: 'Notes body',
                        labelStyle: TextStyle(
                          color: const Color(0xFFF4EEE0),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          //width: 3.0,
                          color: const Color(0xFFF4EEE0),
                        )),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          //width: 3.0,
                          color: const Color(0xFFF4EEE0),
                        ))),
                    maxLines: 20,
                    minLines: 1,
                    controller: captureNewNoteTextInFull,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: const Color(0xFFF4EEE0)),
                          )),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          onPressed: newNotes,
                          child: const Text('Save',
                              style: TextStyle(color: const Color(0xFFF4EEE0))))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
