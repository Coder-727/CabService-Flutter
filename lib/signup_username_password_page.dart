import 'package:cab_cris/signup_driver_info_page.dart';
import 'package:flutter/material.dart';
import 'signup_user_info_page.dart'; // Assuming you have created SignupUserInfoPage
import 'user_service.dart'; // Assuming you have created UserService

class SignupUsernamePasswordPage extends StatefulWidget {
  final String phoneNumber;

  const SignupUsernamePasswordPage({required this.phoneNumber, Key? key}) : super(key: key);

  @override
  _SignupUsernamePasswordPageState createState() => _SignupUsernamePasswordPageState();
}

class _SignupUsernamePasswordPageState extends State<SignupUsernamePasswordPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _hasMinLength = false;
  bool _hasUppercase = false;
  bool _hasLowercase = false;
  bool _hasNumber = false;
  bool _hasSpecialChar = false;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_validatePassword);
  }

  void _validatePassword() {
    final password = _passwordController.text;
    setState(() {
      _hasMinLength = password.length >= 8;
      _hasUppercase = password.contains(RegExp(r'[A-Z]'));
      _hasLowercase = password.contains(RegExp(r'[a-z]'));
      _hasNumber = password.contains(RegExp(r'[0-9]'));
      _hasSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _buildConstraintItem(String text, bool isValid) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check : Icons.close,
          color: isValid ? Colors.green : Colors.red,
          size: 20,
        ),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up - Username & Password'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create your account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                obscureText: !_isPasswordVisible,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (!_hasMinLength || !_hasUppercase || !_hasLowercase || !_hasNumber || !_hasSpecialChar) {
                    return 'Password does not meet the requirements';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const Text(
                'Password must contain:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              _buildConstraintItem('At least 8 characters', _hasMinLength),
              _buildConstraintItem('At least one uppercase letter', _hasUppercase),
              _buildConstraintItem('At least one lowercase letter', _hasLowercase),
              _buildConstraintItem('At least one number', _hasNumber),
              _buildConstraintItem('At least one special character', _hasSpecialChar),
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignupUserInfoPage(
                          phoneNumber: widget.phoneNumber,
                          username: _usernameController.text,
                          password: _passwordController.text,
                        ),
                      ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Sign Up'),
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignUpDriverInfoPage(
                          phoneNumber: widget.phoneNumber,
                          username: _usernameController.text,
                          password: _passwordController.text,
                        ),
                      ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Sign Up as Driver'),
                ),
              ),
            ],
          ),
        ),
        
      ),
    );
  }
  
}
