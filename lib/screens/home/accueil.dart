import 'package:bestvoyage/widget/smallText.dart';
import 'package:flutter/material.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              "Connectez avec succès"
            ),

            ElevatedButton(onPressed: (){}, child: SmallText(text: "Se connecter",))
          ],
        ),

      ),
    );
  }
}
