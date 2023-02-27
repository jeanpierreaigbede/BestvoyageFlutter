import 'package:bestvoyage/utils/app_colors.dart';
import 'package:bestvoyage/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/asset_image_name.dart';
import '../../widget/bigText.dart';
import '../../widget/smallText.dart';

class LignePage extends StatefulWidget {
  const LignePage({Key? key}) : super(key: key);

  @override
  State<LignePage> createState() => _LignePageState();
}

class _LignePageState extends State<LignePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(onPressed: (){},icon:Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: AppColors.appBarBacmkground,
        title: SmallText(text: "Lignes de voyages ",color: Colors.white,size: Dimensions.fontText15*0.9,),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: Colors.white,)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.calendar_month_sharp,color: Colors.white,)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.menu,color: Colors.white,))
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: Dimensions.height10),
        height: Dimensions.screenHeight,
        width: Dimensions.screenwidth,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImagesName.background),
              fit: BoxFit.cover
          ),
        ),
        child: Column(
          children: [
            Container(
              height: Dimensions.screenHeight/3.5,
              width: Dimensions.screenwidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImagesName.valise),
                    fit: BoxFit.cover
                ),
              ),
            ),
            SmallText(text: "Reserver vos tickets en un clic ",size: Dimensions.fontText15,),
            SizedBox(height: Dimensions.height10,),
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.widtht20),topRight: Radius.circular(Dimensions.widtht20)),
                   color: AppColors.ligneBackgrouund.withOpacity(0.6)
              ),
                  child: Column(
                    children: [
                      SizedBox(height: Dimensions.height10,),
                      Container(
                        height: Dimensions.height45*1.2,
                        width: Dimensions.screenwidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.widtht20),topRight: Radius.circular(Dimensions.widtht20)),

                        ),
                        child:ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                            itemBuilder: (context,index){
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10*0.6,vertical: Dimensions.height5*1.2),
                              margin: EdgeInsets.symmetric(horizontal: Dimensions.widtht10,),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20)),
                                color: Colors.white
                              ),
                              alignment: Alignment.center,
                              child: SmallText(text: "Cotonou-Djougou",size: Dimensions.fontText15,),
                            );
                            }) ,
                      ),
                      SizedBox(height: Dimensions.height10,),
                      Container(
                        height: Dimensions.height100*2.5,
                        width: double.maxFinite,
                        child: ListView.builder(
                          itemCount: 3,
                            itemBuilder: (context,index){
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(

                                      children: [
                                        SmallText(text: 'Heure: 7h00 (Départ)',size: Dimensions.fontText20,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(Icons.place,color: AppColors.buttonColor,),
                                            SizedBox(width: Dimensions.widtht10*0.5,),
                                            SmallText(text: "Cotonou-Djougou",size: Dimensions.fontText15,),
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.person,color: Colors.black,size: 25,),
                                        SmallText(text: "100 Places",size: Dimensions.fontText15,)
                                      ],
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                      SizedBox(height: Dimensions.height10,),
                      Padding(
                        padding: EdgeInsets.only(right: Dimensions.widtht10),
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: BigText(text: 'Prix 7000 FCFA',),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10,vertical: Dimensions.height5),
                        height: Dimensions.height45*1.2,
                        width: Dimensions.screenwidth/2.5,
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(Dimensions.widtht20)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(text: "Réserver",color: Colors.white,size: Dimensions.fontText15,),
                            Icon(Icons.arrow_forward,color: Colors.white,)
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.height5,)
                    ],
                  ),
            ))
          ],
        ),
      ),
    );
  }
}
