import 'package:flutter/material.dart';

class GoogleImageWidget extends StatelessWidget {
  final String googleLogo;
  
  const GoogleImageWidget({super.key,required this.googleLogo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 80,
      decoration:  BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  googleLogo))),
    );
  }
}
