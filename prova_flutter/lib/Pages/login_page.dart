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
  final _formKey = GlobalKey<FormState>();

  _clickEnter() {
    if (_userController.text == 'abc') {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false,
      );
    }
  }

  _esconderTeclado() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  //Ambos os campos não podem ultrapassar 20 caracteres.
  //Ambos os campos não podem terminar com o caractere de espaço no final.

  String? _validaUsuario(String? value) {
    if (value != null && value.isEmpty) {
      return 'Campo inválido';
    }
    return null;
  }

  _validaSenha() {
    //O campo senha não pode ter menos que dois caracteres.
    //O campo senha não pode ter caracteres especiais, sendo apenas possível informar 'a' até 'Z' e '0' até '9'.
    if (_passController.text == '1234') {}
  }

  _isAuth() {
    if (true) {}
  }

  //Se ambas as informações es􀆟veram preenchidas deve ir para a próxima tela.
  //Não é necessário validar as informações em uma API Externa, mas caso seja feito um mockAPI contara como um diferencial

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _esconderTeclado();
        },
        child: Fundo(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                CustomLabel(label: 'Usuário'),
                const SizedBox(height: 5),
                CustomTextField(
                  validator: _validaUsuario,
                  controller: _userController,
                  obscureText: false,
                  icon: const Icon(Icons.person),
                ),
                const SizedBox(height: 20),
                CustomLabel(label: 'Senha'),
                const SizedBox(height: 5),
                CustomTextField(
                  validator: _validaSenha(),
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
