import 'dart:io';
import 'dart:typed_data';
import 'package:bestvoyage/screens/others/lignes.dart';
import 'package:bestvoyage/utils/dimensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui' as ui;
import 'package:get/get.dart';



import 'package:bestvoyage/widget/bigText.dart';
import 'package:bestvoyage/widget/smallText.dart';
import 'package:flutter/material.dart';
import 'package:bestvoyage/models/ticket.dart';

import '../../utils/constanst.dart';


class SuccessScreen extends StatefulWidget {

  Ticket ticket;
   SuccessScreen({Key? key,required this.ticket}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {

  final GlobalKey key = GlobalKey();

  Future<String> uploadFile(File file) async {
    FirebaseStorage storage = FirebaseStorage.instance;

    // Create a unique filename for the file
    String filename = DateTime.now().millisecondsSinceEpoch.toString();

    // Get a reference to the file in Firebase Storage
    Reference ref = storage.ref().child('uploads/$filename');

    // Upload the file to Firebase Storage
    UploadTask uploadTask = ref.putFile(file);

    // Wait for the upload to complete and return the download URL
    TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
    String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  Future<File?> captureWidgetAsFile() async {
    try {
      RenderRepaintBoundary boundary = key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: ui.window.devicePixelRatio);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      // ou tout autre répertoire que vous souhaitez utiliser

      Directory? directory = await getExternalStorageDirectory();
      String dirPath = '${directory!.path}/Download';
      Directory dir = Directory(dirPath);
      if (!await dir.exists()) {
        await dir.create();
      }
      final file = File('${directory.path}/monTicket.png');
      print(file.path);
      await file.writeAsBytes(pngBytes);
      return file;
    } catch (e) {
      print(e);

    }
  }
  void myFonction()async{

    final myFile = await captureWidgetAsFile();
    if(myFile != null){
      var url = await uploadFile(myFile);
      if(url != null){
        Ticket ticket = Ticket(
          id_user: widget.ticket.id_user,
          transactionId: widget.ticket.transactionId,
          depart: widget.ticket.depart,
          arrivee: widget.ticket.arrivee,
          firstname: widget.ticket.firstname,
          lastname: widget.ticket.lastname,
          nombre_de_place: widget.ticket.nombre_de_place,
          date: widget.ticket.date,
          heure: widget.ticket.heure,
          createAt: widget.ticket.createAt,
          image: url,);

        var mapTicket = ticket.topMap(ticket);
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        firestore.collection(Constants.TICKET).doc(ticket.transactionId).set(mapTicket);
      }
    }
  }

  @override
  void initState() {
        myFonction();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ticket"),),
      body:  Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  RepaintBoundary(
                    key: key,
                    child: Table(
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
                                        SmallText(text: " id:   ${widget.ticket.transactionId}",size: 13,),
                                        SmallText(text: " Nom:   ${widget.ticket.lastname}",size: 13,),
                                        SmallText(text: " Prénoms:   ${widget.ticket.firstname}",size: 13,),
                                        SmallText(text: " Telephone:   ${widget.ticket.transactionId}",size: 13,),
                                        Container(height: 2,color: Colors.black,width: 130,margin: const EdgeInsets.symmetric(vertical: 5),),
                                        BigText(text: "  INFOS BAGAGE ",size: 13,),
                                        Container(height: 2,color: Colors.black,width: 130,margin: const EdgeInsets.symmetric(vertical: 5),),
                                        SmallText(text: " Telephone: ${widget.ticket.info}",size: 13,),
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
                                        SmallText(text: " Départ: ${widget.ticket.depart}",size: 13,),
                                        SmallText(text: " Arrivée: ${widget.ticket.arrivee}",size: 13,),
                                        SmallText(text: " Place réservée(s): ${widget.ticket.nombre_de_place}",size: 13,),
                                        SmallText(text: " Date : ${widget.ticket.date}",size: 13,),
                                        SmallText(text: " Heure depart: ${widget.ticket.heure}",size: 13,),
                                        Container(height: 2,color: Colors.black,width: Dimensions.screenwidth*0.4,margin: const EdgeInsets.symmetric(vertical: 5),),
                                        QrImage(
                                          data: widget.ticket.transactionId.toString(),
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
                    ),
                  ),

                  const SizedBox(height: 40,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // text color
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15), // padding
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // border radius
                        textStyle: TextStyle(fontSize: 18), // text style
                        elevation: 5,
                      ),
                      onPressed: ()async{
                        myFonction();
                       Get.offAll(()=>LignePage());
                  }, child: SmallText(text: "Sauvegarder et Quitter",color: Colors.white,))
                ],
              )
            )

    );
  }
}
