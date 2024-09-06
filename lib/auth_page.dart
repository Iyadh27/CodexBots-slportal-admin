import 'package:admin_panel/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  bool _isSignup = false;

  // Temporary storage for demo purposes
  Map<String, String> _users = {};

  void _toggleForm() {
    setState(() {
      _isSignup = !_isSignup;
    });
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_isSignup) {
        if (_users.containsKey(_username)) {
          _showMessage('Username already exists!');
        } else {
          _users[_username] = _password;
          _showMessage('Signup successful! Please login.');
          _toggleForm();
        }
      } else {
        if (_users[_username] == _password) {
          _showMessage('Login successful!');
          Navigator.pushReplacement(context, 
                      MaterialPageRoute(builder: (BuildContext context) => HomePage()),           );
        } else {
          _showMessage('Invalid username or password!');
        }
      }
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isSignup ? 'Signup' : 'Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
                onSaved: (value) => _username = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text(_isSignup ? 'Signup' : 'Login'),
              ),
              TextButton(
                onPressed: _toggleForm,
                child: Text(
                  _isSignup
                      ? 'Already have an account? Login'
                      : 'Don\'t have an account? Signup',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
