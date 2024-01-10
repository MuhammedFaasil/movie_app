import 'package:flutter/material.dart';

class GoogleImageWidget extends StatelessWidget {
  const GoogleImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 80,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'asset/image/2a5758d6-4edb-4047-87bb-e6b94dbbbab0-cover.png'))),
    );
  }
}
