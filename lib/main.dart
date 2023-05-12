import 'package:flutter/material.dart';
import 'package:taskmanager/views/entry.dart';
import 'package:taskmanager/views/login.dart';
import 'package:taskmanager/views/register.dart';
import 'package:taskmanager/views/taskadd.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Task Manager',
      home: RegisterPage(),
    );
  }
}
