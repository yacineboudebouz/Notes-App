import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/constants/loading.dart';
import 'package:notesapp/database/database_provider.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/screens/add_note.dart';
import 'package:notesapp/widgets/note_tile.dart';

class HomePage extends StatefulWidget {
  final NamedRoute = "/homepage";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // to get al the notes
  getNotes() async {
    final notes = await DatabaseProvider.db.getNotes();
    return notes;
  }

  getLength() async {
    final length = await DatabaseProvider.db.getResultLength();
    return length;
  }

  @override
  Widget build(BuildContext context) {
    showAddNotePanel() {
      showModalBottomSheet(
        context: context,
        builder: ((context) {
          return Scaffold(
            backgroundColor: Color(0xff917FB3),
          );
        }),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xff2A2F4F),
      body: FutureBuilder(
        future: getNotes(),
        builder: ((context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              {
                return const Loading();
              }
            case ConnectionState.done:
              {
                if (snapshot.data == null) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Image.asset('assets/nodata.png'),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 350,
                        childAspectRatio: 1,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 2,
                      ),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        String title = snapshot.data[index]['title'];
                        String body = snapshot.data[index]['body'];
                        String creationDate =
                            snapshot.data[index]['creationDate'];
                        int id = snapshot.data[index]['id'];

                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: NoteTile(
                            body: body,
                            title: title,
                            dateTime: creationDate.toString(),
                            id: id,
                          ),
                        );
                      },
                    ),
                  );
                }
              }
            default:
              {
                return Container();
              }
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addnote');
        },
        child: Icon(Icons.note_add),
        backgroundColor: Color(0xff55BA4C),
      ),
    );
  }
}
