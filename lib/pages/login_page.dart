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
              height: 50,
              ),
            Row(
              children: [
                Expanded(child: Container()),
                Expanded(
                  flex: 8,
                  child: Image.network(
                    "https://hermes.digitalinnovation.one/assets/diome/logo.png",
                      height: 150,
                    ),
                ),
                Expanded(child: Container()),
              ],
            ),
            const SizedBox(
                height: 20,
              ),

               const Text(
                "Já tem cadastro?", 
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
               ),
               const SizedBox(height: 20),
               const Text("Faça seu login e make the change_",
               style: TextStyle(fontSize: 14),
               ),
               const SizedBox(height: 40),

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
                height: 5,
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

              const SizedBox(
                height: 30,
              ),

              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: Colors.green,
                height: 30,
                alignment: Alignment.center,
                child: const Text("Login"),
              ),
              Expanded(child: Container()),

              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: const Color.fromARGB(255, 236, 241, 243),
                height: 30,
                alignment: Alignment.center,
                child: const Text("Esqueci minha senha"),
              ),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: const Color.fromARGB(255, 236, 241, 243),
                height: 30,
                alignment: Alignment.center,
                child: const Text("Criar conta", style: TextStyle(color: Colors.green, fontWeight: FontWeight.w400),),
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}