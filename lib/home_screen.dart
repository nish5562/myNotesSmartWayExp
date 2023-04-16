import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'card_maker.dart';
import 'card_new_notes.dart';
import 'note_structure.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //open the hive box
  final _openTheBoxNoteBox = Hive.box('testAdpBox');

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CardNewNotes()));
        },
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: const Color(0xFFF4EEE0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: const Alignment(-1, 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My',
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
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _openTheBoxNoteBox.length,
                  itemBuilder: (context, index) {
                    final notesDetails =
                        _openTheBoxNoteBox.get(index) as NoteStructure;
                    return Align(
                      heightFactor: 1.0,
                      alignment: Alignment.topCenter,
                      child: CardMaker(
                        //textNotes: Text(notesDetails.),
                        textNotes: notesDetails.heading,
                        captureIndexOfBox: index,
                        textNotesHeader: notesDetails.note,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
