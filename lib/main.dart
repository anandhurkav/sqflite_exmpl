import 'package:flutter/material.dart';
import 'package:sqflite_exmpl/db_functn.dart';
import 'package:sqflite_exmpl/screens/homescreen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDataBase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen());
  }
}