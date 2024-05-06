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
              color: Colors.black,
            ),
            title: const Text('Home',
                style: TextStyle(
                  color: Colors.black,
                )),
            onTap: () {
              // Implementar a ação para a opção 1
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.black,
            ),
            title: const Text('My Profile',
                style: TextStyle(
                  color: Colors.black,
                )),
            onTap: () {
              // Implementar a ação para a opção 2
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.download,
              color: Colors.black,
            ),
            title: const Text('Downloads',
                style: TextStyle(
                  color: Colors.black,
                )),
            onTap: () {
              // Implementar a ação para a opção 3
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.trending_up,
              color: Colors.black,
            ),
            title: const Text('Popular',
                style: TextStyle(
                  color: Colors.black,
                )),
            onTap: () {
              // Implementar a ação para a opção 3
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.list_alt,
              color: Colors.black,
            ),
            title: const Text('Suggestions',
                style: TextStyle(
                  color: Colors.black,
                )),
            onTap: () {
              // Implementar a ação para a opção 3
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            title: const Text('Options',
                style: TextStyle(
                  color: Colors.black,
                )),
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
