import 'package:flutter/material.dart';
import 'marks_input_page.dart';
import 'prediction_page.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Dashboard")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Upload Marks"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => MarksEntryPage()));
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("View Predicted Field"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => PredictionPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
