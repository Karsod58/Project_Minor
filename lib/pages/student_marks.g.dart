// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_marks.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentMarksAdapter extends TypeAdapter<StudentMarks> {
  @override
  final int typeId = 0;

  @override
  StudentMarks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentMarks(
      name: fields[0] as String,
      fatherName: fields[1] as String,
      studentClass: fields[2] as String,
      section: fields[3] as String,
      rollNo: fields[4] as String,
      session: fields[5] as String,
      firstTermMarks: (fields[6] as Map).map((dynamic k, dynamic v) =>
          MapEntry(k as String, (v as Map).cast<String, String>())),
      secondTermMarks: (fields[7] as Map).map((dynamic k, dynamic v) =>
          MapEntry(k as String, (v as Map).cast<String, String>())),
      attendance: fields[8] as String,
      discipline: fields[9] as String,
      punctuality: fields[10] as String,
      remarks: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StudentMarks obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.fatherName)
      ..writeByte(2)
      ..write(obj.studentClass)
      ..writeByte(3)
      ..write(obj.section)
      ..writeByte(4)
      ..write(obj.rollNo)
      ..writeByte(5)
      ..write(obj.session)
      ..writeByte(6)
      ..write(obj.firstTermMarks)
      ..writeByte(7)
      ..write(obj.secondTermMarks)
      ..writeByte(8)
      ..write(obj.attendance)
      ..writeByte(9)
      ..write(obj.discipline)
      ..writeByte(10)
      ..write(obj.punctuality)
      ..writeByte(11)
      ..write(obj.remarks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentMarksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
