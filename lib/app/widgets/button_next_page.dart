import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonNext extends StatelessWidget {
  const ButtonNext({super.key,
  required this.boxColor,
  required this.boxText
  });

  final Color boxColor; 
  final String boxText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: boxColor
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(boxText,
        style: GoogleFonts.lato(
          textStyle: const TextStyle(color: Colors.white) )
        ),
      ),
    );
  }
}