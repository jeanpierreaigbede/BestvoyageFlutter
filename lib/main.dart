import 'package:bestvoyage/screens/home/homePage.dart';
import 'package:bestvoyage/screens/others/agence.dart';
import 'package:bestvoyage/screens/others/lignes.dart';
import 'package:bestvoyage/screens/others/reserver_ticket.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' ;
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Colors.purple
      ),
      home: HomePage(),
    );
  }
}
