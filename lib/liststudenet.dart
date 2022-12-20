import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_student/db/function/db_functions.dart';
import 'package:hive_student/db/function/model/data_model.dart';

class liststudent extends StatelessWidget {
  const liststudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: StudentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentlist, Widget? child) {
        return ListView.separated(
            itemBuilder: (context, index) {
              final data = studentlist[index];
              return ListTile(
                title: Text(data.name),
                subtitle: Text(data.age),
                trailing: IconButton(
                    onPressed: () {
                      if (data.id != null) {
                        DeleteStudent(data.id!);
                      } else {
                        log('student id is null unable to delete');
                      }
                    },
                    icon: Icon(Icons.delete)),
              );
            },
            separatorBuilder: (ctx, index) => Divider(),
            itemCount: studentlist.length);
      },
    );
  }
}
