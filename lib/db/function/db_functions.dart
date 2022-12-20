import 'dart:developer';

import 'package:flutter/cupertino.dart';

import 'package:hive_student/db/function/model/data_model.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<StudentModel>> StudentListNotifier = ValueNotifier([]);
late Database _db;
Future<void> initializeDatabase() async {
  _db = await openDatabase('student.db', version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(
        'CREATE TABLE student (id INTEGER PRIMARY KEY, name TEXT, age TEXT)');
  });
}

Future<void> adddstudent(StudentModel value) async {
  await _db.rawInsert(
      'INSERT INTO student (name,age) VALUES(?,?)', [value.name, value.age]);
  getAllstudents();
  // StudentListNotifier.value.add(value);
  // StudentListNotifier.notifyListeners();
}

Future<void> getAllstudents() async {
  final _values = await _db.rawQuery('SELECT * FROM student');
  print(_values);
  StudentListNotifier.value.clear();
  _values.forEach((map) {
    final student = StudentModel.fromMap(map);
    StudentListNotifier.value.add(student);
    StudentListNotifier.notifyListeners();
  });
  // StudentListNotifier.value.addAll(studentdb.values);
}

Future<void> DeleteStudent(int id) async {
  final count = await _db.rawDelete('DELETE FROM student WHERE id = ?', [id]);
  assert(count == 1);
  getAllstudents();
  StudentListNotifier.notifyListeners();
}
