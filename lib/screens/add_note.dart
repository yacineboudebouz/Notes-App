import 'package:flutter/material.dart';
import 'package:notesapp/constants/styles.dart';
import 'package:notesapp/database/database_provider.dart';
import 'package:notesapp/models/note_model.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});
  // final nameRoute = '/add_note';

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  String? title;
  String? body;
  DateTime? date;
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  addNote(NoteModel note) {
    DatabaseProvider.db.addNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff917FB3),
        title: Text('Add new Note'),
      ),
      backgroundColor: Color(0xff2A2F4F),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: TextField(
              controller: titleController,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              decoration: titleinput,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Expanded(
              child: TextField(
                controller: bodyController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffE5BEEC)),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            title = titleController.text;
            body = bodyController.text;
            date = DateTime.now();
          });
          NoteModel note =
              NoteModel(title: title!, body: body!, creationDate: date!);
          addNote(note);
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        },
        child: Icon(Icons.save),
        backgroundColor: Color(0xff55BA4C),
      ),
    );
  }
}
