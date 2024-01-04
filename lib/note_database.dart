import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'model.dart';

class DatabaseHelper {
 static Database? _database;

 Future<Database?> get database async{
   if (_database != null) {
     return _database;
   }
   _database = await initDatabase();
   return _database;

 }

 initDatabase() async {
io.Directory documentDirectory = await getApplicationDocumentsDirectory();
String path = join(documentDirectory.path, "notes.db");
var db = await openDatabase(path, version: 1, onCreate: _onCreate);
return db;
 }

 _onCreate(Database db , int version) async {
   await db.execute(
      " CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT,name STRING NOT NULL,age INTEGER NOT NULL,email STRING NOT NULL )"
   );
 }

 Future<Person> insert(Person person) async {
   var dbClient = await database;
   await dbClient!.insert("notes", person.toMap());
   return person;
 }

}
