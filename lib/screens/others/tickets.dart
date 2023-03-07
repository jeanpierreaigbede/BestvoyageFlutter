import 'package:bestvoyage/controllers/ticket_controller.dart';
import 'package:bestvoyage/utils/dimensions.dart';
import 'package:bestvoyage/widget/smallText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../widget/bigText.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  TicketController ticketController = Get.put(TicketController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SmallText(text: "Mes Tickets",),
      ),
          body: Stack(
            children: [
              Positioned(
                top: 20,
                  left: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                height: Dimensions.screenHeight/4.5,
                decoration: BoxDecoration(
                  color: Colors.purple
                ),
                child: SmallText(text: "Voici ici vos tickets",),
              )),
              Positioned(
                top: Dimensions.screenHeight - Dimensions.screenHeight/4,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft:Radius.circular(20) )
                    ),
                    child: ticketController.tickets==0?
                    SmallText(text: "Vous n'avez encore aucun ticket",):ListView.builder(
                      itemCount: ticketController.tickets.length,
                        itemBuilder: (context,index){
                        return Table(
                          border: const TableBorder(
                              top: BorderSide(width: 2,color: Colors.black),
                              bottom: BorderSide(width: 2,color: Colors.black),
                              left: BorderSide(width: 2,color: Colors.black),
                              right: BorderSide(width: 3,color: Colors.black)),
                          children: [
                            TableRow(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8,top: 8,right: 8),
                                        child: BigText(text: "BEST VOYAGE"),
                                      ),
                                      Container(height: 2,color: Colors.black,width: 130,margin: const EdgeInsets.symmetric(vertical: 5),),
                                    ],
                                  )
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
                                            SmallText(text: " id:   ${ticketController.tickets[index].transactionId}",size: 13,),
                                            SmallText(text: " Nom:   ${ticketController.tickets[index].lastname}",size: 13,),
                                            SmallText(text: " Prénoms:   ${ticketController.tickets[index].firstname}",size: 13,),
                                            SmallText(text: " Telephone:   ${ticketController.tickets[index].transactionId}",size: 13,),
                                            Container(height: 2,color: Colors.black,width: 130,margin: const EdgeInsets.symmetric(vertical: 5),),
                                            BigText(text: "  INFOS BAGAGE ",size: 13,),
                                            Container(height: 2,color: Colors.black,width: 130,margin: const EdgeInsets.symmetric(vertical: 5),),
                                            SmallText(text: " Telephone: ${ticketController.tickets[index]..info}",size: 13,),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 200,
                                          width: 2,
                                          child: Container(
                                            color: Colors.black,
                                            height: 150,
                                            width: 2,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            SmallText(text: " Départ: ${ticketController.tickets[index].depart}",size: 13,),
                                            SmallText(text: " Arrivée: ${ticketController.tickets[index].arrivee}",size: 13,),
                                            SmallText(text: " Place réservée(s): ${ticketController.tickets[index].nombre_de_place}",size: 13,),
                                            SmallText(text: " Date : ${ticketController.tickets[index].date}",size: 13,),
                                            SmallText(text: " Heure depart: ${ticketController.tickets[index].heure}",size: 13,),
                                            Container(height: 2,color: Colors.black,width: Dimensions.screenwidth*0.4,margin: const EdgeInsets.symmetric(vertical: 5),),
                                            QrImage(
                                              data: ticketController.tickets[index].transactionId.toString(),
                                              size: 100,
                                            )

                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ]
                            )
                          ],
                        );
                        })
                  ))
            ],
          ),
    );
  }
}
