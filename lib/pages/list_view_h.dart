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