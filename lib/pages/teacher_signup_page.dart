import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:minor_project/pages/login_page.dart';
import 'package:minor_project/pages/teachers_login.dart';

class TeacherSignUpPage extends StatefulWidget {
  @override
  _TeacherSignUpPageState createState() => _TeacherSignUpPageState();
}

class _TeacherSignUpPageState extends State<TeacherSignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _saveTeacher() async {
    if (_formKey.currentState!.validate()) {
      final box = Hive.box('teachers');
      box.add({
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
        'password':
            _passwordController.text.trim(), // (store hashed in production)
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Teacher Registered Successfully!')),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherLoginPage()));

      _nameController.clear();
      _emailController.clear();
      _passwordController.clear();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Teacher Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator:
                    (value) => value!.isEmpty ? 'Please enter your name' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator:
                    (value) =>
                        value!.isEmpty ? 'Please enter your email' : null,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
                validator:
                    (value) =>
                        value!.length < 6
                            ? 'Minimum 6 characters required'
                            : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _saveTeacher, child: Text("Sign Up")),
            ],
          ),
        ),
      ),
    );
  }
}
