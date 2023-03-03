import 'package:firebase_auth/firebase_auth.dart';
import 'package:bestvoyage/controllers/ligneController.dart';
import 'package:bestvoyage/screens/home/treserverApp.dart';
import 'package:bestvoyage/utils/app_colors.dart';
import 'package:bestvoyage/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/ligne.dart';
import '../../utils/asset_image_name.dart';
import '../../utils/constanst.dart';
import '../../widget/bigText.dart';
import '../../widget/smallText.dart';

class LignePage extends StatefulWidget {
  const LignePage({Key? key}) : super(key: key);

  @override
  State<LignePage> createState() => _LignePageState();
}

class _LignePageState extends State<LignePage> {
  LigneController lineController = Get.put(LigneController());

  List<Ligne> lines =[];

  bool isLoading = false;

  void getLines()async{

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarBacmkground,
        title: SmallText(text: "Lignes de voyages ",color: Colors.white,size: Dimensions.fontText15*0.9,),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: Colors.white,)),
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
                child: Obx(()=>Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.widtht20),topRight: Radius.circular(Dimensions.widtht20)),
                      color: AppColors.ligneBackgrouund.withOpacity(0.6)
                  ),
                  child: lineController.lines.length ==0? Center(child: CircularProgressIndicator(color: Colors.purple,),):Column(
                    children: [
                      Expanded(child:
                      ListView.builder(
                        itemCount: lineController.lines.length,
                          itemBuilder: (context,index){
                          return InkWell(
                            onTap: (){
                              Get.to(()=>ReserverApp(depart: lineController.lines[index].depart, arrivee:  lineController.lines[index].arrive,prix: lineController.lines[index].prix!,),transition: Transition.rightToLeft,);
                            },
                            child: Container(
                              height: Dimensions.height100,
                              width: Dimensions.screenwidth*0.8,
                              padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10,vertical: Dimensions.height5),
                              margin: EdgeInsets.symmetric(horizontal: Dimensions.widtht10,vertical: Dimensions.height5),
                              decoration: BoxDecoration(
                                color: Colors.purple.withOpacity(0.3)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  BigText(text: "${lineController.lines[index].depart} ---|--- ${lineController.lines[index].arrive}"),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SmallText(text: "Prix: ${lineController.lines[index].prix} f"),
                                      SmallText(text: "Durée :2h")
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: Dimensions.height45*0.7,
                                    width: Dimensions.screenwidth*0.8,
                                    decoration: BoxDecoration(
                                      color: Colors.purple,
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: SmallText(text: "Réserver maintemaint",color: Colors.white,),
                                  )
                                ],
                              ),
                            ),
                          );
                          }
                      ))
                    ],
                  )
                )
                ))
          ],
        ),
      ),
      drawer: Drawer(
        elevation: 10,
        backgroundColor: Color(0xffE5C2F8),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Dimensions.height100*1.5,child: Center(child: BigText(text: "MENU",),),),
              Divider(height: 20,color: Colors.black,),
             TextButton(onPressed: (){
              Get.offAll(()=>LignePage());
                }, child: SmallText(text: "Nos Lignes",isCenter: false,)),
              Divider(height: 20,color: Colors.black,),
              TextButton(onPressed: (){

              }, child: SmallText(text: "Reserver un ticket",isCenter: false,)),
              Divider(height: 20,color: Colors.black,),
              TextButton(onPressed: (){

              }, child: SmallText(text: "Vos tickets",isCenter: false,)),
              Divider(height: 20,color: Colors.black,),
              TextButton(onPressed: (){

              }, child: SmallText(text: "Nos Agences",isCenter: false,)),
              Divider(height: 20,color: Colors.black,),
              TextButton(onPressed: (){

              }, child: SmallText(text: "Profil",isCenter: false,)),
              Divider(height: 20,color: Colors.black,),
              TextButton(onPressed: ()async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool(Constants.IS_CONNECTED, false);
                prefs.setString(Constants.LAST_NAME, "");
                prefs.setString(Constants.FIRST_NAME, "");
                prefs.setString(Constants.USER_UID, "");
                FirebaseAuth auth = FirebaseAuth.instance;
                 await auth.signOut();
              }, child: SmallText(text: "Déconnexion",isCenter: false,)),
              Divider(height: 20,color: Colors.black,),
            ],
          ),
        ),
      ),
    );
  }
}

/*
* children: [
                      SizedBox(height: Dimensions.height10,),
                      Container(
                        height: Dimensions.height45*1.2,
                        width: Dimensions.screenwidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.widtht20),topRight: Radius.circular(Dimensions.widtht20)),

                        ),
                        child:ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: lineController.lines.length,
                            itemBuilder: (context,index){
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10*0.6,vertical: Dimensions.height5*1.2),
                                margin: EdgeInsets.symmetric(horizontal: Dimensions.widtht10,),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20)),
                                    color: Colors.white
                                ),
                                alignment: Alignment.center,
                                child: SmallText(text: "${lineController.lines[index].depart} - ${lineController.lines[index].arrive}",size: Dimensions.fontText15,),
                              );
                            }) ,
                      ),
                      SizedBox(height: Dimensions.height10,),
                      Container(
                        height: Dimensions.height100*2.5,
                        width: double.maxFinite,
                        child: ListView.builder(
                            itemCount: lineController.lines.length,
                            itemBuilder: (context,index){
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(

                                      children: [
                                        SmallText(text: 'Heure: 7h00 (Départ)',size: Dimensions.fontText15,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(Icons.place,color: AppColors.buttonColor,),
                                            SizedBox(width: Dimensions.widtht10*0.5,),
                                            SmallText(text: "Cotonou-Djougou",size: Dimensions.fontText15*0.6,),
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.person,color: Colors.black,size: 25,),
                                        SmallText(text: "${lineController.lines[index].place} places",size: Dimensions.fontText15,)
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
                          child: BigText(text: 'Prix ${} FCFA',),
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
                    ],*/
