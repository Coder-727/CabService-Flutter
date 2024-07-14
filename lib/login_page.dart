import 'dart:convert';
import 'package:cab_cris/driver_home_page.dart';
import 'package:cab_cris/forgot_password_page.dart';
import 'package:cab_cris/signup_phone_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cab_cris/user_home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  Future<void> _authenticateUser(String username, String password) async {
    const String baseUrl = 'http://10.0.2.2:8000/users/authenticate/';

    try {
      final Map<String, String> body = {
        'username': username,
        'password': password,
      };

      final response = await http.post(
        Uri.parse(baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final bool isDriver = responseData['is_driver'];

        // Navigate to the appropriate home page based on is_driver value
        if (isDriver) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const DriverHomePage(),
          ));
        } else {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const UserHomePage(),
          ));
        }
      } else {
        print('Error: ${response.statusCode}, ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid username or password: ${response.body}'),
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error occurred! Please try again later.'),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cab Service CRIS',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 2,
                ),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter your username',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
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
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(double.infinity, 30),
                      padding: const EdgeInsets.all(16),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final username = _usernameController.text;
                        final password = _passwordController.text;
                        _authenticateUser(username, password);
                      }
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    GestureDetector(
                      child: const Text('Forgot Password?'),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ForgotPasswordPage()));
                      },
                    ),
                    const Text(' | '),
                    GestureDetector(
                      child: const Text('Sign Up'),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignupPhonePage()));
                      },
                    ),
                    const Spacer(),
                  ],
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
