import 'package:cloud_firestore/cloud_firestore.dart';

class Agence{

  String? nom,ville,address,contact, image;

  Agence({
    required this.ville,
    required this.address,
    required this.contact,
    required this.image
  });


  Agence.fromDocumentSnapShot({required DocumentSnapshot snapshot }){

    ville = snapshot['ville'];
    address = snapshot["address"];
    contact = snapshot['contact'];
    image = snapshot['image'];
  }

}