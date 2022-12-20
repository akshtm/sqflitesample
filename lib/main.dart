import 'package:flutter/material.dart';
import 'package:hive_student/db/function/db_functions.dart';

import 'package:hive_student/db/function/model/data_model.dart';
import 'package:hive_student/student.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDatabase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: studentdetails());
  }
}
