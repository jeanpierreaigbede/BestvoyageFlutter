import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SmallText extends StatelessWidget {
  String text;
  Color color;
  double size;
  bool isCenter;
  int maxLine;
  SmallText({Key? key,required this.text, this.color = Colors.black,this.size = 18,this.isCenter = false,this.maxLine=1}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
      maxLines: maxLine,
      style: GoogleFonts.inter(
          fontSize: size,
          fontWeight: FontWeight.w600,
          color: color,
      ),
    textAlign: isCenter ?TextAlign.center:TextAlign.left,);
  }
}
