import 'package:flutter/material.dart';

class NavBarMain extends StatelessWidget {
  const NavBarMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 219, 242, 41),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(height: 60),
          ListTile(
            title: const Text(
              'Home',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'My Profile',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Downloads',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Popular',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Suggestions',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Options',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
