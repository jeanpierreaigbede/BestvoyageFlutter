import 'package:cloud_firestore/cloud_firestore.dart';

class Ligne{
  String? depart,arrive;
  int? place,prix;

  Ligne({required this.depart, required this.arrive, required this.prix, required this.place});

  Ligne.formDocumentSnapsho({required DocumentSnapshot document}){
    depart = document['depart'];
    arrive = document['arrivee'];
    prix = document["prix"];
    place = document['place'];
  }
  toMap({required Ligne ligne}){
    return {
      "depart":ligne.depart,
      "arrive":ligne.arrive,
      "place":ligne.place,
      "prix":ligne.prix
    };
  }
}