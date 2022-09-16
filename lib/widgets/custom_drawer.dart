import 'package:flutter/material.dart';
import 'package:preferences_app/screens/screens.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _drawerHeader(),
          ListTile(
              leading: Icon(Icons.pages),
              title: const Text('Home'),
              onTap: (() {
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              })),
          ListTile(
              leading: Icon(Icons.people),
              title: const Text('People'),
              onTap: (() {})),
          ListTile(
              leading: Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: (() {
                Navigator.pushReplacementNamed(
                    context, SettingsScreen.routeName);
              }))
        ],
      ),
    );
  }
}

class _drawerHeader extends StatelessWidget {
  const _drawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover),
      ),
    );
  }
}
