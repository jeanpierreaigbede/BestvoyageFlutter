import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class BigText extends StatelessWidget {
  String text;
  Color color;
  double size;
  bool isCenter;
  int line ;
  BigText({Key? key,required this.text, this.color = Colors.black,this.size = 20,this.isCenter = true, this.line = 1}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
    maxLines: line,
    style: GoogleFonts.inter(
      fontSize: size,
      fontWeight: FontWeight.w800,
        color: color
    ),
      overflow: TextOverflow.ellipsis,
      textAlign: isCenter?TextAlign.center:TextAlign.left ,
    );
  }
}
