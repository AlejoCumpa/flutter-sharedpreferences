import 'package:flutter/material.dart';
import 'package:preferences_app/provider/theme_provider.dart';
import 'package:preferences_app/shared_preferences/preferences.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  static const String routeName = 'Settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  //bool isDarkMode = false;
  //int gender = 1;
  //String nombre = 'Pedro';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ajustes',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w300),
            ),
            SwitchListTile(
                title: const Text('Darkmode'),
                value: Preferences.isDarkMode,
                onChanged: (value) {
                  setState(() {
                    Preferences.isDarkMode = value;

                    final themeProvider =
                        Provider.of<ThemeProvider>(context, listen: false);

                    value
                        ? themeProvider.setDarkMode()
                        : themeProvider.setLightMode();
                  });
                }),
            const Divider(),
            RadioListTile(
                value: 1,
                groupValue: Preferences.gender,
                title: const Text('Masculino'),
                onChanged: (value) {
                  setState(() {
                    Preferences.gender = value ?? 1;
                  });
                }),
            RadioListTile(
                value: 2,
                groupValue: Preferences.gender,
                title: const Text('Femenino'),
                onChanged: (value) {
                  setState(() {
                    Preferences.gender = value ?? 2;
                  });
                }),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                initialValue: Preferences.name,
                onChanged: (value) {
                  setState(() {
                    Preferences.name = value;
                  });
                },
                decoration: const InputDecoration(
                    labelText: 'Nombre', helperText: 'Nombre de Usuario'),
              ),
            )
          ],
        )),
      ),
    );
  }
}
