import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrazilFields extends StatefulWidget {
  const BrazilFields({super.key});

  @override
  State<BrazilFields> createState() => _BrazilFieldsState();
}

class _BrazilFieldsState extends State<BrazilFields> {
  var controllerCEP = TextEditingController();
  var controllerCPF = TextEditingController();
  var controllerCents = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("CEP"),
          TextFormField(
            controller: controllerCEP,
            keyboardType: TextInputType.number,
            inputFormatters: [
              // obrigatório
              FilteringTextInputFormatter.digitsOnly,
              CepInputFormatter(),
            ],
          ),
          const SizedBox(height: 20,),
          const Text("CPF"),
           TextFormField(
            controller: controllerCPF,
            keyboardType: TextInputType.number,
            inputFormatters: [
              // obrigatório
              FilteringTextInputFormatter.digitsOnly,
              CpfInputFormatter(),
            ],
          ),
          const SizedBox(height: 20,),
          const Text("Centavos"),
          TextFormField(
            controller: controllerCents,
            keyboardType: TextInputType.number,
            inputFormatters: [
              // obrigatório
              FilteringTextInputFormatter.digitsOnly,
              CentavosInputFormatter(moeda: true),
            ],
          ),
          
          Center(
            child: TextButton(onPressed: (){
              print(CPFValidator.isValid(controllerCPF.text));
            }, child: const Text("Continuar")),
          ),
      ])
    ));
  }
}
