import 'package:bestvoyage/widget/bigText.dart';
import 'package:bestvoyage/widget/smallText.dart';
import 'package:flutter/material.dart';
import 'package:bestvoyage/models/ticket.dart';

import '../../utils/asset_image_name.dart';

class SuccessScreen extends StatefulWidget {

  Ticket ticket;
   SuccessScreen({Key? key,required this.ticket}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ticket"),),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagesName.background),
                fit: BoxFit.cover
            )
        ),
        child: Center(
          child:

              Table(
                border: const TableBorder(
                    top: BorderSide(width: 2,color: Colors.black),
                    bottom: BorderSide(width: 2,color: Colors.black),
                    left: BorderSide(width: 2,color: Colors.black),
                    right: BorderSide(width: 3,color: Colors.black)),
                children: [
                  TableRow(
                    children: [
                      BigText(text: "BEST VOYAGE")
                    ]
                  ),
                  TableRow(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SmallText(text: "INFORMATION CLIENT",size: 14,),
                          SmallText(text: "INFORMATION VOYAGE",size: 14,)
                        ],
                      )
                    ]
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(height: 2,color: Colors.black,width: 130,margin: const EdgeInsets.symmetric(vertical: 5),),
                                SmallText(text: " id:   ${widget.ticket.transactionId}",size: 13,),
                                SmallText(text: " Nom:   ${widget.ticket.lastname}",size: 13,),
                                SmallText(text: " Prénoms:   ${widget.ticket.firstname}",size: 13,),
                                SmallText(text: " Telephone:   ${widget.ticket.transactionId}",size: 13,),
                                Container(height: 2,color: Colors.black,width: 130,margin: const EdgeInsets.symmetric(vertical: 5),),
                                BigText(text: "  INFOS BAGAGE ",size: 13,),
                                Container(height: 2,color: Colors.black,width: 130,margin: const EdgeInsets.symmetric(vertical: 5),),
                                SmallText(text: " Telephone: ${widget.ticket.info}",size: 13,),
                              ],
                            ),
                            Column(
                              children: [
                                SmallText(text: " Départ: ${widget.ticket.depart}",size: 13,),
                                SmallText(text: " Arrivée: ${widget.ticket.arrivee}",size: 13,),
                                SmallText(text: " Place réservée(s): ${widget.ticket.nombre_de_place}",size: 13,),
                                SmallText(text: " Date voyage: ${widget.ticket.date}",size: 13,),
                                SmallText(text: " Heure depart: ${widget.ticket.heure}",size: 13,),
                                Divider(height: 2,color: Colors.black,),
                              ],
                            )
                          ],
                        ),
                      )
                    ]
                  )
                ],
              )
          ),
      ),
    );
  }
}
