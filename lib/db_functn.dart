import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../studentmodel.dart';

ValueNotifier<List<StudentModel>> studentlist = ValueNotifier([]);

late Database _db;

Future<void> initializeDataBase() async {
  _db = await openDatabase('student.db', version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
        'CREATE TABLE Student (id INTEGER PRIMARY KEY, name TEXT, age TEXT)');
  });
}

Future<void> onAddStudent(StudentModel value) async {
  await _db.rawInsert(
      'INSERT INTO Student (name,age) VALUES(?,?)', [value.name, value.age]);
  getAllStudent();
  // studentlist.value.add(value);
  // studentlist.notifyListeners();
}

Future<void> getAllStudent() async {
  final _values = await _db.rawQuery('SELECT * FROM Student');
  print(_values);

  studentlist.value.clear();
  _values.forEach((map) {
    final student = StudentModel.fromMap(map);

    studentlist.value.add(student);
    studentlist.notifyListeners();
  });
}

Future<void> deleteStudent(int id) async {
  _db.rawDelete('DELETE FROM Student WHERE id = ?', [id]);
  getAllStudent();
}