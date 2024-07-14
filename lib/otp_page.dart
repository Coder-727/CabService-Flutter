import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

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
      body: Column(
        children: [
          const Spacer(),
          Center(
            child: Column(
              children: [
                const Text('Enter OTP',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
                const SizedBox(
                  height: 20,
                ),
                    OtpTextField(
        numberOfFields: 4,
        borderColor: Theme.of(context).colorScheme.primary,
        showFieldAsBox: true, 
        onCodeChanged: (String code) {
                       
        },
        onSubmit: (String verificationCode){
            showDialog(
                context: context,
                builder: (context){
                return AlertDialog(
                    title: const Text("Verification Code"),
                    content: Text('Code entered is $verificationCode'),
                );
                }
            );
        }, // end onSubmit
    ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(onPressed: () {}, child: const Text('Verify'))
              ],
            ),
          ),
          const Spacer(flex: 2,),
        ],
      ),
    );
  }
}
