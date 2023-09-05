import 'package:hive/hive.dart';
part 'enum_type.g.dart';

@HiveType(typeId: 5)
enum TaskTypeEnum {
  @HiveField(0)
  Workind,
  @HiveField(1)
  date,
  @HiveField(2)
  sport,
  @HiveField(3)
  foucos,
}
