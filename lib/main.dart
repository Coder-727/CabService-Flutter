import 'package:cab_cris/driver_list_page.dart';
import 'package:cab_cris/login_page.dart';
import 'package:flutter/material.dart';

// void main() async {
void main(){
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue,
        primary: Colors.blue)
      ),
      home:  const LoginPage(),
    );
  }
}