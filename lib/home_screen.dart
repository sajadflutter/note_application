import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note/add_task_screen.dart';
import 'package:note/task.dart';
import 'package:note/task_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var taskbox = Hive.box<Task>('taskBox');
  bool IsFabVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: taskbox.listenable(),
          builder: (context, value, child) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                setState(() {
                  if (notification.direction == ScrollDirection.forward) {
                    IsFabVisible = true;
                  }
                  if (notification.direction == ScrollDirection.reverse) {
                    IsFabVisible = false;
                  }
                });
                return true;
              },
              child: ListView.builder(
                itemCount: taskbox.values.length,
                itemBuilder: (BuildContext context, int index) {
                  var task = taskbox.values.toList()[index];
                  return getTaskWidget(task);
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: Visibility(
        visible: IsFabVisible,
        child: FloatingActionButton(
          backgroundColor: Color(0xff18DAA3),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AddTaskScreen();
            }));
          },
          child: Image.asset(
            'images/icon_add.png',
          ),
        ),
      ),
    );
  }

  Widget getTaskWidget(Task task) {
    return Dismissible(
      onDismissed: (Dismissible) {
        task.delete();
      },
      key: UniqueKey(),
      child: TaskWidget(task: task),
    );
  }
}
