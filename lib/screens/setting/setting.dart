
import 'package:flutter/material.dart';


class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = false;
  String _selectedTheme = 'Light';
  final List<String> _themes = ['Light', 'Dark', 'System Default'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Manage Account'),
            leading: Icon(Icons.account_circle),
            onTap: () {
              // Navigate to account management page
            },
          ),
          ListTile(
            title: Text('Privacy Policy'),
            leading: Icon(Icons.privacy_tip),
            onTap: () {
              // Show privacy policy
            },
          ),
          ListTile(
            title: Text('Terms of Service'),
            leading: Icon(Icons.description),
            onTap: () {
              // Show terms of service
            },
          ),
        ],
      ),
    );
  }
}
