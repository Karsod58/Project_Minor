import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> getPrediction(Map<String, int> marks) async {
  final url = Uri.parse(' http://localhost:3000/predictroute');

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: json.encode(marks),
  );

  if (response.statusCode == 200) {
    final result = json.decode(response.body);
    print("Predicted Field: ${result['predicted_field']}");
    print("Confidence: ${result['confidence']}");
  } else {
    print("Error: ${response.body}");
  }
}
