import 'package:bestvoyage/controllers/authController.dart';
import 'package:bestvoyage/screens/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../../utils/asset_image_name.dart';
import '../../utils/dimensions.dart';
import '../../widget/appbutton.dart';
import '../../widget/bigText.dart';
import '../../widget/smallText.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../others/lignes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthController authController = Get.put(AuthController());

  TextEditingController lastNameController =TextEditingController();
  TextEditingController telephoneController =TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey= GlobalKey<FormState>();


  bool isObscure = true;
  bool isValitedPhoneNumber = false;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    emailController.dispose();
    telephoneController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: Dimensions.screenHeight,
        width: Dimensions.screenwidth,
        padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10*0.4),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImagesName.background),
              fit: BoxFit.cover
          ),),
        child:Stack(
          children: [
            Positioned(
              top:Dimensions.height45,
                left: 10,
                right: 10,
                child:Column(
                  children: [
                    BigText(text: 'Inscrivez-vous ',size: Dimensions.fontText25,),
                    SizedBox(height: Dimensions.height10,),
                    Container(
                      height: Dimensions.height100*2.1,
                      width: Dimensions.screenwidth*0.9,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(ImagesName.station),
                              fit: BoxFit.contain
                          )
                      ),
                    ),
                  ],
                )),
            Positioned(
              top: Dimensions.screenHeight/2.6,
                bottom: 10,
                left: 10,right: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal:Dimensions.widtht10,vertical: Dimensions.height5),
                  height:Dimensions.screenHeight/1.7,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.widtht15,),
                      color: Colors.white
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(text: "Inscription",size: Dimensions.fontText25,),
                        SizedBox(height: Dimensions.height10,),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              // Nom
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20*0.8)),
                                    boxShadow: const [
                                      BoxShadow(color: Colors.black12)
                                    ]
                                ),
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  cursorHeight: 20,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      decoration: TextDecoration.none
                                  ),
                                  controller: lastNameController,
                                  keyboardType: TextInputType.text,
                                  decoration:  InputDecoration(
                                      hintText: "Nom",
                                      hintStyle: GoogleFonts.poppins(
                                        fontSize: Dimensions.fontText15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      border: InputBorder.none
                                  ),
                                  validator: (value){
                                    return value == null || value == "" ? "Ce champs est obligatoire" : null;
                                  },
                                ),
                              ),

                              SizedBox(height: Dimensions.height5,),

                              // Prenom

                              Container(
                                padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20*0.8)),
                                    boxShadow: const [
                                      BoxShadow(color: Colors.black12)
                                    ]
                                ),
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  cursorHeight: 20,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      decoration: TextDecoration.none
                                  ),
                                  controller: firstNameController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration:  InputDecoration(
                                      hintText: "Prenom",
                                      hintStyle: GoogleFonts.poppins(
                                        fontSize: Dimensions.fontText15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      border: InputBorder.none
                                  ),
                                  validator: (value){
                                    return value == null || value == "" ? "Ce champs est obligatoire" : null;
                                  },
                                ),
                              ),

                              SizedBox(height: Dimensions.height10,),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20*0.8)),
                                    boxShadow: const [
                                      BoxShadow(color: Colors.black12)
                                    ]
                                ),
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  cursorHeight: 20,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      decoration: TextDecoration.none
                                  ),
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration:  InputDecoration(
                                      hintText: "Email",
                                      hintStyle: GoogleFonts.poppins(
                                        fontSize: Dimensions.fontText15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      border: InputBorder.none
                                  ),
                                  validator: (value){
                                    return value == null || value == "" || !value.isEmail? "Ce champs est obligatoire" : null;
                                  },
                                ),
                              ),
                              SizedBox(height: Dimensions.height10,),
                              // Telephone
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20*0.8)),
                                    boxShadow: const [
                                      BoxShadow(color: Colors.black12)
                                    ]
                                ),
                                child: InternationalPhoneNumberInput(
                                  autoValidateMode: AutovalidateMode.always,
                                  countries: ["BJ","SN","TG"],
                                  textFieldController: telephoneController,
                                  errorMessage: "Numéro invalide",
                                  inputBorder: InputBorder.none,
                                  hintText: 'Numéro de téléphone',
                                  formatInput: true,
                                  selectorConfig: SelectorConfig(
                                    showFlags: false,
                                  ),
                                  onInputChanged: (PhoneNumber value) {

                                  },

                                  onInputValidated: (valited){
                                    print(valited);
                                    setState(() {
                                      isValitedPhoneNumber = valited;
                                    });
                                  },

                                ),
                              ),

                              SizedBox(height: Dimensions.height10,),

                              // Mot de passe

                              Container(
                                padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20*0.8)),
                                    boxShadow: const [
                                      BoxShadow(color: Colors.black12)
                                    ]
                                ),
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  cursorHeight: 20,
                                  obscureText: isObscure,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      decoration: TextDecoration.none
                                  ),
                                  controller: passwordController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration:  InputDecoration(
                                      hintText: "* * * * *",
                                      hintStyle: GoogleFonts.poppins(
                                        fontSize: Dimensions.fontText15,
                                        fontWeight: FontWeight.w800,
                                      ),
                                      suffixIcon: InkWell(
                                        onTap: (){
                                          setState(() {
                                            isObscure = !isObscure;
                                          });
                                        },
                                        child: Icon(isObscure?Icons.visibility_off_outlined:Icons.visibility,color: Colors.black,),
                                      ),
                                      border: InputBorder.none
                                  ),
                                  validator: (value){
                                    return value == null || value == "" ? "Ce champs est obligatoire" : null;
                                  },
                                ),
                              ),

                              SizedBox(height: Dimensions.height10,),

                              /*GestureDetector(
                                  onTap: ()async{
                                    setState(() {
                                      isLoading = true;
                                    });
                                    print(telephoneController.text);
                                    if(formKey.currentState!.validate()){
                                      print("Im here");
                                      print(isValitedPhoneNumber);
                                     // await authController.register(lastNameController.text, firstNameController.text, emailController.text, passwordController.text, telephoneController.text);
                                    }
                                    setState(() {
                                      isLoading = false;
                                    });
                                  },
                                  child: Container(
                                    height: Dimensions.height45*1.2,
                                    width: Dimensions.screenwidth*0.85,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20*0.8)),
                                        color: AppColors.buttonColor
                                    ),
                                    child: isLoading ? SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3,)) : BigText(text:"Se connecter",size: 20,),
                                  ),),*/
                              ElevatedButton(onPressed: ()async{
                                setState(() {
                                  isLoading = true;
                                });
                                print(telephoneController.text);
                                if(formKey.currentState!.validate()){
                                  print("Im here");
                                  print(isValitedPhoneNumber);
                                  await authController.register(lastNameController.text, firstNameController.text, emailController.text, passwordController.text, telephoneController.text);
                                }
                                setState(() {
                                  isLoading = false;
                                });
                              }, child: isLoading ? SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3,)) : BigText(text:"Se connecter",size: 20,),),
                              SizedBox(height: Dimensions.height5,),
                              TextButton(onPressed: (){
                                Get.to(()=>LoginPage(),transition: Transition.rightToLeft);
                              }, child: SmallText(text: 'Avez-vous un compte? Connectez-vous',isCenter: true,size: Dimensions.fontText15*0.8,),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )),

          ],
        ),
      ),
    );
  }
}
