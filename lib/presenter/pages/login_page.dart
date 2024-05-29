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
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryBackgroundColor,
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
              const SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: AppColors.primaryColor),
                  ),
                  contentPadding: const EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide:
                            const BorderSide(color: AppColors.primaryColor)),
                    contentPadding: const EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide:
                          const BorderSide(color: AppColors.primaryColor),
                    ),
                    focusColor: AppColors.primaryColorDark,
                    hintText: 'Senha',
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: _togglePasswordVisibility,
                    )),
              ),
              const SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {},
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
              const SizedBox(height: 20.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: AppColors.primaryText,
                      height: 50,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OU'),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColors.primaryText,
                      height: 50,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      print('Login com Facebook');
                    },
                    child: Image.asset(
                      scale: 1.5,
                      'assets/icon_face.png',
                      width: 50.0,
                      height: 50.0,
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  InkWell(
                    onTap: () {
                      print('Login com Google');
                    },
                    child: Image.asset(
                      scale: 1.5,
                      'assets/icon_google.png',
                      width: 50.0,
                      height: 50.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Não tem uma conta?',
                    textAlign: TextAlign.center,
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Cadastre-se',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              ),
            ],
          ),
        ));
  }
}
