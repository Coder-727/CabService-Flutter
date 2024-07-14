import 'package:cab_cris/home_cabs_page.dart';
import 'package:cab_cris/user_profile_page.dart';
import 'package:flutter/material.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int currentPage = 0;

  List<Widget> pages = [
    const HomeCabsPage(), // Define a new widget to represent the home cabs page content
    const UserProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text(
          currentPage == 0 ? 'Available Cabs' : 'User Profile',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: pages[currentPage], 
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue.shade100,
        iconSize: 35,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_taxi),
            label: 'Cabs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}