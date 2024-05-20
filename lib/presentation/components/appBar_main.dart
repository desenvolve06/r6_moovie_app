import 'package:flutter/material.dart';

class AppBarMain extends StatelessWidget {
  const AppBarMain({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 32, 38),
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 127, 140, 40)),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.movie, color: Color.fromARGB(255, 127, 140, 40)),
            Text(
              'KoruFlix',
              style: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 127, 140, 40)),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert,
                color: Color.fromARGB(255, 127, 148, 40)),
            onPressed: () {},
          ),
        ],
      

    );
  }
}
