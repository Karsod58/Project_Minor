import 'package:flutter/material.dart';

class MarksEntryPage extends StatefulWidget {
  @override
  _MarksEntryPageState createState() => _MarksEntryPageState();
}

class _MarksEntryPageState extends State<MarksEntryPage> {
  final _formKey = GlobalKey<FormState>();

  // Student Info Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController sectionController = TextEditingController();
  final TextEditingController rollNoController = TextEditingController();
  final TextEditingController sessionController = TextEditingController();

  // Footer Controllers
  final TextEditingController attendanceController = TextEditingController();
  final TextEditingController disciplineController = TextEditingController();
  final TextEditingController punctualityController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();

  // Subjects List
  final List<String> subjects = [
    "Punjabi",
    "English",
    "Computer Science",
    "Environment Edu.",
    "Physics/ Eng. Liter.",
    "Chemistry/ Pbi. Liter.",
    "Mathematics",
    "Biology/ Economics",
    "Accounts",
    "B. Studies/History",
    "Sociology",
    "Pol. Science",
    "E. Business",
    "MOP/Physical Edu.",
    "Welcome Life",
    "ENS",
  ];

  // Marks Data Structure
  Map<String, Map<String, TextEditingController>> firstTermControllers = {};
  Map<String, Map<String, TextEditingController>> secondTermControllers = {};

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    for (var subject in subjects) {
      firstTermControllers[subject] = {
        '1st Unit Test': TextEditingController(),
        '2nd Unit Test': TextEditingController(),
        '3rd Unit Test': TextEditingController(),
        'Written': TextEditingController(),
        'Oral': TextEditingController(),
      };
      secondTermControllers[subject] = {
        '1st Unit Test': TextEditingController(),
        '2nd Unit Test': TextEditingController(),
        '3rd Unit Test': TextEditingController(),
        'Written': TextEditingController(),
        'Oral': TextEditingController(),
      };
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    fatherNameController.dispose();
    classController.dispose();
    sectionController.dispose();
    rollNoController.dispose();
    sessionController.dispose();
    attendanceController.dispose();
    disciplineController.dispose();
    punctualityController.dispose();
    remarksController.dispose();
    for (var map in [firstTermControllers, secondTermControllers]) {
      map.values.forEach((marks) {
        marks.values.forEach((controller) => controller.dispose());
      });
    }
    super.dispose();
  }

  Widget buildStudentInfoSection() {
    return Column(
      children: [
        _buildTextField(nameController, "Name"),
        _buildTextField(fatherNameController, "Father's Name"),
        _buildTextField(classController, "Class"),
        _buildTextField(sectionController, "Section"),
        _buildTextField(rollNoController, "Roll No"),
        _buildTextField(sessionController, "Session"),
      ],
    );
  }

  Widget buildTermSection(String termTitle, Map<String, Map<String, TextEditingController>> termControllers) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(termTitle, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Table(
          border: TableBorder.all(),
          columnWidths: {
            0: FixedColumnWidth(120),
          },
          children: [
            TableRow(
              decoration: BoxDecoration(color: Colors.grey[300]),
              children: [
                _buildTableCell('Subject', isHeader: true),
                _buildTableCell('1st UT', isHeader: true),
                _buildTableCell('2nd UT', isHeader: true),
                _buildTableCell('3rd UT', isHeader: true),
                _buildTableCell('Written', isHeader: true),
                _buildTableCell('Oral', isHeader: true),
              ],
            ),
            ...subjects.map((subject) {
              return TableRow(
                children: [
                  _buildTableCell(subject),
                  ...['1st Unit Test', '2nd Unit Test', '3rd Unit Test', 'Written', 'Oral'].map(
                    (field) => _buildMarksField(termControllers[subject]![field]!),
                  ),
                ],
              );
            }).toList(),
          ],
        ),
      ],
    );
  }

  Widget buildFooterSection() {
    return Column(
      children: [
        _buildTextField(attendanceController, "Attendance"),
        _buildTextField(disciplineController, "Discipline"),
        _buildTextField(punctualityController, "Punctuality"),
        _buildTextField(remarksController, "Remarks"),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildMarksField(TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(border: OutlineInputBorder()),
      ),
    );
  }

  Widget _buildTableCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(fontWeight: isHeader ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Marks Entry")),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            buildStudentInfoSection(),
            SizedBox(height: 20),
            buildTermSection("First Term", firstTermControllers),
            SizedBox(height: 20),
            buildTermSection("Second Term", secondTermControllers),
            SizedBox(height: 20),
            buildFooterSection(),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Submit"),
              onPressed: () {
                // TODO: Process data
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Marks submitted successfully")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
