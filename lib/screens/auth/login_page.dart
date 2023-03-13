import 'package:bestvoyage/controllers/authController.dart';
import 'package:bestvoyage/screens/auth/register_page.dart';
import 'package:bestvoyage/screens/others/forgot_password.dart';
import 'package:bestvoyage/utils/app_colors.dart';
import 'package:bestvoyage/utils/asset_image_name.dart';
import 'package:bestvoyage/utils/dimensions.dart';
import 'package:bestvoyage/widget/appbutton.dart';
import 'package:bestvoyage/widget/bigText.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../widget/smallText.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthController authController = Get.put(AuthController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool isObscure = true;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Dimensions.screenHeight,
        width: Dimensions.screenwidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesName.background),
            fit: BoxFit.cover
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              //
              Positioned(
                top: Dimensions.height30,
                  left: Dimensions.widtht20,
                  right: Dimensions.widtht20,
                  child: BigText(text: 'Connectez-vous !',size: Dimensions.fontText25,)
              ),
              // image
              Positioned(
                top: Dimensions.height100,
                  left: Dimensions.widtht20,
                  right: Dimensions.widtht20,
                  child: Container(
                    height: Dimensions.height100*2,
                    width: Dimensions.screenwidth/4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImagesName.station),
                        fit: BoxFit.contain
                      )
                    ),
                  )
              ),
              // Session du formulaire de connexion
              Positioned(
                top: Dimensions.height100*3,
                  left: Dimensions.widtht20,
                  right: Dimensions.widtht20,
                  bottom: Dimensions.height100*0.8,
                  child:Container(
                    padding: EdgeInsets.all(Dimensions.widtht10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20)),
                      color: Colors.white
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          BigText(text: "Connexion",size: Dimensions.fontText25*1.3,),
                          SizedBox(height: Dimensions.height20,),
                          Form(
                            key: formKey,
                              child: Column(
                                children: [
                                  // Email field

                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: Dimensions.widtht10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.widtht20*0.8)),
                                    boxShadow: [
                                      BoxShadow(color: Colors.black12)
                                    ]
                                  ),
                                  child: TextFormField(
                                    cursorColor: Colors.black,
                                    cursorHeight: 25,
                                    style: TextStyle(
                                      decoration: TextDecoration.none
                                    ),
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration:  InputDecoration(
                                      hintText: "Email address",
                                      hintStyle: GoogleFonts.poppins(
                                        fontSize: Dimensions.fontText15,
                                        fontWeight: FontWeight.w800,
                                      ),
                                      border: InputBorder.none
                                    ),
                                    validator: (value) {
                                      return value == null || value == "" ? "Ce champs est obligatoire" : null;
                                    },
                                  ),
                                ),

                                  SizedBox(height: Dimensions.height10,),

                                  //Password Field

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
                                      validator: (value) {
                                        return value == null || value == "" ? "Ce champs est obligatoire" : null;
                                      },
                                    ),
                                  ),
                                  SizedBox(height: Dimensions.height20,),
                                  // connexionButton

                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        // text color
                                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15), // padding
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // border radius
                                        textStyle: TextStyle(fontSize: 18), // text style
                                        elevation: 5,
                                      ),
                                      onPressed: ()async{

                                        if(formKey.currentState!.validate()){
                                          setState(() {
                                            isLoading = true;
                                          });
                                          await authController.signInWithEmailAndPassword(emailController.text, passwordController.text);
                                          setState(() {
                                            isLoading = false;
                                          });
                                        }

                                  }, child: isLoading?const Center(child: CircularProgressIndicator(color: Colors.white,),):BigText(text: "Connectez-vous",color: Colors.white,)),



                                  SizedBox(height: Dimensions.height10,),
                                  TextButton(onPressed: (){
                                    Get.to(()=>RegisterPage(),transition: Transition.rightToLeft);
                                  }, child: SmallText(text: 'Avez-vous un compte? Créer un compte',isCenter: true,size: Dimensions.fontText15*0.8,),),

                                  TextButton(onPressed: (){
                                  Get.to(()=>ForgotPasswordPage());
                                  }, child: BigText(text: "Mot de passe oublié?",color: Colors.purple,isCenter: true,size: Dimensions.fontText15*0.8,))
                                ],
                              )
                          )

                        ],
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
