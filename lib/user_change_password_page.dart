import 'package:flutter/material.dart';

class UserChangePasswordPage extends StatefulWidget {
  UserChangePasswordPage({super.key});

  @override
  _UserChangePasswordPageState createState() => _UserChangePasswordPageState();
}

class _UserChangePasswordPageState extends State<UserChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _reNewPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _hasMinLength = false;
  bool _hasUppercase = false;
  bool _hasLowercase = false;
  bool _hasNumber = false;
  bool _hasSpecialChar = false;

  @override
  void initState() {
    super.initState();
    _newPasswordController.addListener(_validatePassword);
  }

  void _validatePassword() {
    final password = _newPasswordController.text;
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
    _newPasswordController.dispose();
    _currentPasswordController.dispose();
    _reNewPasswordController.dispose();
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
        title: const Text(
          'Change Password',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              TextFormField(
                controller: _currentPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Current Password',
                  hintText: 'Enter your current password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your current password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _newPasswordController,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  hintText: 'Create a new password',
                  border: const OutlineInputBorder(),
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
                    return 'Please create a new password';
                  }
                  if (!_hasMinLength || !_hasUppercase || !_hasLowercase || !_hasNumber || !_hasSpecialChar) {
                    return 'Password does not meet all requirements';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _reNewPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Re-enter new Password',
                  hintText: 'Re-enter the newly created password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please re-enter the password';
                  }
                  if (value != _newPasswordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle form submission
                  }
                },
                child: const Text('Change Password'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
