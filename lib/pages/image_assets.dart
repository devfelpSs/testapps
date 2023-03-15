import 'package:flutter/material.dart';
import 'package:testapp/shared/widgets/app_images.dart';

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
          AppImages.profile1,
          height: 50,
          ),
        Image.asset(
          AppImages.profile2,
          height: 50,
          ),
        Image.asset(
          AppImages.profile3,
          height: 50,
          ),
      ],
    );
  }
}