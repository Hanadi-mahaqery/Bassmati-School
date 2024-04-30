import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../models/StudentModel.dart';
class SQL_Helper {
  static SQL_Helper? dbHelper;
  static Database? _database;

  SQL_Helper._createInstance();

  factory SQL_Helper() {
    dbHelper ??= SQL_Helper._createInstance();
    return dbHelper as SQL_Helper;
  }

  Future<Database> get database async {
    _database ??= await initializedDatabase();
    return _database as Database;
  }


  Future<Database> initializedDatabase() async {
    int dbver =1;
    final dbFolder = await getExternalStorageDirectory();
    final dbPath = p.join(dbFolder!.path, "Database");
    Directory dbFolderDir = await Directory(dbPath).create();
    final file = File(p.join(dbFolderDir.path, 'ٍSchool.db'));
    var schoolDB = await openDatabase(
      file.path,
      version: dbver,
      onCreate: createDatabase,
      //onUpgrade: upgradeDatabase,
      //onDowngrade: downgradeDatabase
      //onDowngrade: ()
    );
    return schoolDB;
  }


  List<Map<String, dynamic>> tablesNameList = [
    {'name': 'Doctor' ,
      'sql': 'CREATE TABLE Doctor(Id INTEGER PRIMARY KEY, Name TEXT, Img TEXT, DeptId INTEGER)'
    },

    {'name': 'Drugs' ,
      'sql': 'CREATE TABLE Drugs(Id INTEGER PRIMARY KEY, Name TEXT,className TEXT, Price INTEGER)'
    },

    {'name': 'Depts' ,
      'sql': 'CREATE TABLE Depts(Id INTEGER PRIMARY KEY, Name TEXT)'
    }
  ];

  String studentTbl = 'CREATE TABLE Students(Id INTEGER PRIMARY KEY, Name TEXT, Age INTEGER)';
  String teacherTbl = 'CREATE TABLE Teachers(Id INTEGER PRIMARY KEY, Name TEXT, Salary REAL, Details TEXT)';
  String subjectTbl = 'CREATE TABLE Subjects(Id INTEGER PRIMARY KEY, Name TEXT, TeacherId INTEGER, Details TEXT)';

  void createDatabase(Database db, int version) async {
    try {
      await db.execute(studentTbl);
      await db.execute(teacherTbl);
      await db.execute(subjectTbl);
      for (int i = 0; i < tablesNameList.length; i++) {
        await db.execute(tablesNameList[i]["sql"]);
      }

    }
    catch(e){
      print("CreateExp:- "+ e.toString());
    }
  }
  void upgradeDatabase(Database db, oldVersion, newVersion) async {
    if (oldVersion < newVersion) {
      // await db.execute(sql)
    }
  }
  void downgradeDatabase(db, oldVersion, newVersion) async {
    if (oldVersion >= newVersion) {
      try {

      }
      catch (e) {
        print("CreateExp:- " + e.toString());
      }
    }
  }



  Future<int> insertStudent(StudentModel obj)async{
    Database db = await database;
    var res = await db.insert("Students", obj.toJson());
    return res;
  }


  Future<int> insert(String tbl, Map<String, dynamic> obj)async{
    try {
      Database db = await database;
      var res = await db.insert(tbl, obj );
      return res;
    } on Exception catch (e) {
      print("EXP in Insert : ${e}");
      return 0;
    }
  }

  Future<List<Map<String, dynamic>>> getAll(String tbl) async{
    await Future.delayed(Duration(milliseconds: 500));
    Database db = await database;
    var res = await db.query(tbl);
    return res;
  }
}
