import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sqflite_exmpl/db_functn.dart';
import 'package:sqflite_exmpl/studentmodel.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});

  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
                hintText: 'Name', border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _ageController,
            decoration: const InputDecoration(
                hintText: 'Age', border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
              onPressed: () {
                onButtonClicked();
              },
              icon: const Icon(Icons.add),
              label: const Text('Add'))
        ],
      ),
    );
  }

  Future<void> onButtonClicked() async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();

    if (_name.isEmpty || _age.isEmpty) {
      return;
    }
    // print('$_name,$_age');
    onAddStudent(StudentModel(name: _name, age: _age));
  }
}