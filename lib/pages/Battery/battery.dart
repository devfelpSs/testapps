import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';

class BatteryPage extends StatefulWidget {
  const BatteryPage({super.key});

  @override
  State <BatteryPage> createState() =>  BatteryPageState();
}

class  BatteryPageState extends State <BatteryPage> {

  var battery = Battery();
  var statusBateria = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPage();
  }

  initPage() async {
    statusBateria = (await battery.batteryLevel).toString();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(title: Text("Status da Bateria: $statusBateria")),
      body: Column(),
    ));
  }
}

// Para resolver o problema você precisa aceitar a licença do sdkmanager, para rodar o sdkmanager, você precisa achar o caminho do android sdk, após isso é só rodar flutter doctor e aceitar a licença, na duvida rode o comando "flutter doctor"