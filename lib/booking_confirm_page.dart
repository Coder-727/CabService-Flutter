import 'package:cab_cris/home_cabs_page.dart';
import 'package:cab_cris/user_home_page.dart';
import 'package:flutter/material.dart';

class BookingConfirmPage extends StatelessWidget {
  const BookingConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          
          children: [
            const Spacer(flex: 2,),
            Icon(Icons.check_circle,size:60,color: Colors.green,),
            const SizedBox(height: 30,),
            Text('Booking confirmed successfully',style: 
            TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              
            ),
            textAlign: TextAlign.center,),
          const Spacer(),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UserHomePage()));
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Home'),
            ),
          ),
            const Spacer(flex: 3,),
          ],
        ),
      ),
    );
  }
}