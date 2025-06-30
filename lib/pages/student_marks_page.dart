import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class StudentMarksPage extends StatelessWidget {
  final String studentId; // or you can use studentName

  const StudentMarksPage({Key? key, required this.studentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final marksBox = Hive.box('marks');

    // Filter records for the specific student
    final studentMarks = marksBox.values.where((mark) =>
        mark['student_id'] == studentId).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Your Marks')),
      body: studentMarks.isEmpty
          ? Center(child: Text('No marks found.'))
          : ListView.builder(
              itemCount: studentMarks.length,
              itemBuilder: (context, index) {
                final mark = studentMarks[index];

                return Card(
                  margin: EdgeInsets.all(12),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Student ID: ${mark['student_id']}", style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text("Math: ${mark['math']}"),
                        Text("Physics: ${mark['physics']}"),
                        Text("Chemistry: ${mark['chemistry']}"),
                        Text("Biology: ${mark['biology']}"),
                        Text("English: ${mark['english']}"),
                        Text("CS: ${mark['cs']}"),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
