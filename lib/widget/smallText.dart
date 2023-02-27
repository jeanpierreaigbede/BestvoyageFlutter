import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SmallText extends StatelessWidget {
  String text;
  Color color;
  double size;
  bool isCenter;
  SmallText({Key? key,required this.text, this.color = Colors.black,this.size = 20,this.isCenter = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
      maxLines: 2,
      style: GoogleFonts.inter(
          fontSize: size,
          fontWeight: FontWeight.w600,
          color: color,

      ),
    textAlign: isCenter ?TextAlign.center:TextAlign.left,);
  }
}
