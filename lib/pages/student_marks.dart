import 'package:hive/hive.dart';

part 'student_marks.g.dart'; // this will be auto-generated

@HiveType(typeId: 0)
class StudentMarks extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String fatherName;

  @HiveField(2)
  String studentClass;

  @HiveField(3)
  String section;

  @HiveField(4)
  String rollNo;

  @HiveField(5)
  String session;

  @HiveField(6)
  Map<String, Map<String, String>> firstTermMarks; // Subject -> (Test -> Marks)

  @HiveField(7)
  Map<String, Map<String, String>> secondTermMarks;

  @HiveField(8)
  String attendance;

  @HiveField(9)
  String discipline;

  @HiveField(10)
  String punctuality;

  @HiveField(11)
  String remarks;

  StudentMarks({
    required this.name,
    required this.fatherName,
    required this.studentClass,
    required this.section,
    required this.rollNo,
    required this.session,
    required this.firstTermMarks,
    required this.secondTermMarks,
    required this.attendance,
    required this.discipline,
    required this.punctuality,
    required this.remarks,
  });
}
