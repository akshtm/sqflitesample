import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_student/db/function/db_functions.dart';
import 'package:hive_student/db/function/model/data_model.dart';

class addstudent extends StatelessWidget {
  addstudent({Key? key}) : super(key: key);
  final _namecontroller = TextEditingController();
  final _agecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _namecontroller,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Name'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _agecontroller,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Age'),
          ),
          ElevatedButton.icon(
              onPressed: () {
                onAddStudentButtonClicked();
              },
              icon: Icon(Icons.add),
              label: const Text('Add Student'))
        ],
      ),
    );
  }

  Future<void> onAddStudentButtonClicked() async {
    final _name = _namecontroller.text.trim();
    final _age = _agecontroller.text.trim();

    if (_name.isEmpty || _age.isEmpty) {
      return;
    }
    print('Printing before add to list$_name $_age');
    final _student = StudentModel(name: _name, age: _age);
    adddstudent(_student);
  }
}
