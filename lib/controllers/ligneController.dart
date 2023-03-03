import 'package:bestvoyage/utils/constanst.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/ligne.dart';

class LigneController extends GetxController{
  final firestore = FirebaseFirestore.instance;

  Rx<List<Ligne>> _lignes = Rx<List<Ligne>>([]);
  List<Ligne> get lines => _lignes.value;

  @override
  void onReady() {
    _lignes.bindStream(getLignes());
    super.onReady();
  }




  Stream<List<Ligne>> getLignes(){

    return firestore.collection(Constants.LIGNE).snapshots()
        .map((QuerySnapshot querySnapshot){
          print("bon je suis là");
          List<Ligne> lignes = [];
          for(var line in querySnapshot.docs){
            final l = Ligne.formDocumentSnapsho(document: line);
            print(l.depart);
            lignes.add(l);
          }
          return lignes;
    });
  }
}