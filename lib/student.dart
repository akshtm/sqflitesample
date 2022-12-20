import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_student/addstudent.dart';
import 'package:hive_student/db/function/db_functions.dart';
import 'package:hive_student/liststudenet.dart';

class studentdetails extends StatelessWidget {
  const studentdetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllstudents();
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [addstudent(), Expanded(child: liststudent())],
    )));
  }
}
