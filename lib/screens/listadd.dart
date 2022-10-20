import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sqflite_exmpl/db_functn.dart';

import '../studentmodel.dart';

class ListStudent extends StatelessWidget {
  const ListStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentlist,
      builder:
          (BuildContext context, List<StudentModel> student, Widget? child) {
        return ListView.separated(
            itemBuilder: (context, index) {
              final data = student[index];
              return ListTile(
                title: Text(data.name),
                subtitle: Text(data.age),
                trailing: IconButton(
                    onPressed: () {
                      deleteStudent(data.id!);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: student.length);
      },
    );
  }
}