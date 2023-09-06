import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:note/task_type_item_widget.dart';
import 'package:note/utility.dart';
import 'package:time_pickerr/time_pickerr.dart';

class EditTaskScreen extends StatefulWidget {
  EditTaskScreen({super.key, required this.task});
  Task task;

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  TextEditingController? Controller_Tasktitle;
  TextEditingController? Controller_Subtitle;
  var Box = Hive.box<Task>('taskBox');
  FocusNode myfocusnode = FocusNode();
  FocusNode myfocusnode1 = FocusNode();
  DateTime? _time;
  int SelectedTaskTypeItem = 0;

  @override
  void initState() {
    super.initState();
    Controller_Subtitle = TextEditingController(text: widget.task.subtitle);
    Controller_Tasktitle = TextEditingController(text: widget.task.title);
    myfocusnode.addListener(() {
      setState(() {});
    });
    myfocusnode1.addListener(() {
      setState(() {});
    });
    var Index = getTaskTypeList().indexWhere(
        (element) => element.taskTypeEnum == widget.task.taskType.taskTypeEnum);
    SelectedTaskTypeItem = Index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44),
                  child: TextField(
                    controller: Controller_Tasktitle,
                    focusNode: myfocusnode,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'GB',
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
                      labelText: 'عنوان تسک',
                      labelStyle: TextStyle(
                        color: myfocusnode.hasFocus
                            ? Color(0xff18DAA3)
                            : Colors.grey,
                        fontSize: 20,
                        fontFamily: 'SM',
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 3,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xff18DAA3),
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44),
                  child: TextField(
                    controller: Controller_Subtitle,
                    maxLines: 2,
                    focusNode: myfocusnode1,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'GB',
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
                      labelText: 'توضیحات تسک',
                      labelStyle: TextStyle(
                        color: myfocusnode1.hasFocus
                            ? Color(0xff18DAA3)
                            : Colors.grey,
                        fontSize: 20,
                        fontFamily: 'SM',
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 3,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xff18DAA3),
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ),
                CustomHourPicker(
                  title: 'زمان تسک را انتخاب کن',
                  negativeButtonText: 'حذف کن',
                  positiveButtonText: 'انتخاب کن',
                  negativeButtonStyle: TextStyle(
                    color: Colors.red,
                  ),
                  titleStyle: TextStyle(
                    color: Color(0xff18daa3),
                  ),
                  positiveButtonStyle: TextStyle(
                    color: Color(0xff18daa3),
                  ),
                  elevation: 5,
                  onNegativePressed: (context) {},
                  onPositivePressed: (context, time) {
                    _time = time;
                  },
                ),
                Container(
                  height: 190,
                  child: ListView.builder(
                    itemCount: getTaskTypeList().length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            SelectedTaskTypeItem = index;
                          });
                        },
                        child: TaskTypItemList(
                          taskType: getTaskTypeList()[index],
                          index: index,
                          SelectedTaskTypeItem: SelectedTaskTypeItem,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff18DAA3),
                    minimumSize: Size(200, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    String TaskTitle = Controller_Tasktitle!.text;
                    String TaskSubTitle = Controller_Subtitle!.text;
                    EditTask(TaskTitle, TaskSubTitle);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ویرایش کردن تسک',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void EditTask(String TaskTitle, String TaskSubTitle) {
    widget.task.title = TaskTitle;
    widget.task.subtitle = TaskSubTitle;
    widget.task.time = _time!;
    widget.task.taskType = getTaskTypeList()[SelectedTaskTypeItem];

    widget.task.save();
  }
}
