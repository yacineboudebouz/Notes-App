import 'package:notesapp/models/note_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  // instance of our database to use in the hole app
  static Database? _database;
  // here to get the databa base if exist or not
  // once it not exist i t creates a new using initDB function
  Future<Database> get dataBase async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    return await openDatabase(join(await getDatabasesPath(), 'note_app.db'),
        onCreate: (db, version) async {
      await db.execute(
          '''CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, body TEXT, creationDate DATE)''');
    }, version: 1);
  }

  // function to add to our dataBase
  addNote(NoteModel note) async {
    final db = await dataBase;
    db.insert(
      'notes',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // function to fetch the database
  Future<dynamic> getNotes() async {
    final db = await dataBase;
    var res = await db.query('notes');
    if (res.length == 0) {
      return null;
    } else {
      var resultMap = res.toList();
      return resultMap.isNotEmpty ? resultMap : null;
    }
  }

  Future<int> getResultLength() async {
    // open the database
    final db = await openDatabase('note_app.db');

    // execute a SQL query to get the result set
    final List<Map<String, dynamic>> result =
        await db.rawQuery('SELECT * FROM notes');

    // return the length of the result set
    return result.length;
  }
}
