import 'package:bestvoyage/screens/auth/login_page.dart';
import 'package:bestvoyage/screens/auth/register_page.dart';
import 'package:bestvoyage/screens/others/lignes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bestvoyage/utils/constanst.dart';

import '../models/member.dart';
import '../utils/dimensions.dart';
import '../widget/smallText.dart';
import 'package:quickalert/quickalert.dart';

class AuthController extends GetxController{

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Inscription d'un utilisateur

  Future<User?> register(
      String lastName,
      String firstName,
      String email,
      String password,
      String telephone) async{
    try {

      UserCredential userCredential  = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password).then((UserCredential userCredential)async{
          if(userCredential.user!.uid != null){
            final prefs = await SharedPreferences.getInstance();
            Member member = Member(
                uid: userCredential.user!.uid,
                lastName: lastName,
                firstName:firstName ,
                email: email,
                telephone: telephone,
                type: "email");
            var _member = member.toMap(member);
            try {
              firestore.collection("Users").doc(userCredential.user!.uid).set(
                  _member
              ).then((value) async{
                Get.snackbar("Inscription", "Compte crée avec succès");
                prefs.setBool(Constants.IS_CONNECTED, true);
                prefs.setString(Constants.USER_UID, userCredential.user!.uid);
                prefs.setString(Constants.FIRST_NAME, firstName);
                prefs.setString(Constants.LAST_NAME, lastName);
                prefs.setString(Constants.EMAIL, member.email!);
                Get.offAll(()=>LignePage(),transition: Transition.leftToRight);
              });

            } on Exception catch (e) {
              Get.snackbar("Ereur", e.toString());
            }
          }
        return userCredential;
      } );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      Get.back();
      if(e.code == 'weak-password'){
        Get.defaultDialog(
            title: 'Erreur',
            content: SmallText(text: "Le mot de passe est trop faible",),
            contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10,vertical: Dimensions.height5),
            actions: [
              TextButton(onPressed: (){Get.back();}, child: SmallText(text: "OK",color: Colors.red,))
            ]
        );
      }else if(e.code == 'email-already-in-use'){
        Get.defaultDialog(
            title: 'Erreur',
            content: SmallText(text: "Un compte avec cet email existe déja.",),
            contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10,vertical: Dimensions.height5),
            actions: [
              TextButton(onPressed: (){
                Get.offAll(()=>LoginPage(),transition: Transition.rightToLeft);
              }, child: SmallText(text: "Se connecter",color: Colors.red,))
            ]
        );
      }
    }
  }

  // Connexion


  Future<String?> signInWithEmailAndPassword(String email,String password) async{
    try {

      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      Get.back();
      firebaseAuth.userChanges().listen((User? user) async{
        if(user == null){

        }
        else{
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool(Constants.IS_CONNECTED, true);
          firestore.collection(Constants.USERS).doc(userCredential.user!.uid)
          .get().then((DocumentSnapshot documentSnapshot){
            final member = Member.fromDocumentSnapschot(document: documentSnapshot);
            prefs.setString(Constants.USER_UID, userCredential.user!.uid);
            prefs.setString(Constants.FIRST_NAME, member.firstName!);
            prefs.setString(Constants.LAST_NAME, member.lastName!);
            prefs.setString(Constants.EMAIL, member.email!);
            Get.offAll(()=>LignePage(),transition: Transition.zoom);
          });
        }
      });
      return userCredential.user!.uid;

    } on FirebaseAuthException catch (e) {
      Get.back();
      if(e.code == 'user-not-found'){
        Get.defaultDialog(
            title: 'Erreur',
            content: SmallText(text: "Aucun compte n'est relié à a cet email",),
            contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10,vertical: Dimensions.height5),
            actions: [
              TextButton(onPressed: (){Get.offAll(()=>RegisterPage(),transition: Transition.rightToLeft);}, child: SmallText(text: "S'iscrire",color: Colors.red,))
            ]
        );
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
            title: 'Erreur',
            content: SmallText(text: "Mot de passe incorrect",),
            contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10,vertical: Dimensions.height5),
            actions: [
              TextButton(onPressed: (){Get.back();}, child: SmallText(text: "OK",color: Colors.red,))
            ]
        );
      }
    }
  }


}