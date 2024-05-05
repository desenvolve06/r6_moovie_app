import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFDBF228),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFDBF228),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: const Text(
              'Home',
            ),
            onTap: () {
              // Implementar a ação para a opção 1
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('My Profile'),
            onTap: () {
              // Implementar a ação para a opção 2
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.download),
            title: const Text('Downloads'),
            onTap: () {
              // Implementar a ação para a opção 3
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.trending_up),
            title: const Text('Popular'),
            onTap: () {
              // Implementar a ação para a opção 3
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.list_alt),
            title: const Text('Suggestions'),
            onTap: () {
              // Implementar a ação para a opção 3
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Options'),
            onTap: () {
              // Implementar a ação para a opção 3
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
