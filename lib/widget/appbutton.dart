import 'package:bestvoyage/widget/bigText.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/dimensions.dart';

class AppButton extends StatefulWidget {
 Color? backgroundColor;
  Widget? child;
 AppButton({Key? key, required this.child, this.backgroundColor = const Color(0xff8359E3)}) : super(key: key);

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height45*1.2,
      width: Dimensions.screenwidth*0.85,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20*0.8)),
          color: AppColors.buttonColor
      ),
      child: widget.child,
    );
  }
}
