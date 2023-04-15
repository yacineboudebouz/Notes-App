import 'package:flutter/material.dart';

import '../models/note_model.dart';

class NoteTile extends StatelessWidget {
  int id;
  String title;
  String body;
  String dateTime;

  NoteTile(
      {required this.id,
      required this.body,
      required this.title,
      required this.dateTime});
  @override
  Widget build(BuildContext context) {
    final maincolor = id % 2 == 0 ? Color(0xff917FB3) : Color(0xffE5BEEC);
    void tap() {
      Navigator.pushNamed(
        context,
        '/shownote',
        arguments: NoteModel(
          title: title,
          body: body,
          id: id,
          creationDate: DateTime.parse(dateTime),
        ),
      );
    }

    return GestureDetector(
      onTap: tap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [maincolor.withOpacity(0.7), maincolor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              body.length < 100 ? body : '${body.substring(0, 50)}...',
              maxLines: null,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
      ),
    );
  }
}
