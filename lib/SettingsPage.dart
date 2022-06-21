import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:testdemo/HomePage.dart';
import 'config.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSwitched = false;
  bool _isDarkTheme = true;
  bool _isUsingHive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text('Common'),
            tiles: <SettingsTile>[
              SettingsTile(
                leading: Icon(Icons.language),
                title: Text('Language'),
                value: Text('English'),
                onPressed: (value) {
                  final snackBar = SnackBar(
                    content: Text('Only English Right Now :p'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
              SettingsTile.switchTile(
                title: Text("Enable Custom Theme"),
                leading: Icon(Icons.format_paint),
                initialValue: _isUsingHive,
                onToggle: (value) {
                  setState(() {
                    _isUsingHive = value;
                  });
                }
              ),
              SettingsTile.switchTile(
                initialValue: _isDarkTheme,
                leading: Icon(IconData(0xe1b0, fontFamily: 'MaterialIcons')),
                title: Text('Enable Dark Mode'),
                onToggle: (value) {
                  setState(() {
                    _isDarkTheme = value;
                  });
                  currentTheme.switchTheme();
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}