import 'dart:math';

import 'package:bestvoyage/utils/app_colors.dart';
import 'package:bestvoyage/utils/asset_image_name.dart';
import 'package:bestvoyage/utils/dimensions.dart';
import 'package:bestvoyage/widget/bigText.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';


import '../../widget/smallText.dart';



class ReserverTicket extends StatefulWidget {
  const ReserverTicket({Key? key}) : super(key: key);

  @override
  State<ReserverTicket> createState() => _ReserverTicketState();
}

class _ReserverTicketState extends State<ReserverTicket> {
  TextEditingController baggageInfoController = TextEditingController();

  DateTime? dateTime ;
  List<String> departs = ['cotonou',"Bohicon","Grand popo"];
  List<String> arrivals = ['cotonou',"Bohicon","Grand popo"];
  List<String> herureDepart = ['07h00',"12h30","17h30"];
  List<String> preferences = ['cotonou',"Bohicon","Grand popo"];

  _showDatePicker(){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025)
    ).then((value){
      setState(() {
        dateTime = value!;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarBacmkground,
        leading: IconButton(onPressed: (){

        },icon: const Icon(Icons.arrow_back,color: Colors.white,),),
        title: SmallText(text: "Reserver un billet ",color: Colors.white,size: Dimensions.fontText15,),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: Colors.white,)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.menu,color: Colors.white,)),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesName.background),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          children: [
            SizedBox(height: Dimensions.height20,),
            BigText(text: "Renseignez-nous...",size: Dimensions.fontText25,isCenter: true,),
           SizedBox(height: Dimensions.height20,),
           Expanded(
               child: Container(
                 padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht20),
                 decoration: BoxDecoration(
                     color: AppColors.ligneBackgrouund.withOpacity(0.5),
                   borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.widtht20),topLeft:  Radius.circular(Dimensions.widtht20))
                 ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BigText(text: 'Information générale'),
                    const SizedBox(height: 10,),
                     Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [


                            //Lieu d'embarquement
                           
                            SmallText(text: "Lieu d'embarquement",isCenter: false,),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10),
                              height: Dimensions.height45,
                              width:double.maxFinite,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20)),
                                boxShadow: [
                                  BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.2),offset: Offset(0,-1)),
                                 // BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.1),offset: Offset(-1,-1))
                                ]
                              ),
                              child: DropdownButtonFormField(
                                hint: SmallText(text: "Choisissez le lieu de départ",size: Dimensions.fontText15*0.7,isCenter: true,),
                                decoration: InputDecoration(
                                border: InputBorder.none
                              ),
                                items: departs.map((e) => DropdownMenuItem(
                                  value: e,
                                    child: Text(e))).toList(),
                                    onChanged: (value){
                                  print(value);

                                },
                              )
                            ),


                            //L'heure de départ

                            SmallText(text: "L'heure de départ",isCenter: false,),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10),
                                height: Dimensions.height45,
                                width:double.maxFinite,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20)),
                                    boxShadow: [
                                      BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.2),offset: Offset(0,-1)),
                                      // BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.1),offset: Offset(-1,-1))
                                    ]
                                ),
                                child: DropdownButtonFormField(
                                  hint: SmallText(text: "Choisissez l'heure de départ",size: Dimensions.fontText15*0.7,isCenter: true,),
                                  decoration: InputDecoration(
                                      border: InputBorder.none
                                  ),
                                  items: herureDepart.map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e))).toList(),
                                  onChanged: (value){
                                    print(value);
                                  },
                                )
                            ),
                            SizedBox(height: Dimensions.height5,),


                            //Lieu dde debarquement

                            SmallText(text: "Lieu de  debarquement",isCenter: false,),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10),
                                height: Dimensions.height45,
                                width:double.maxFinite,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20)),
                                    boxShadow: [
                                      BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.2),offset: Offset(0,-1)),
                                      // BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.1),offset: Offset(-1,-1))
                                    ]
                                ),
                                child: DropdownButtonFormField(
                                  hint: SmallText(text: "Choisissez le lieu d'arrivé",size: Dimensions.fontText15*0.7,isCenter: true,),
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                  ),
                                  items: arrivals.map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e))).toList(),
                                  onChanged: (value){
                                    print(value);

                                  },
                                )
                            ),

                            //Date de voyage

                            SmallText(text: "Date de voyage",isCenter: false,),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10),
                              height: Dimensions.height45,
                              width:double.maxFinite,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20)),
                                  boxShadow: [
                                    BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.2),offset: Offset(0,-1)),
                                    // BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.1),offset: Offset(-1,-1))
                                  ]
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SmallText(text: dateTime!=null?"${dateTime!.day.toString()}/${dateTime!.month.toString()}/${dateTime!.year.toString()}":'choisissez la date du voyage',size: Dimensions.fontText15*0.8,),
                                  IconButton(
                                      onPressed: _showDatePicker,
                                      icon: Icon(Icons.date_range_rounded,))
                                ],
                              ),
                            ),

                            //Préférences

                            SmallText(text: "Préférence de place",isCenter: false,),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10),
                                height: Dimensions.height45,
                                width:double.maxFinite,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20)),
                                    boxShadow: [
                                      BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.2),offset: Offset(0,-1)),
                                      // BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.1),offset: Offset(-1,-1))
                                    ]
                                ),
                                child: DropdownButtonFormField(
                                  hint: SmallText(text: "préférence de place",size: Dimensions.fontText15*0.7,isCenter: true,),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  items: preferences.map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e))).toList(),
                                  onChanged: (value){
                                    print(value);
                                  },
                                )
                            ),

                            //Places

                            SmallText(text: "Nombre de place",size: Dimensions.fontText15*0.8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: Dimensions.height100*0.6,
                                  width: Dimensions.screenwidth/3,
                                  padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20)),
                                      boxShadow: [
                                        BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.1),offset: Offset(0,-1)),
                                        // BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.1),offset: Offset(-1,-1))
                                      ]
                                  ),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SmallText(text: "-"),
                                      BigText(text: "0"),
                                      SmallText(text: "+")
                                    ],
                                  ),
                                ),
                                Container(
                                  height: Dimensions.height100*0.6,
                                  width: Dimensions.screenwidth/2,
                                  padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20)),
                                      boxShadow: [
                                        BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.1),offset: Offset(0,-1)),
                                        // BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.1),offset: Offset(-1,-1))
                                      ]
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SmallText(text: "Disponible:"),
                                      BigText(text: "20"),
                                    ],
                                  ),
                                )
                              ],
                            ),

                            //Informations Baggages

                            SmallText(text: "Infos baggages"),
                            Container(
                              alignment: Alignment.center,
                              height: Dimensions.height100*1.1,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20)),
                                  boxShadow: [
                                    BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.3),offset: Offset(0,-1)),
                                    // BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.1),offset: Offset(-1,-1))
                                  ]
                              ),
                              padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10),
                              child: TextFormField(
                                controller: baggageInfoController,
                               maxLines: 3,
                               decoration: const InputDecoration(
                                 border: OutlineInputBorder(),
                                 fillColor: Colors.white,
                                 filled: true,
                                 hintText: "Courte information sur les baggages si vous en disposez"
                               ),
                              ),
                            ),

                            //Bouttons de réservation

                            InkWell(
                              onTap: (){
                                showDialog(context: context,
                                    builder: (context){
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20))
                                      ),
                                      child: Container(
                                        height: MediaQuery.of(context).size.height*0.5,
                                        width: double.maxFinite,
                                        padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20)),
                                            boxShadow: [
                                              BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.1),offset: Offset(0,-1)),
                                              // BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.1),offset: Offset(-1,-1))
                                            ]
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                SizedBox(width: Dimensions.widtht20,),
                                                BigText(text: "Paiement",size: Dimensions.fontText25,),
                                                IconButton(onPressed: (){
                                                  Get.back();
                                                }, icon: Icon(Icons.close,size: 40,))
                                              ],
                                            ),
                                            SizedBox(height: Dimensions.height10,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  height: 50,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    color: Colors.red
                                                  ),
                                                ),
                                                Container(
                                                  height: 50,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                      color: Colors.red
                                                  ),
                                                ),
                                                Container(
                                                  height: 50,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                      color: Colors.red
                                                  ),
                                                )
                                              ],
                                            ),
                                            SmallText(text: "Faites vos paiements en toute sécurité",size: Dimensions.fontText15*0.8,),
                                            Container(
                                              height: Dimensions.height45*1.3,
                                              width: Dimensions.screenwidth*0.8,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20)),
                                                  boxShadow: [
                                                    BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.1),offset: Offset(0,-1)),
                                                    // BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.1),offset: Offset(-1,-1))
                                                  ]
                                              ),
                                              child: InternationalPhoneNumberInput(
                                                onInputChanged: (PhoneNumber value) {  },

                                              ),
                                            ),
                                            BigText(text: "Prix:7000f*5",size: Dimensions.fontText15,),
                                            BigText(text: "Total: 25452",size: Dimensions.fontText20,),
                                            Container(
                                              alignment: Alignment.center,
                                              height: Dimensions.height45,
                                              width: double.maxFinite,
                                              margin: EdgeInsets.symmetric(vertical: Dimensions.height10),
                                              decoration: BoxDecoration(
                                                  color: AppColors.buttonColor,
                                                  borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20)),
                                                  boxShadow: [
                                                    BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.2),offset: Offset(0,-1)),
                                                    // BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.1),offset: Offset(-1,-1))
                                                  ]
                                              ),
                                              padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10),
                                              child: SmallText(text: "Terminez",),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                              },
                                );
                                },
                              child: Container(
                                alignment: Alignment.center,
                                height: Dimensions.height45,
                                width: double.maxFinite,
                                margin: EdgeInsets.symmetric(vertical: Dimensions.height10),
                                decoration: BoxDecoration(
                                  color: AppColors.buttonColor,
                                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20)),
                                    boxShadow: [
                                      BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.2),offset: Offset(0,-1)),
                                      // BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.1),offset: Offset(-1,-1))
                                    ]
                                ),
                                padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10),
                                child: SmallText(text: "Terminez",),
                              ),
                            )


                          ],
                        ),
                      ),

                  ],
                ),
              ),
           ))
          ],
        )
      ),
    );
  }


}
