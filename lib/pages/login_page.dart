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
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
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
        
                Container(                //Container area email:
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  color: const Color(0x00212121),
                  height: 30,
                  alignment: Alignment.center,
                  child: const TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 0),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                        hintText: "Email", hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.mail_outline, color: Colors.purple,)
                      ),
                    ), 
                ),
                 const SizedBox(
                  height: 15,
                ),
        
                Container(                //Container area senha:
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  color: const Color(0x00212121),
                  height: 30,
                  alignment: Alignment.center,
                  child: const TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 0),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                      hintText: "Senha", 
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                      Icons.lock, color: Colors.purple),
                      suffixIcon: Icon(
                      Icons.visibility, color: Colors.white)
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
        
                Container(                //Container area botão:
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.center,
                  child: SizedBox(          //criei uma caixa
                    width: double.infinity, //que ocupa todo o espaço da tela
                    child: TextButton(      //função botão
                      onPressed: () {},     //ativo ao ser pressionado
                      style: ButtonStyle(   //stylo do botão
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                        backgroundColor: MaterialStateProperty.all(Colors.purple)), 
                        child: const Text("ENTRAR", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 14),
                      ),
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
      ),
    );
  }
}