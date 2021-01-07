import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static final _databaseName = "Database.db";
  static final _databaseVersion = 1;
  static final table = "user";
  static final c_user_id = "user_id";
  static final c_email = "email";
  static final c_password = "password";
  static final c_fname = "fname";
  static final c_lname = "lname";
  static final c_nationality = "nationality";
  static final c_passport_no = "passport_no";

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async{
    if( _database !=null)
      return _database;
    _database = await _initdatabase();
    return _database;
  }

  _initdatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);


  }

//
  Future _onCreate(Database db, int version) async{
    await db.execute(
        "CREATE TABLE $table ("
            "$c_user_id INTEGER PRIMARY KEY, "
            "$c_email TEXT, "
            "$c_password TEXT,"
            "$c_fname TEXT, "
            "$c_lname TEXT, "
            "$c_nationality TEXT, "
            "$c_passport_no TEXT)"
        );
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }
}
