import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:prova1/database/utente.dart';
//import 'package:path/path.dart';

class DatabaseHelper {

	static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
	static Database _database;                // Singleton Database

	String nomeTabella = 'Utente';

	DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

	factory DatabaseHelper() {

		if (_databaseHelper == null) {
			_databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
		}
		return _databaseHelper;
	}

	Future<Database> get database async {

		if (_database == null) {
			_database = await initializeDatabase();
		}
		return _database;
	}

	Future<Database> initializeDatabase() async {
		// Get the directory path for both Android and iOS to store database.
		Directory directory = await getApplicationDocumentsDirectory();
		String path = directory.path + "_user.db";
    //print("Percorso: "+path);
		//print("Prova");
    // Open/create the database at a given path
		var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    //await deleteDatabase(path);
		return notesDatabase;
	}

/*
  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    //make sure the folder exists otherwise create it
    if (!await Directory(dirname(path)).exists()) {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> initDatabase() async {
    final path = await getDatabasePath("NomeDBUtenti");
    var db = await openDatabase(path, version: 1, onCreate: _createDb);
    print(db);
  }

*/


	void _createDb(Database db, int newVersion) async {

		await db.execute('CREATE TABLE Utente (id TEXT PRIMARY KEY, email TEXT, pw TEXT, ricordami TEXT)');
	}

	// Fetch Operation: Get all note objects from database
	Future<List<Map<String, dynamic>>> prendiTutto() async {
		Database db = await this.database;

		var result = await db.rawQuery('SELECT * FROM Utente');
		//var result = await db.query(nomeTabella);
    //print("Ecco il risultato: "+result.toString());
		return result;
	}

  Future<String> prendiId() async {
		Database db = await this.database;

		var result = await db.rawQuery('SELECT id FROM Utente');
    String a = result[0]["id"];
		return a;
	}

  Future<String> prendiEmail() async {
		Database db = await this.database;

		var result = await db.rawQuery('SELECT email FROM Utente');
    String a = result[0]["email"];
		return a;
	}

  Future<String> prendiPw() async {
		Database db = await this.database;

		var result = await db.rawQuery('SELECT pw FROM Utente');
    String a = result[0]["pw"];
		return a;
	}

  Future<String> controllaRicordami() async {
		Database db = await this.database;

    var controllo = await prendiTutto();
    if (controllo.length!=0) {
      var result = await db.rawQuery('SELECT ricordami FROM Utente');
          //var result = await db.query(nomeTabella);
          print("Ecco il risultato: "+result.toString());
          //print("Result di ricordami: "+result[0]["ricordami"]);
          String a = result[0]["ricordami"];
          return a;
    }
    else{
      //la prima volta, se non c'è nulla inserito...
      UtenteDB u = new UtenteDB(ricordami: "0");
      inserisciDati(u);
      return "0";
    }

		
	}

	// Insert Operation: Insert a Note object to database
	Future<int> inserisciDati(UtenteDB user) async {
		Database db = await this.database;
		var result = await db.insert(nomeTabella, user.toMap());
		return result;
	}

	// Update Operation: Update a Note object and save it to database
	Future<int> aggiornaDati(UtenteDB user) async {
		var db = await this.database;
		var result = await db.update(nomeTabella, user.toMap(), where: 'id = ?', whereArgs: [user.id]);
		return result;
	}

	// Delete Operation: Delete a Note object from database
	Future<int> cancellaTutto() async {
		var db = await this.database;
		int result = await db.rawDelete('DELETE FROM $nomeTabella');
		return result;
	}
  /*
	// Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
	Future<List<UtenteDB>> getNoteList() async {

		var noteMapList = await getNoteMapList(); // Get 'Map List' from database
		int count = noteMapList.length;         // Count the number of map entries in db table

		List<UtenteDB> noteList = List<UtenteDB>();
		// For loop to create a 'Note List' from a 'Map List'
		for (int i = 0; i < count; i++) {
			noteList.add(UtenteDB.fromMapObject(noteMapList[i]));
		}

		return noteList;
	}*/

}