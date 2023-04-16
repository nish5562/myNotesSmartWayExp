import 'package:flutter/material.dart';

import 'card_note_view.dart';

class CardMaker extends StatelessWidget {
  final String textNotes;
  final String textNotesHeader;
  final int captureIndexOfBox;

  const CardMaker(
      {Key? key,
      required this.textNotesHeader,
      required this.textNotes,
      required this.captureIndexOfBox})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Color(0xFF6D5D6E),
      ),
      margin: const EdgeInsets.all(10),

      height: 150.0,
      //height: double.maxFinite,
      width: double.infinity,
      child: Column(
        children: [
          Align(
            alignment: const Alignment(1, -1),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CardNoteView(
                              captureIndex: captureIndexOfBox, headingEdit: textNotesHeader, bodyEdit: textNotes,
                            )));
              },
              icon: const Icon(
                Icons.edit,
                color: const Color(0xFFF4EEE0),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-1, 1),
            child: Padding(
              padding: EdgeInsets.all(6.0),
              child: Text(
                textNotes,
                style: TextStyle(
                  fontFamily: 'Merriweather Sans',
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFF4EEE0),
                  fontSize: 15.0,
                ),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-1, 1),
            child: Padding(
              padding: EdgeInsets.all(6.0),
              child: Text(
                textNotesHeader,
                style: TextStyle(
                  fontFamily: 'Merriweather Sans',
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFF4EEE0),
                  fontSize: 15.0,
                ),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
            ),
          )
        ],
      ),
    );
  }
}
