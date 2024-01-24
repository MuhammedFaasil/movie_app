import 'dart:ui';

import 'package:flutter/material.dart';

class PositiondWidget extends StatelessWidget {
  final String txt;
  final double top;
  final double right;
  final IconData icons;
  const PositiondWidget(
      {super.key,
      required this.txt,
      required this.top,
      required this.right,
      required this.icons});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        right: right,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.1),
          child: Container(
            width: 50,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 172, 171, 171).withOpacity(0.30),
              // backgroundBlendMode: BlendMode.softLight,
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  txt,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Icon(
                  icons,
                  color: Colors.orange,
                ),
              ],
            )),
          ),
        ));
  }
}
