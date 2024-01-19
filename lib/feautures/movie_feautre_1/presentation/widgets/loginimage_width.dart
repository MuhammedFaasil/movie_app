import 'package:flutter/material.dart';

class GoogleImageWidget extends StatelessWidget {
  final double height;
  final double width;
  final String googleLogo;
  final BoxFit fit;

  const GoogleImageWidget(
      {super.key,
      required this.googleLogo,
      required this.height,
      required this.width,
      required this.fit
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(googleLogo), fit:fit)),
    );
  }
}
