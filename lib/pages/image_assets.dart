import 'package:flutter/material.dart';

class ImageAssetsPage extends StatefulWidget {
  const ImageAssetsPage({super.key});

  @override
  State<ImageAssetsPage> createState() => _ImageAssetsPageState();
}

class _ImageAssetsPageState extends State<ImageAssetsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "lib/images/profile2.png",
          height: 50,
          ),
        Image.asset(
          "lib/images/profile3.png",
          height: 50,
          ),
        Image.asset(
          "lib/images/profile1.png",
          height: 50,
          ),
      ],
    );
  }
}