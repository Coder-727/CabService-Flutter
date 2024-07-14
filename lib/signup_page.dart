// import 'package:flutter/material.dart';

// class SignupPage extends StatefulWidget {
//   const SignupPage({super.key});

//   @override
//   State<SignupPage> createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   final _formKey = GlobalKey<FormState>();

//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isPasswordVisible = false;
//   bool _hasMinLength = false;
//   bool _hasUppercase = false;
//   bool _hasLowercase = false;
//   bool _hasNumber = false;
//   bool _hasSpecialChar = false;

//   @override
//   void initState() {
//     super.initState();
//     _passwordController.addListener(_validatePassword);
//   }

//   void _validatePassword() {
//     final password = _passwordController.text;
//     setState(() {
//       _hasMinLength = password.length >= 8;
//       _hasUppercase = password.contains(RegExp(r'[A-Z]'));
//       _hasLowercase = password.contains(RegExp(r'[a-z]'));
//       _hasNumber = password.contains(RegExp(r'[0-9]'));
//       _hasSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
//     });
//   }

//   @override
//   void dispose() {
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Cab Service CRIS',
//           style: TextStyle(
//             fontSize: 32,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const Spacer(flex: 2),
//                     const Text(
//                       'Sign Up',
//                       style: TextStyle(
//                         fontSize: 32,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     TextFormField(
//                       controller: _usernameController,
//                       decoration: const InputDecoration(
//                         labelText: 'Username',
//                         hintText: 'Create a Username',
//                         helperText: 'It should be at least 8 characters long',
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your username';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 40),
//                     TextFormField(
//                       controller: _passwordController,
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                         hintText: 'Create a password',
//                         helperText: 'Must contain at least one uppercase letter, digit, and special char',
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _isPasswordVisible = !_isPasswordVisible;
//                             });
//                           },
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your password';
//                         }
//                         return null;
//                       },
//                       obscureText: !_isPasswordVisible,
//                     ),
//                     const SizedBox(height: 10),
//                     const Text(
//                       'Password must contain:',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 5),
//                     _buildConstraintItem('At least 8 characters', _hasMinLength),
//                     _buildConstraintItem('At least one uppercase letter', _hasUppercase),
//                     _buildConstraintItem('At least one lowercase letter', _hasLowercase),
//                     _buildConstraintItem('At least one number', _hasNumber),
//                     _buildConstraintItem('At least one special character', _hasSpecialChar),
//                     const SizedBox(height: 40),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           minimumSize: const Size(double.infinity, 30),
//                           padding: const EdgeInsets.all(16),
//                         ),
//                         onPressed: () {
//                           if (_formKey.currentState?.validate() ?? false) {
//                             // Process the sign-in
//                             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>))
//                           }
//                         },
//                         child: const Text(
//                           'Sign Up',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     const Spacer(flex: 3),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }


//   Widget _buildConstraintItem(String text, bool isValid) {
//     return Row(
//       children: [
//         Icon(
//           isValid ? Icons.check : Icons.close,
//           color: isValid ? Colors.green : Colors.red,
//           size: 20,
//         ),
//         const SizedBox(width: 8),
//         Text(text),
//       ],
//     );
//   }
// }
