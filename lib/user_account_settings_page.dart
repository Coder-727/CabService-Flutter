import 'package:cab_cris/user_change_password_page.dart';
import 'package:cab_cris/user_edit_personalinfo_page.dart';
import 'package:flutter/material.dart';
class UserAccountSettingsPage extends StatelessWidget {
  const UserAccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings',
          style:  TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          Card(
                color: Colors.blue.shade100,
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: ListTile(
                  leading: Icon(Icons.edit, color: Colors.blue.shade700),
                  title: const Text(
                    'Edit Personal information',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue.shade700),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const UserEditPersonalinfoPage()));
                  },
                ),
              ),
              Card(
                color: Colors.blue.shade100,
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: ListTile(
                  leading: Icon(Icons.password, color: Colors.blue.shade700),
                  title: const Text(
                    'Change password',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue.shade700),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> UserChangePasswordPage()));
                  },
                ),
              ),
          
        ],
      ),
    );
  }
  }