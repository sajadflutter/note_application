import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note/add_task_screen.dart';
import 'package:note/enum_type.dart';
import 'package:note/home_screen.dart';
import 'package:note/task.dart';
import 'package:note/task_type.dart';
import 'package:note/test.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(TaskTypeAdapter());
  Hive.registerAdapter(TaskTypeEnumAdapter());
  await Hive.openBox<Task>('taskBox');

  runApp(mainscreen());
}

class mainscreen extends StatelessWidget {
  const mainscreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'SM',
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
