import 'package:bestvoyage/screens/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/authController.dart';
import '../../utils/app_colors.dart';
import '../../utils/dimensions.dart';
import '../../widget/bigText.dart';
import '../../widget/smallText.dart';


class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  AuthController authController = Get.find();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarBacmkground,
        title: Text('Mot de passe oublié'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              BigText(text: "Veuillez renseignez votre adresse email"),
              SizedBox(height: Dimensions.height20,),
              TextFormField(
                controller: _emailController,
                style: const TextStyle(
                    decoration: TextDecoration.none
                ),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.email),
                    filled: true,
                    fillColor: AppColors.ligneBackgrouund,
                    labelText: 'Email',
                    hintText: 'email'
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'S\'il vous plaît entrer votre email';
                  }
                  return null;
                },
              ),
              SizedBox(height: Dimensions.height20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(Dimensions.widtht10),
                    backgroundColor: AppColors.appBarBacmkground
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await authController.sendPasswordResetEmail(_emailController.text);
                      //Get.snackbar("Mot de passe oublié", "Un lien de réinitialisation de mot de passe a été envoyé à votre adresse email");
                      Get.defaultDialog(
                          title: "Réinitilisation",
                          content: SmallText(text: "Un lien de réinitialisation de mot de passe a été envoyé à votre adresse email"),
                          confirm: InkWell(
                            onTap: (){
                              Get.offAll(()=>LoginPage());
                            },
                            child: BigText(text: "Ok",),
                          )
                      );
                    } catch (e) {
                      Get.snackbar("", 'Erreur lors de l\'envoi du courriel: $e');
                    }
                  }
                },
                child: BigText(text:'Envoyer', color: Colors.white,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}