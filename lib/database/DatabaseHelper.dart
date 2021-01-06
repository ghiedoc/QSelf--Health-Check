import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static final _databaseName = "Database.db";
  static final _databaseVersion = 1;
  static final table = "user";
  static final c_user_id = "user_id";
//  static final c__fname = "fname";
//  static final c_lname = "lname";
//  static final c_nationality = "nationality";
//  static final c_passport_no = "passoport_no";
  static final c_email = "email";
  static final c_password = "password";

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
//  $c__fname TEXT NOT NULL,
//      $c_lname TEXT NOT NULL,
//  $c_nationality TEXT NOT NULL,
//      $c_passport_no TEXT NOT NULL

  Future _onCreate(Database db, int version) async{
    await db.execute('''
          CREATE TABLE $table (
            $c_user_id INTEGER PRIMARY KEY,
            $c_email TEXT NOT NULL,
            $c_password TEXT NOT NULL
          )
          ''');
  }
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

//  Future<int> insert(Map<String, dynamic> row) async {
//    Database db = await instance.database;
//    return await db.insert(table, row);
//  }
}
