import 'package:cab_cris/about_page.dart';
import 'package:cab_cris/help_and_support_page.dart';
import 'package:cab_cris/privacy_policy_page.dart';
import 'package:cab_cris/terms_and_conditions_page.dart';
import 'package:flutter/material.dart';

class GeneralSettingsPage extends StatelessWidget {
  const GeneralSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('General Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help and Support'),
            onTap: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelpAndSupportPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Terms and Conditions'),
            onTap: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TermsAndConditionsPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy Policy'),
            onTap: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PrivacyPolicyPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}