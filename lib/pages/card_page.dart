import 'package:flutter/material.dart';
import 'package:testapp/pages/card_detail.dart';
import 'package:testapp/repositories/card_detail_repository.dart';

import '../model/card_detail.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

//Stateless também não pode ter async

class _CardPageState extends State<CardPage> {
  CardDetail? cardDetail;
  CardDetailRepository cardDetailRepository = CardDetailRepository();

@override
  void initState(){ //init state não pode ter async
    super.initState();
    carregarDados();
  }

void carregarDados() async {
  cardDetail = await cardDetailRepository.get();
  if (mounted){
    setState(() {});
  }
}


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: double.infinity,
          child: cardDetail == null ? const LinearProgressIndicator() : InkWell( // "?" é igual a "então", e ":" é senão
            onTap: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => CardDetailPage(
                cardDetail: cardDetail!,
              )));
            },
            child: Hero(
              tag: cardDetail!.id,
              child: Card(
                color: Colors.grey[900], // cor de fundo do Card
                elevation: 8, //indica como se o componente estivesse a frente, fazendo uma sombra
                shadowColor: Colors.grey, //adicionando cor a sombra
                child: Padding( padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            cardDetail!.url,  
                            height: 20,
                          ),
                          Text(
                            cardDetail!.title, 
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white)),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerRight,
                        child: TextButton(onPressed: (){}, child: const Text("Ler Mais",
                        style: TextStyle(decoration: TextDecoration.underline),
                        )))
                    ], 
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}