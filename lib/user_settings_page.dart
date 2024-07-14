import 'package:cab_cris/app_preferences_page.dart';
import 'package:cab_cris/general_settings_page.dart';
import 'package:cab_cris/user_account_settings_page.dart';
import 'package:flutter/material.dart';
class UserSettingsPage extends StatelessWidget {
  const UserSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings',
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
                  leading: Icon(Icons.person, color: Colors.blue.shade700),
                  title: const Text(
                    'Account Settings',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue.shade700),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const UserAccountSettingsPage()));
                  },
                ),
              ),
              Card(
                color: Colors.blue.shade100,
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: ListTile(
                  leading: Icon(Icons.brush_outlined, color: Colors.blue.shade700),
                  title: const Text(
                    'App Preferences',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue.shade700),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AppPreferencesPage()));
                  },
                ),
              ),
              Card(
                color: Colors.blue.shade100,
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: ListTile(
                  leading: Icon(Icons.support_agent, color: Colors.blue.shade700),
                  title: const Text(
                    'General Settings',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue.shade700),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const GeneralSettingsPage()));
                  },
                ),
              ),
          
        ],
      ),
    );
  }
}