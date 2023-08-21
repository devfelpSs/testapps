import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BrazilFields extends StatefulWidget {
  const BrazilFields({super.key});

  @override
  State<BrazilFields> createState() => _BrazilFieldsState();
}

class _BrazilFieldsState extends State<BrazilFields> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [
            // obrigatório
            FilteringTextInputFormatter.digitsOnly,
            CepInputFormatter(),
          ],
        )
      ],
    ));
  }
}
