import 'package:flutter/material.dart';
import '../shared/widgets/app_images.dart';

class ListViewH extends StatefulWidget {
  const ListViewH({super.key});

  @override
  State<ListViewH> createState() => _ListViewHState();
}

class _ListViewHState extends State<ListViewH> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
       ListTile(
         leading: Image.asset(AppImages.profile2),
          title: const Text("Perfil 2"),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Oi, tudo bom ?"),
              Text("08:59"),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu){
              if (menu == "opcao2") {} 
            },
            itemBuilder: (BuildContext bc){
              return <PopupMenuEntry<String>>[
                const PopupMenuItem(value: "opcao1", child: Text("Opção 1")),
                const PopupMenuItem(value: "opcao2", child: Text("Opção 2")),
                const PopupMenuItem(value: "opcao3", child: Text("Opção 3")),
              ];
            },
          ), 
        ),

        ListTile( //ListTile nos da uma gama muito grande de personalização, como neste caso criamos um bate papo entre 2 pessoas
          leading: Image.asset(AppImages.profile3),
          title: const Text("Perfil 3"),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Tudo bem e você ?"),
              Text("09:01"),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu){
              if (menu == "opcao2") {}
            },
            itemBuilder: (BuildContext bc){
              return <PopupMenuEntry<String>>[
                const PopupMenuItem(value: "opcao1", child: Text("Opção 1")),
                const PopupMenuItem(value: "opcao2", child: Text("Opção 2")),
                const PopupMenuItem(value: "opcao3", child: Text("Opção 3")),
              ];
            }),
        ),

        
        Image.asset(AppImages.profile1),
        Image.asset(AppImages.profile2),
        Image.asset(AppImages.profile3),
        Image.asset(AppImages.montain1),
        Image.asset(AppImages.montain2),
        Image.asset(AppImages.montain3),
        Image.asset(AppImages.montain4),
      ],
    );
  }
}