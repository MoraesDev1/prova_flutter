import 'package:flutter/material.dart';
import 'package:prova_flutter/Pages/home_page.dart';
import 'package:prova_flutter/Utils/fundo.dart';
import 'package:prova_flutter/Widgets/custom_label.dart';
import 'package:prova_flutter/Widgets/custom_textfield.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  _clickEnter() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
      (route) => false,
    );
  }

  _esconderTeclado() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _esconderTeclado,
        child: Fundo(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              CustomLabel(label: 'Usuário'),
              const SizedBox(height: 5),
              CustomTextField(
                controller: _userController,
                obscureText: false,
                icon: const Icon(Icons.person),
              ),
              const SizedBox(height: 20),
              CustomLabel(label: 'Senha'),
              const SizedBox(height: 5),
              CustomTextField(
                controller: _passController,
                obscureText: true,
                icon: const Icon(Icons.lock),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 180,
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.green.shade300),
                  ),
                  onPressed: _clickEnter,
                  child: const Text('Entrar'),
                ),
              ),
              const Spacer(),
              const TextButton(
                onPressed: _abreUrl,
                child: Text(
                  'Política de Privacidade',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_abreUrl() async {
  String url = 'https://google.com.br';
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $url');
  }
}
