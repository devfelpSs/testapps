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
        backgroundColor: Color(0x60212121),
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
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: Colors.white),
               ),
               const SizedBox(height: 20),
               const Text("Faça seu login e make the change._",
               style: TextStyle(fontSize: 14, color: 
               Colors.white
               ),
               ),
               const SizedBox(height: 40),

              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: const Color(0x00212121),
                height: 30,
                alignment: Alignment.center,
                child: Row(
                  children: const [
                    Expanded(flex: 2, child: Text("Informe seu e-mail:", style: TextStyle(color: Colors.purple),)),
                    Expanded(flex: 2, child: Text("e-mail", style: TextStyle(color: Colors.white),)),
                  ],
                ),
              ),
                const SizedBox(
                height: 5,
              ),

              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: const Color(0x00212121),
                height: 30,
                alignment: Alignment.center,
                child: Row(
                  children: const [
                    Expanded(flex: 2, child: Text("Informe a senha:", style: TextStyle(color: Colors.purple),)),
                    Expanded(flex: 2, child: Text("senha", style: TextStyle(color: Colors.white),)),
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              Container(
                //decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(8.0)),
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                alignment: Alignment.center,
                //child: const Text("ENTRAR", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),), 
                child: SizedBox(          //criei uma caixa
                  width: double.infinity, //que ocupa todo o espaço da tela
                  child: TextButton(      //função botão
                    onPressed: () {},     //ativo ao ser pressionado
                    style: ButtonStyle(   //stylo do botão
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      backgroundColor: MaterialStateProperty.all(Colors.purple)), 
                    child: const Text("ENTRAR", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 14),
                    )
                  ),
                ),
              ),
              Expanded(child: Container()),

              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: const Color(0x00212121),
                height: 30,
                alignment: Alignment.center,
                child: const Text("Esqueci minha senha",
                style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.w400),),
              ),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                color: const Color(0x00212121),
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