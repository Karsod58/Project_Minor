import 'package:flutter/material.dart';
import 'package:minor_project/pages/dashboard_page.dart';
import 'pages/login_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './pages/student_marks.dart'; // import your model
import 'pages/teachers_login.dart';
import './pages/marks_input_page.dart';
import './pages/teacher_signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(StudentMarksAdapter());
  await Hive.openBox('teachers'); // for login/signup
  await Hive.openBox<StudentMarks>('students');
  runApp(ResultManagementApp());
}

class ResultManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Result Management System',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: TeacherSignUpPage(), // Use the signup page as the home page
      routes: {
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(), // Add your dashboard page here
        '/marks_input':
            (context) => MarksEntryPage(), // Add your marks entry page here
      }, // Use the login page as the home page
      debugShowCheckedModeBanner: false,
    );
  }
}
