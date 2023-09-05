import 'package:note/enum_type.dart';
import 'package:note/task_type.dart';

List<TaskType> getTaskTypeList() {
  var list = [
    TaskType(
      image: 'images/meditate.png',
      title: 'تمرکز',
      taskTypeEnum: TaskTypeEnum.foucos,
    ),
    TaskType(
      image: 'images/social_friends.png',
      title: 'میتینگ',
      taskTypeEnum: TaskTypeEnum.date,
    ),
    TaskType(
      image: 'images/hard_working.png',
      title: 'کار زیاد',
      taskTypeEnum: TaskTypeEnum.Workind,
    ),
    TaskType(
      image: 'images/workout.png',
      title: 'ورزش',
      taskTypeEnum: TaskTypeEnum.sport,
    ),
  ];
  return list;
}
