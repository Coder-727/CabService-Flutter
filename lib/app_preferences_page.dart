import 'package:flutter/material.dart';

class AppPreferencesPage extends StatefulWidget {
  const AppPreferencesPage({super.key});

  @override
  _AppPreferencesPageState createState() => _AppPreferencesPageState();
}

class _AppPreferencesPageState extends State<AppPreferencesPage> {
  bool isDarkMode = false;
  String selectedLanguage = 'English';
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Preferences'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text('Theme'),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (bool value) {
                setState(() {
                  isDarkMode = value;
                  // Add logic to change the theme of the app
                });
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            trailing: DropdownButton<String>(
              value: selectedLanguage,
              onChanged: (String? newValue) {
                setState(() {
                  selectedLanguage = newValue!;
                  // Add logic to change the language of the app
                });
              },
              items: <String>['English', 'Spanish', 'French', 'German']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            trailing: Switch(
              value: notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  notificationsEnabled = value;
                  // Add logic to enable or disable notifications
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
