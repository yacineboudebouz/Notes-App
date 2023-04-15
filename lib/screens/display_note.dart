import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notesapp/models/note_model.dart';

class ShowNote extends StatelessWidget {
  const ShowNote({super.key});

  @override
  Widget build(BuildContext context) {
    final NoteModel note =
        ModalRoute.of(context)!.settings.arguments as NoteModel;
    return Scaffold(
      backgroundColor: Color(0xff2A2F4F),
      appBar: AppBar(
          title: Text(
        'Your note',
      )),
      body: Padding(
        padding: EdgeInsets.all(0),
        child: ListView(children: [
          Column(
            children: [
              Row(
                children: [
                  Spacer(
                    flex: 2,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                note.title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff917FB3),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                note.body,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w100,
                  color: Color(0xffE5BEEC),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
