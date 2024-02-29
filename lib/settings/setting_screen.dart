import 'package:easaac_project/home/home_screen_body.dart';
import 'package:flutter/material.dart';

import '../home/home.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = 'setting_screen';
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final _urlController = TextEditingController();
  String? _selectedDevice;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(

        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _urlController,
              decoration: const InputDecoration(
                labelText: 'Web URL',
                hintText: 'Enter a URL',
              ),
            ),
            const SizedBox(height: 20.0),
            DropdownButtonFormField<String>(
              value: _selectedDevice,
              decoration: const InputDecoration(
                labelText: 'Network Device',
                hintText: 'Select a device',
              ),
              onChanged: (value) {
                setState(() {
                  _selectedDevice = value;
                });
              },
              items: const [
                DropdownMenuItem(
                  value: 'wifi',
                  child: Text('Wi-Fi'),
                ),
                DropdownMenuItem(
                  value: 'bluetooth',
                  child: Text('Bluetooth'),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(url: _urlController.text)
                  ),
                );
              },
              child: const Text('Visit Website'),
            ),
          ],
        ),
      ),
    );
  }
}
