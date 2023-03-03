import 'package:cloud_firestore/cloud_firestore.dart';

class Ticket {

  String? depart, arrivee, firstname, lastname;
  int? nombre_de_place;
  String? info, preference;
  String? date, heure, id_user, createAt, transactionId;

  Ticket({
    required this.id_user,
    required this.transactionId,
    required this.depart,
    required this.arrivee,
    required this.firstname,
    required this.lastname,
    required this.nombre_de_place,
    required this.date,
    required this.heure,
    required this.createAt,
    this.info,
    this.preference,
  });

  Ticket.fromDocumentSnapShot({required DocumentSnapshot document}){
    depart = document['depart'];
    arrivee = document['arrivee'];
    lastname = document['lastname'];
    date = document['date'];
    info = document['info'];
    preference = document['preference'];
    transactionId = document['transactionId'];
    nombre_de_place = document['nombre_de_place'];
  }

  topMap(Ticket ticket) {
    return {
    "depart":ticket.depart,
    "arrivee":ticket.arrivee,
    "lastname":ticket.lastname,
    "firstname":ticket.firstname,
    "date":ticket.date,
    "info":ticket.info,
      "transactionId":ticket.transactionId,
    "nombre_de_place":ticket.heure
  };
  }
}