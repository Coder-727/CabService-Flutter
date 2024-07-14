import 'package:cab_cris/global_variables.dart';
import 'package:flutter/material.dart';

class UserEditPersonalinfoPage extends StatelessWidget {
  const UserEditPersonalinfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Personal Info',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: Center(
              child: Stack(
                children: [
                  Image.asset('assets/images/profile.jpg'),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        // Add your edit functionality here
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildEditableField(context, 'Name', user['name'] as String),
                const SizedBox(height: 20),
                _buildEditableField(context, 'Gender', user['gender'] as String),
                const SizedBox(height: 20),
                _buildEditableField(context, 'EmployeeId', user['employeeId'] as String),
                const SizedBox(height: 20),
                _buildEditableField(context, 'Designation', user['designation'] as String),
                const SizedBox(height: 20),
                _buildEditableField(context, 'Contact No.', user['contactNo'] as String),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditableField(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$label : ',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: () {
              // Add your edit functionality here
            },
          ),
        ],
      ),
    );
  }
}
