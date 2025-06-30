import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PredictionPage extends StatefulWidget {
  @override
  _PredictionPageState createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  final _formKey = GlobalKey<FormState>();
  final _controllers = List.generate(6, (_) => TextEditingController());
  String? _prediction;

  Future<void> _predictField() async {
    final url = Uri.parse('http://<YOUR_IP>:<PORT>/predict'); // replace with your backend URL

    final marks = {
      'math': int.parse(_controllers[0].text),
      'physics': int.parse(_controllers[1].text),
      'chemistry': int.parse(_controllers[2].text),
      'biology': int.parse(_controllers[3].text),
      'cs': int.parse(_controllers[4].text),
      'english': int.parse(_controllers[5].text),
    };

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(marks),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _prediction = data['field']; // must match what backend sends
      });
    } else {
      setState(() {
        _prediction = 'Prediction failed. Try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Field Prediction")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ...['Math', 'Physics', 'Chemistry', 'Biology', 'CS', 'English']
                  .asMap()
                  .entries
                  .map((entry) => TextFormField(
                        controller: _controllers[entry.key],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: entry.value),
                        validator: (val) =>
                            val == null || val.isEmpty ? 'Required' : null,
                      )),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) _predictField();
                },
                child: Text("Predict Field"),
              ),
              if (_prediction != null) ...[
                SizedBox(height: 20),
                Text("Predicted Field: $_prediction",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
