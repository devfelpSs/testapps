import 'package:flutter/material.dart';
import 'package:testapp/model/card_detail.dart';

class CardDetailPage extends StatelessWidget {
  final CardDetail cardDetail;
  const CardDetailPage({Key? key, required this.cardDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardDetail.id,
      child: SafeArea(
        child: Scaffold(
          //appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: const Icon(Icons.close)),
              Row(
                children: [
                  Image.network(
                    cardDetail.url,
                    height: 100,
                  ),
                ],
              ),
              Text(
                cardDetail.title,
                style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Text(cardDetail.text,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black)),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}