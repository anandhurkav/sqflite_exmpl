import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sqflite_exmpl/db_functn.dart';
import 'package:sqflite_exmpl/screens/addscreen.dart';
import 'package:sqflite_exmpl/screens/listadd.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudent();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [AddScreen(), Expanded(child: ListStudent())],
        ),
      ),
    );
  }
}