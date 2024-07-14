import 'package:flutter/material.dart';
import 'user_service.dart'; // Assuming you have created UserService

class SignUpDriverInfoPage extends StatefulWidget {
  final String phoneNumber;
  final String username;
  final String password;

  const SignUpDriverInfoPage({
    required this.phoneNumber,
    required this.username,
    required this.password,
    Key? key,
  }) : super(key: key);

  @override
  _SignUpDriverInfoPageState createState() => _SignUpDriverInfoPageState();
}

class _SignUpDriverInfoPageState extends State<SignUpDriverInfoPage> {
  final _nameController = TextEditingController();
  final _genderController = TextEditingController();
  final _employeeIdController = TextEditingController();
  final _designationController = TextEditingController();
  final _carModelController = TextEditingController();
  final _licensePlateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _signUp() async {
    if (_formKey.currentState?.validate() ?? false) {
      Map<String, dynamic> userData = {
        'username': widget.username,
        'password': widget.password,
        'phone': widget.phoneNumber,
        'name': _nameController.text,
        'gender': _genderController.text,
        'employeeid': _employeeIdController.text,
        'designation': _designationController.text,
        'is_driver': true,
        'car_model': _carModelController.text.isEmpty ? null : _carModelController.text,
        'license_plate': _licensePlateController.text.isEmpty ? null : _licensePlateController.text,
      };

      try {
        print(userData); // Log the data being sent
        await UserService().addUser(userData);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User signed up successfully')),
        );
        Navigator.popUntil(context, (route) => route.isFirst);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to sign up user: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _genderController.dispose();
    _employeeIdController.dispose();
    _designationController.dispose();
    _carModelController.dispose();
    _licensePlateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up - Driver Info'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Please fill in your details:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _genderController,
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your gender';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _designationController,
                  decoration: InputDecoration(
                    labelText: 'Designation',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your designation';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _employeeIdController,
                  decoration: InputDecoration(
                    labelText: 'Employee ID',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Employee ID';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _carModelController,
                  decoration: InputDecoration(
                    labelText: 'Car Model',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    return null; // Optional field
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _licensePlateController,
                  decoration: InputDecoration(
                    labelText: 'License Plate',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    return null; // Optional field
                  },
                ),
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                    onPressed: _signUp,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
