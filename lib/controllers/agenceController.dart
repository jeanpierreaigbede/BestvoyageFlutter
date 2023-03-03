import 'package:bestvoyage/utils/constanst.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/agence.dart';


class AgenceController extends GetxController{

  @override
  void onReady() {
    _agences.bindStream(getAgences());
    super.onReady();
  }
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Rx<List<Agence>> _agences = Rx<List<Agence>>([]);

  List<Agence> get agences => _agences.value;



  Stream<List<Agence>> getAgences(){
    return firestore.collection(Constants.AGENCES).snapshots()
        .map((QuerySnapshot querySnapshot) {
          List<Agence> agences = [];
          for(var gence in querySnapshot.docs){
            var agen = Agence.fromDocumentSnapShot(snapshot: gence);
            agences.add(agen);
          }
          return agences;
    });
  }
}