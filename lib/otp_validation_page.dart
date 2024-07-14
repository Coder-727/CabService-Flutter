import 'package:flutter/material.dart';
import 'package:cab_cris/signup_username_password_page.dart';
import 'package:flutter/services.dart';

class OtpValidationPage extends StatefulWidget {
  final String phoneNumber;

  const OtpValidationPage({required this.phoneNumber, Key? key}) : super(key: key);

  @override
  _OtpValidationPageState createState() => _OtpValidationPageState();
}

class _OtpValidationPageState extends State<OtpValidationPage> {
  final _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isOtpSent = false;
  String _otp = '123456'; 

  Future<void> _sendOtp() async {
    // Simulate sending OTP
    setState(() {
      _isOtpSent = true;
    });
  }

  Future<void> _verifyOtp() async {
    if (_otpController.text == _otp) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SignupUsernamePasswordPage(
          phoneNumber: widget.phoneNumber,
        ),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid OTP')),
      );
    }
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Validation'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'OTP Validation',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              if (!_isOtpSent)
                Center(
                  child: ElevatedButton(
                    onPressed: _sendOtp,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    child: const Text('Send OTP'),
                  ),
                ),
              if (_isOtpSent)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _otpController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        labelText: 'Enter OTP',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the OTP';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            _verifyOtp();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        child: const Text('Verify OTP'),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
