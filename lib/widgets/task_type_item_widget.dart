import 'package:flutter/material.dart';
import 'package:note/data/task_type.dart';

class TaskTypItemList extends StatefulWidget {
  TaskTypItemList(
      {super.key,
      required this.taskType,
      required this.SelectedTaskTypeItem,
      required this.index});
  TaskType taskType;
  int SelectedTaskTypeItem;
  int index;

  @override
  State<TaskTypItemList> createState() => _TaskTypItemListState();
}

class _TaskTypItemListState extends State<TaskTypItemList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: (widget.SelectedTaskTypeItem == widget.index) ? 15 : 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      shadowColor: Colors.green,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: (widget.SelectedTaskTypeItem == widget.index)
                ? Colors.green
                : Colors.grey,
            width: (widget.SelectedTaskTypeItem == widget.index) ? 3 : 2,
          ),
        ),
        width: 140,
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Image.asset(widget.taskType.image),
            Text(widget.taskType.title),
          ],
        ),
      ),
    );
  }
}
