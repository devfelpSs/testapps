import 'dart:io';

import 'package:battery_plus/battery_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:testapp/pages/autosizetext/auto_size_text.dart';
import 'package:testapp/pages/connectivity_pkg/connectivity.dart';
import 'package:testapp/pages/login_page.dart';
import 'package:testapp/pages/numeros_aleatorios/numeros_aleatorios_shared_preferences.dart';
import 'package:testapp/pages/posts_page.dart';
import 'package:testapp/pages/tarefa_page/tarefa_http_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../pages/configuracoes/configuracoes_hive_page.dart';
import '../../pages/dados_cadastrais/dados_cadastrais_hive.dart';
import 'package:testapp/pages/Battery/battery.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Camera"),
                          leading: const Icon(Icons.camera),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Galeria"),
                          leading: const Icon(Icons.album),
                        )
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.orange),
                currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Image.network(
                        "https://avatars.githubusercontent.com/u/30783071?v=4")),
                accountName: const Text("Felipe de Souza"),
                accountEmail: const Text("email@email.com")),
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.personCircleCheck,
                      color: Colors.green,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Cadastro"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DadosCadastraisHivePage()));
            },
          ),
          const Divider(),
          InkWell(
            //cria uma nova função chamada termos de uso e Privacidade:
            child: Container(
                //cria container
                padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal:
                        10), //adiciona um padding com 10 de borda tanto na vertical quanto na horizontal
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.info),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Termos de uso e Privacidade"),
                  ],
                )),
            onTap: () {
              // quando o usuario clicar, irá executar a ação abaixo:
              showDialog(
                  context: context, //mostra uma caixa de dialogo
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      alignment: Alignment.center,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10)), //bordas redondas no valor 10
                      title: const Text(
                        "Termos de uso e Privacidade",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ), //titulo do dialogo com fonte em negrito
                      content: const Wrap(
                        //cria uma especie de Container, só que formato de acordo com o conteudo abaixo:
                        children: [
                          Text(
                            " Podemos já vislumbrar o modo pelo qual a execução dos pontos do programa desafia a capacidade de equalização dos modos de operação convencionais. A nível organizacional, a expansão dos mercados mundiais estende o alcance e a importância das condições financeiras e administrativas exigidas. Todavia, o desenvolvimento contínuo de distintas formas de atuação apresenta tendências no sentido de aprovar a manutenção de alternativas às soluções ortodoxas. A prática cotidiana prova que o comprometimento entre as equipes faz parte de um processo de gerenciamento do sistema de formação de quadros que corresponde às necessidades.",
                            textAlign: TextAlign.center,
                          )
                        ], //Texto com alinhamento no centro
                      ),
                      actions: [
                        //Após o usuario ler os termos de uso, a prox ação é o usuario concordar com os termos
                        TextButton(
                            onPressed: () {
                              //cria um botão que ao ser pressionado pelo usuario
                              Navigator.pop(context); // fecha o dialog
                            },
                            child: const Text(
                                "OK")) //Botão com "OK", O usuario clica e concorda com os termos de uso e Privacidade
                      ],
                    );
                  });
            },
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.table_view),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Gerador de números"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (bc) =>
                        const NumerosAleatoriosSharedPreferencePage()),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Configurações"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (bc) => const ConfiguracoesHivePage()),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(FontAwesomeIcons.shareNodes),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Compartilhar"),
                  ],
                )),
            onTap: () {
              Share.share("check out my website: https://dio.me");
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.paperclip,
                      color: Colors.blue,
                      size: 24,
                    ),
                    Text("Auto Size Text"),
                  ],
                )),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const AutoSizeTextPage()));
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.post_add),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Tarefas HTTP"),
                  ],
                )),
            onTap: () async {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (bc) => const TarefaHttpPage()));
            },
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.wifi,
                      color: Colors.blue,
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Conexão"),
                  ],
                )),
            onTap: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const ConnectivityPlusPage()));
            },
          ),
          // InkWell(
          //   child: Container(
          //       padding:
          //           const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //       width: double.infinity,
          //       child: const Row(
          //         children: [
          //           FaIcon(
          //             FontAwesomeIcons.mapLocationDot,
          //             color: Colors.blue,
          //             size: 18,
          //           ),
          //           SizedBox(
          //             width: 5,
          //           ),
          //           Text("Abrir Google Maps"),
          //         ],
          //       )),
          //   onTap: () async {
          //     await launchUrl(
          //         Uri.parse("google.navigation:q=Orlando FL&mode=d"));
          //   },
          // ),
          // InkWell(
          //   child: Container(
          //       padding:
          //           const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //       width: double.infinity,
          //       child: const Row(
          //         children: [
          //           FaIcon(FontAwesomeIcons.robot),
          //           SizedBox(
          //             width: 5,
          //           ),
          //           Text("Device Info"),
          //         ],
          //       )),
          //   onTap: () async {
          //     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
          //     if (Platform.isAndroid) {
          //     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
          //     print('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"

          //     }else if (Platform.isIOS){
          //     IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
          //     print('Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"

          //     }else {
          //     WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
          //     print(
          //         'Running on ${webBrowserInfo.userAgent}'); // e.g. "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:61.0) Gecko/20100101 Firefox/61.0"
          //     }
          //   },
          // ),
          // InkWell(
          //   child: Container(
          //       padding:
          //           const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //       width: double.infinity,
          //       child: const Row(
          //         children: [
          //           FaIcon(FontAwesomeIcons.appStoreIos),
          //           SizedBox(
          //             width: 5,
          //           ),
          //           Text("PKG Info"),
          //         ],
          //       )),
          //   onTap: () async {
          //     PackageInfo packageInfo = await PackageInfo.fromPlatform();

          //     String appName = packageInfo.appName;
          //     String packageName = packageInfo.packageName;
          //     String version = packageInfo.version;
          //     String buildNumber = packageInfo.buildNumber;

          //     print(appName);
          //     print(packageName);
          //     print(version);
          //     print(buildNumber);
          //   },
          // ),
          // InkWell(
          //   child: Container(
          //       padding:
          //           const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //       width: double.infinity,
          //       child: const Row(
          //         children: [
          //           FaIcon(FontAwesomeIcons.batteryHalf),
          //           SizedBox(
          //             width: 5,
          //           ),
          //           Text("Bateria"),
          //         ],
          //       )),
          //   onTap: () async {
          //     Navigator.pop(context);
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (bc) => const BatteryPage()));
          //   },
          // ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.exit_to_app),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Sair"),
                    ],
                  )),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext bc) {
                      return AlertDialog(
                        alignment: Alignment.center,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        title: const Text("Atenção",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        content: const Wrap(
                          children: [
                            Text("Deseja realmente sair?"),
                          ],
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                  "Não")), //Acionada pelo o usuario, cancela a operação
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage())); //Limpa a stack inteira e envia o usuario para a tela de login novamente
                              },
                              child: const Text("Sim")),
                        ],
                      );
                    });
              }),
        ],
      ),
    );
  }
}
