import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage ({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 236, 241, 243),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
              height: 100,
              ),
            const Icon(
                  Icons.person, 
                  size: 150,
                  color: Colors.blueAccent, 
                  ),
              const SizedBox(
                height: 50,
              ),

              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: const Color.fromARGB(255, 236, 241, 243),
                height: 30,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Expanded(flex: 2, child: Text("Informe seu e-mail:")),
                    Expanded(flex: 2, child: Text("e-mail")),
                  ],
                ),
              ),
                const SizedBox(
                height: 20,
              ),

              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: const Color.fromARGB(255, 236, 241, 241),
                height: 30,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Expanded(flex: 2, child: Text("Informe a senha:")),
                    Expanded(flex: 2, child: Text("senha")),
                  ],
                ),
              ),
              Expanded(child: Container()),

              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: Colors.green,
                height: 30,
                alignment: Alignment.center,
                child: const Text("Login"),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: Colors.grey,
                height: 30,
                alignment: Alignment.center,
                child: const Text("Cadastro"),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}