import 'package:cab_cris/otp_page.dart';
import 'package:flutter/material.dart';
class ForgotPasswordPage extends StatelessWidget {
   ForgotPasswordPage({super.key});
  final _usernameController=TextEditingController();
  final _mobilenumberController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cab Service ',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children:[ 
            const Spacer(),
            SizedBox(
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const Text('Enter the username:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),),
                const Spacer(),
                 TextField(
                  controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          hintText: 'Enter your username',
                        ),
                ),
                const Spacer(),
                const Text('Enter the registered mobile number',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),),
                const Spacer(),
                 TextField(controller: _mobilenumberController,
                        decoration: const InputDecoration(
                          labelText: 'Mobile number',
                          hintText: 'Enter your mobile number',),
                 ),
                const SizedBox(height: 40,),
                ElevatedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder:(context)=> const OtpPage() ));
                }, child:  const Text('Get OTP')),
                const Spacer(),
            ],
            ),
          ),
          const Spacer(flex: 2,),
          ],
        ),
      )
    );
  }
}