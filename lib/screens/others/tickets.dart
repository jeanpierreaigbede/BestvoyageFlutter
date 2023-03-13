import 'package:bestvoyage/controllers/ticket_controller.dart';
import 'package:bestvoyage/screens/others/lignes.dart';
import 'package:bestvoyage/utils/dimensions.dart';
import 'package:bestvoyage/widget/smallText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/ticket.dart';
import '../../utils/constanst.dart';
import '../../widget/bigText.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  TicketController ticketController = Get.put(TicketController());
  List<Ticket> mestickets = [];
  bool isLoading = false;

  getTickets()async{
    setState(() {
      isLoading =true;
    });
    if(ticketController.tickets.length>0) {

      final prefs = await SharedPreferences.getInstance();
      var id_user = prefs.getString(Constants.USER_UID);
      List<Ticket> tickets = [];
      for(var tic in ticketController.tickets){
        if(tic.id_user == id_user){
         tickets.add(tic);
        }

      }
      mestickets = tickets;
    }
    setState(() {
      isLoading =false;
    });
  }
  @override
  void initState() {
    getTickets();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Get.to(()=>LignePage());},icon: Icon(Icons.arrow_back),),
        title: SmallText(text: "Mes Tickets",color: Colors.white,),
      ),
          body: Column(
            children: [
             Container(
                    alignment: Alignment.center,
                height: Dimensions.screenHeight/6,
                decoration:const  BoxDecoration(
                  color: Colors.purple
                ),
                child: SmallText(text: "Voici ici vos tickets",color: Colors.white,),
              ),
             Expanded(
               child: Container(
                 margin: const EdgeInsets.only(bottom: 10),
                     decoration: const BoxDecoration(
                       color: Colors.white,
                       //borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft:Radius.circular(20) )
                     ),
                     child: isLoading?Center(child: CircularProgressIndicator(color: Colors.purpleAccent,),):mestickets.length==0?
                     Center(child: SmallText(text: "Vous n'avez encore aucun ticket",)):ListView.builder(
                         itemCount: mestickets.length,
                         itemBuilder: (context,index){
                           return Container(
                             margin: EdgeInsets.symmetric(vertical: 10),
                             child: Image.network(mestickets[index].image!),
                           );
                         })
                 ),

             )
            ],
          ),
    );
  }
}
