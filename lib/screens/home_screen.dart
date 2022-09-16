import 'package:flutter/material.dart';
import 'package:preferences_app/widgets/widgets.dart';

import '../shared_preferences/preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: CustomDrawer(),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('isDarkmode: ${Preferences.isDarkMode.toString()}'),
        Divider(),
        Text('Género: ${Preferences.gender.toString()}'),
        Divider(),
        Text('Nombre de usuario: ${Preferences.name}'),
        Divider(),
      ]),
    );
  }
}
