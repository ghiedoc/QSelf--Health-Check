import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "Database.db";
  static final _databaseVersion = 4;

//  PERSONAL INFO VARIABLE
  static final table_user = "user";
  static final c_user_id = "user_id";
  static final c_email = "email";
  static final c_password = "password";
  static final c_fname = "fname";
  static final c_lname = "lname";
  static final c_nationality = "nationality";
  static final c_passport_no = "passport_no";

//  CONTACT INFO VARIABLE
  static final table_contact_info = "table_contact_info";
  static final c_contact_id = "contact_id";
  static final c_contact_no = "contact_no";
  static final c_contact_emergency = "contact_emergency";
  static final c_quar_hotel = "quar_hotel";

//  TRAVEL INFO VARIABLE
  static final table_travel_info = "travel_info";
  static final c_travel_id = "travel_id";
  static final c_travel_departure_country = "departure_country";
  static final c_travel_arrival_date = "arrival_date";

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // PERSONAL INFO TABLE
  static Database _database;

  Future<Database> get database async {
    if (_database != null)
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

  Future _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $table_user ("
            "$c_user_id INTEGER PRIMARY KEY, "
            "$c_email TEXT, "
            "$c_password TEXT,"
            "$c_fname TEXT, "
            "$c_lname TEXT, "
            "$c_nationality TEXT, "
            "$c_passport_no TEXT)"
    );
    await db.execute(
        "CREATE TABLE $table_contact_info ("
            "$c_contact_id INTEGER PRIMARY KEY, "
            "$c_contact_no TEXT,"
            "$c_contact_emergency,"
            "$c_quar_hotel TEXT,"
            "$c_user_id INTEGER,"
            "FOREIGN KEY ($c_user_id) REFERENCES $table_user ($c_user_id))"
    );
    await db.execute(
      "CREATE TABLE $table_travel_info ("
          "$c_travel_id INTEGER PRIMARY KEY, "
          "$c_travel_departure_country, TEXT,"
          "$c_travel_arrival_date, DATE,"
          "$c_user_id, INTEGER,"
          "FOREIGN KEY ($c_user_id) REFERENCES $table_user ($c_user_id))"

    );
  }

  Future<int> submitTravel(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table_travel_info, row);
  }


  Future<int> submit(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table_contact_info, row);
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table_user, row);
  }
}

