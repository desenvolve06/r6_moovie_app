import 'package:flutter/material.dart';
import '../../main.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_strings.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color textColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          verticalDirection: VerticalDirection.down,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              alignment: Alignment.topCenter,
              'assets/logoKoruFlix.png',
              scale: 2.0,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                labelText: 'Senha',
              ),
            ),
            const SizedBox(height: 10.0),
            InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              onTap: () {
                setState(() {
                  textColor = const Color.fromARGB(255, 255, 24, 24);
                });
              },
              child: const Text('Esqueceu a senha?',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.blue,
                  )),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  backgroundColor: (AppColors.primaryColorDark)),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const MyHomePage(title: AppStrings.appTitle)),
                );
              },
              child: const Text(
                'Login',
                style: TextStyle(color: AppColors.primaryText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}