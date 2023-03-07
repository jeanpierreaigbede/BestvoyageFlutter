

import 'package:bestvoyage/models/ticket.dart';
import 'package:bestvoyage/utils/constanst.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class TicketController extends GetxController{


  Rx<List<Ticket>> _tickets = Rx<List<Ticket>>([]);

  List<Ticket> get tickets =>_tickets.value;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onReady() {
    _tickets.bindStream(getTicket());
    super.onReady();
  }

  Stream<List<Ticket>> getTicket(){

    return firestore.collection(Constants.TICKET).snapshots()
        .map((QuerySnapshot snapshot){
          List<Ticket> ticketsDosc = [];
          for(var tic in snapshot.docs){
            Ticket tick = Ticket.fromDocumentSnapShot(document: tic);
            ticketsDosc.add(tick);
          }
          return ticketsDosc;
    } );
  }
}