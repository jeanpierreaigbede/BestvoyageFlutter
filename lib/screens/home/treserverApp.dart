import 'package:bestvoyage/models/ticket.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kkiapay_flutter_sdk/kkiapay/view/widget_builder_view.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../utils/app_colors.dart';
import '../../utils/asset_image_name.dart';
import '../../utils/dimensions.dart';
import '../../widget/bigText.dart';
import '../../widget/smallText.dart';
import 'package:get/get.dart';
import 'package:bestvoyage/utils/constanst.dart';

import '../others/success.dart';

class ReserverApp extends StatefulWidget {
  String? depart,arrivee;
  int prix;
ReserverApp({Key? key, required this.depart, required this.arrivee, required this.prix}) : super(key: key);

  @override
  State<ReserverApp> createState() => _ReserverAppState();
}

class _ReserverAppState extends State<ReserverApp> {

  final formKey = GlobalKey<FormState>();

  TextEditingController baggageInfoController = TextEditingController();
  List<String> herureDepart = ['07h00',"12h30","17h30"];

  List<String> preferences = ['coté chauffeur',"derrière"];
  int nombre_place = 1;
  String? time ;
  bool paimentway = true;
  DateTime? dateTime;
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
  void successCallback(response, context)  async {
    final prefs = await SharedPreferences.getInstance();

   final now = DateTime.now();
    Ticket ticket = Ticket(id_user: prefs.getString(Constants.USER_UID),transactionId:response['transactionId'] , depart: widget.depart, arrivee: widget.arrivee, firstname: prefs.getString(Constants.FIRST_NAME), lastname: prefs.getString(Constants.LAST_NAME), nombre_de_place: nombre_place, date: "${dateTime!.year}-${dateTime!.month}-${dateTime!.day}", heure: time, createAt: now.toString());
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SuccessScreen(
              ticket: ticket,
          )),
    );
  }

  void setplace(bool place){
    if(place){
      setState(() {
        nombre_place = nombre_place+1;
      });
    }else{
      if(nombre_place -1 <1){
        Get.snackbar("Erreur", "Vous ne pouvez pas réduire plus",backgroundColor: Colors.black,colorText: Colors.white);
      }else{
        setState(() {
          nombre_place = nombre_place-1;
        });
      }

    }
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
                    alignment: Alignment.center,
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
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                //Lieu d'embarquement

                                SmallText(text: "Lieu d'embarquement",isCenter: false,),
                                Container(
                                    alignment: Alignment.centerLeft,
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
                                    child: SmallText(text: widget.depart!,)
                                ),

                                // le lieu de débarquement
                                SmallText(text: "Lieu de  debarquement",isCenter: false,),
                                Container(
                                    alignment: Alignment.centerLeft,
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
                                    child: SmallText(text: widget.arrivee!,)
                                ),

                                //Date de voyage

                                SmallText(text: "Date de voyage",isCenter: false,),
                                Container(
                                  alignment: Alignment.center,
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

                                //L'heure de départ

                                SmallText(text: "L'heure de départ",isCenter: false,),
                                Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10),
                                    height: Dimensions.height45*1.5,
                                    width:double.maxFinite,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20)),
                                        boxShadow: [
                                          BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.2),offset: Offset(0,-1)),
                                          // BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.1),offset: Offset(-1,-1))
                                        ]
                                    ),
                                    child: DropdownButtonFormField(
                                      value: time,
                                      hint: SmallText(text: "Choisissez l'heure de départ",size: Dimensions.fontText15*0.7,isCenter: true,),
                                      decoration: const InputDecoration(
                                          border: InputBorder.none
                                      ),
                                      items: herureDepart.map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e))).toList(),
                                      onChanged: (value){
                                        print(value);
                                        setState(() {
                                          time = value;
                                        });
                                      },
                                      validator: (value) {
                                        return value == null || value == "" ? "Ce champs est obligatoire" : null;
                                      },
                                    )
                                ),
                                SizedBox(height: Dimensions.height5,),

                                //Préférences

                                SmallText(text: "Préférence de place",isCenter: false,),
                                Container(
                                    alignment: Alignment.center,
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

                                Visibility(
                                  visible: (dateTime != null && time != null),
                                  replacement: Container(
                                    alignment: Alignment.center,
                                    height: Dimensions.height100,
                                    width: double.maxFinite,
                                    child: SmallText(text: "Veuillez la date et l'heure avant de continuer",isCenter: true,),
                                  ),
                                  child: Column(
                                    children: [
                                      SmallText(text: "Nombre de place",size: Dimensions.fontText15*0.8,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
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
                                                InkWell(
                                                  onTap:(){
                                                    setplace(false);
                                                  },
                                                    child: SmallText(text: "-")),
                                                BigText(text: "$nombre_place"),
                                                InkWell(
                                                  onTap: (){
                                                    setplace(true);
                                                  },
                                                    child: SmallText(text: "+"),)
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
                                        onTap: ()async{
                                          if(formKey.currentState!.validate() && dateTime!= null){

                                            showDialog(context: context,
                                              builder: (BuildContext context){
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
                                                              decoration:  BoxDecoration(
                                                                image: DecorationImage(
                                                                    image: AssetImage(ImagesName.mtnmomo),
                                                                  fit: BoxFit.cover
                                                                ),

                                                              ),
                                                            ),
                                                            Container(
                                                              height: 50,
                                                              width: 80,
                                                              decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                    image: AssetImage(ImagesName.visa),
                                                                    fit: BoxFit.cover
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 50,
                                                              width: 80,
                                                              decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                    image: AssetImage(ImagesName.moovmomo),
                                                                    fit: BoxFit.cover
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(height: Dimensions.height10,),
                                                      Text( "Faites vos paiements en toute sécurité ",
                                                        textAlign: TextAlign.center,
                                                        style: GoogleFonts.inter(
                                                          fontSize: Dimensions.fontText15*0.8,
                                                          fontWeight: FontWeight.w600
                                                        ),
                                                        ),

                                                        Container(
                                                            height: Dimensions.height100*1.8,
                                                            width: Dimensions.screenwidth*0.8,
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20)),
                                                                boxShadow: [
                                                                  BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.2),offset: Offset(0,-1)),
                                                                  // BoxShadow(blurRadius: 2.3,color: AppColors.buttonColor.withOpacity(0.1),offset: Offset(-1,-1))
                                                                ]
                                                            ),
                                                            child: Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                children: [
                                                                  /*Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                    children: [
                                                                      SmallText(text: "Nom: "),
                                                                      SmallText(text: "$name")
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                    children: [
                                                                      SmallText(text: "Prénom(s): "),
                                                                      SmallText(text: "$firstname")
                                                                    ],
                                                                  ),*/
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      SmallText(text: "nbre de ticket: "),
                                                                      SmallText(text: "$nombre_place  ")
                                                                    ],
                                                                  ),
                                                                  Divider(height: 7,color: Colors.black54,),
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      BigText(text: "total: "),
                                                                      SmallText(text: "${nombre_place*widget.prix}")
                                                                    ],
                                                                  ),
                                                                  Divider(height:  7,color: Colors.black54,),

                                                                  //SmallText(text: "Paiement possible par mobile money et carte banquaire"),
                                                                 /* Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      Container(
                                                                        width: Dimensions.screenwidth*0.3,
                                                                        child: Column(
                                                                          children: [
                                                                            SmallText(text: "Mobile Money",maxLine: 2,),
                                                                            Radio(
                                                                                value: true,
                                                                                groupValue: paimentway,
                                                                                onChanged: (value){
                                                                                  setState(() {
                                                                                    paimentway = value!;
                                                                                  });
                                                                                }
                                                                                )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: Dimensions.screenwidth*0.3,
                                                                        child: Column(
                                                                          children: [
                                                                            SmallText(text: "Carte Banquaire",maxLine: 2,),
                                                                            Radio(
                                                                                value: false,
                                                                                groupValue: paimentway,
                                                                                onChanged: (value){
                                                                                  setState(() {
                                                                                    paimentway = value!;
                                                                                  });
                                                                                })
                                                                          ],
                                                                        ),
                                                                      )
                                                                    ],
                                                                  )*/
                                                                ],
                                                              ),
                                                            )
                                                          ),

                                                        InkWell(
                                                          onTap: ()async{
                                                            final prefs = await SharedPreferences.getInstance();
                                                            final email = prefs.getString(Constants.EMAIL);
                                                            final name = prefs.getString(Constants.FIRST_NAME)! + prefs.getString(Constants.LAST_NAME)!;
                                                            final kkiapay = KKiaPay(
                                                                amount: 100,
                                                                countries: ["BJ","TG","SN","CI"],
                                                                phone: "22961000000",
                                                                name: name,
                                                                email: email,
                                                                reason: 'Achat de ticket pour Best Voyage',
                                                                data: 'Fake data',
                                                                sandbox: true,
                                                                apikey: '197981809acd11ed84eb8bf4616359f3',
                                                                callback: successCallback,
                                                                theme: "#E5C2F8", // Ex : "#222F5A",
                                                                partnerId: 'AxXxXXxId',
                                                                paymentMethods:["momo","card"]
                                                            );

                                                            Navigator.push(context, MaterialPageRoute(builder: (context){
                                                              return kkiapay;
                                                            }));
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
                                                            child: SmallText(text: "Passer au paiement",color: Colors.white,),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          }else if(dateTime == null){

                                          }
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
                                      ),
                                    ],
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
