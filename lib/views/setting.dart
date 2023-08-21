import 'package:flutter/material.dart';

class SettingsPrivacyScreen extends StatefulWidget {
  const SettingsPrivacyScreen({super.key});

  @override
  State<SettingsPrivacyScreen> createState() => _SettingsPrivacyScreenState();
}

class _SettingsPrivacyScreenState extends State<SettingsPrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
          title: const  Text('SettingsPrivacyScreen'),
      ),
      body: const Center(
        child: Text(
          "SettingsPrivacyScreen",
        ),
      ),
    );
  }
}
