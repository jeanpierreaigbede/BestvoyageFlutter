import 'package:bestvoyage/screens/auth/login_page.dart';
import 'package:bestvoyage/utils/asset_image_name.dart';
import 'package:bestvoyage/utils/dimensions.dart';
import 'package:bestvoyage/widget/bigText.dart';
import 'package:bestvoyage/widget/smallText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: (){
          Get.offAll(()=>LoginPage(),transition: Transition.leftToRight);
        },
        child: Container(
          height: Dimensions.screenHeight,
          width: Dimensions.screenwidth,
          padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht20,vertical: Dimensions.height30*1.5),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesName.background),
            fit: BoxFit.cover
          )
        ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Container(
                    child: Column(
                      children: [
                        SmallText(text: "Avec",isCenter: true,),
                        BigText(text: "BEST-VOYAGE",size: Dimensions.fontText25*1.5,),
                        SmallText(text: "voyager en toute sécurité",size: Dimensions.fontText15*0.9,),
                      ],
                    ),
                  ),
                SizedBox(height: Dimensions.height10,),
                Container(
                  height: Dimensions.screenHeight/2,
                  width: Dimensions.screenwidth,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImagesName.bus),
                      fit: BoxFit.contain
                    )
                  ),
                ),
                SizedBox(height: Dimensions.height10,),
                BigText(text: "Touchez l'écran >>>")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
